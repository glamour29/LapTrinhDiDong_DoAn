import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:barcode_widget/barcode_widget.dart';
import 'package:calc_pro/core/strings/generated/l10n.dart';
import 'package:calc_pro/data/usecase/get_barcode_type_use_case.dart';
import 'package:calc_pro/data/usecase/set_barcode_type_use_case.dart';
import 'package:calc_pro/ui/routers/app_router.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:permission_handler/permission_handler.dart';

part 'barcode_event.dart';

part 'barcode_state.dart';

class BarcodeBloc extends Bloc<BarcodeEvent, BarcodeState> {
  BarcodeBloc({
    required GetBarcodeTypeUseCase getBarcodeTypeUseCase,
    required SetBarcodeTypeUseCase setBarcodeTypeUseCase,
  })  : _getBarcodeTypeUseCase = getBarcodeTypeUseCase,
        _setBarcodeTypeUseCase = setBarcodeTypeUseCase,
        super(BarcodeInitial()) {
    on<InitialEvent>(_init);
    on<OnChangeTextEvent>(_onChangeText);
    on<OnChangeBarcodeTypeEvent>(_onChangeBarcodeType);
    on<GenerateEvent>(_generate);
  }

  final GetBarcodeTypeUseCase _getBarcodeTypeUseCase;
  final SetBarcodeTypeUseCase _setBarcodeTypeUseCase;
  String _data = '';
  late BarcodeType _barcodeType;

  void _init(InitialEvent event, Emitter<BarcodeState> emit) async {
    _barcodeType = await _getBarcodeTypeUseCase.call();
    emit(BarcodeTypeState(type: _barcodeType));
    emit(ResultState(data: _data, barcodeType: _barcodeType));
  }

  void _onChangeText(OnChangeTextEvent event, Emitter<BarcodeState> emit) {
    _data = event.text;
    emit(ResultState(data: _data, barcodeType: _barcodeType));
  }

  void _onChangeBarcodeType(
      OnChangeBarcodeTypeEvent event, Emitter<BarcodeState> emit) {
    _barcodeType = event.type;
    emit(BarcodeTypeState(type: _barcodeType));
    emit(ResultState(data: _data, barcodeType: _barcodeType));
    _setBarcodeTypeUseCase.call(type: _barcodeType);
  }

  void _generate(GenerateEvent event, Emitter<BarcodeState> emit) async {
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
        RenderRepaintBoundary boundary = event.key.currentContext!
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
