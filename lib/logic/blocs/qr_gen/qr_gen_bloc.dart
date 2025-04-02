import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:calc_pro/core/strings/generated/l10n.dart';
import 'package:calc_pro/data/usecase/get_version_qr_code_use_case.dart';
import 'package:calc_pro/data/usecase/set_version_qr_code_use_case.dart';
import 'package:calc_pro/ui/routers/app_router.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_flutter/qr_flutter.dart';

part 'qr_gen_event.dart';

part 'qr_gen_state.dart';

class QrGenBloc extends Bloc<QrGenEvent, QrGenState> {
  QrGenBloc({
    required GetVersionQrCodeUseCase getVersionQrCodeUseCase,
    required SetVersionQrCodeUseCase setVersionQrCodeUseCase,
  })  : _getVersionQrCodeUseCase = getVersionQrCodeUseCase,
        _setVersionQrCodeUseCase = setVersionQrCodeUseCase,
        super(QrGenInitial()) {
    on<InitialEvent>(_init);
    on<OnChangeTextEvent>(_onChangeText);
    on<ChangeVersionEvent>(_changeVersion);
    on<GenerateQrEvent>(_generateQr);
  }

  final GetVersionQrCodeUseCase _getVersionQrCodeUseCase;
  final SetVersionQrCodeUseCase _setVersionQrCodeUseCase;
  late int _version;

  String _text = '';

  void _init(InitialEvent event, Emitter<QrGenState> emit) async {
    _version = await _getVersionQrCodeUseCase.call();
    emit(ResultState(text: _text, version: _version));
  }

  void _onChangeText(OnChangeTextEvent event, Emitter<QrGenState> emit) {
    _text = event.text;
    emit(ResultState(text: _text, version: _version));
  }

  void _changeVersion(ChangeVersionEvent event, Emitter<QrGenState> emit) {
    _version = event.version.ceil();
    _version = _version == 0 ? QrVersions.auto : _version;
    emit(ResultState(text: _text, version: _version));
    _setVersionQrCodeUseCase.call(version: _version);
  }

  void _generateQr(GenerateQrEvent event, Emitter<QrGenState> emit) async {
    try {
      PermissionStatus status;
      if (Platform.isAndroid) {
        final deviceInfoPlugin = DeviceInfoPlugin();
        final deviceInfo = await deviceInfoPlugin.androidInfo;
        final sdkInt = deviceInfo.version.sdkInt;
        if (sdkInt < 33) {
          status = await Permission.storage.request();
        } else {
          status = await Permission.photos.request();
        }
      } else {
        status = await Permission.storage.request();
      }
      if (status.isGranted) {
        emit(LoadingState(isLoading: true));
        RenderRepaintBoundary boundary = event.qrKey.currentContext!
            .findRenderObject() as RenderRepaintBoundary;
        ui.Image image = await boundary.toImage();
        ByteData? byteData =
            await (image.toByteData(format: ui.ImageByteFormat.png));
        if (byteData == null) throw Exception('byteData is null');
        final result = await ImageGallerySaverPlus.saveImage(
            byteData.buffer.asUint8List());
        if (result['isSuccess'] != true) throw Exception('Save error');
        AppRouter.showMessageSuccess(S.current.image_saved_successfully);
      }
    } catch (e) {
      debugPrint('QR_GEN_ERROR: $e');
      AppRouter.showMessageError(S.current.failed_to_save_image);
    } finally {
      emit(LoadingState(isLoading: false));
    }
  }
}
