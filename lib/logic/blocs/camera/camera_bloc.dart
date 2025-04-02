import 'package:calc_pro/core/strings/generated/l10n.dart';
import 'package:calc_pro/ui/routers/app_router.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'camera_event.dart';

part 'camera_state.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  CameraBloc() : super(CameraInitial()) {
    on<InitialEvent>(_init);
    on<ToggleFlashEvent>(_toggleFlash);
    on<CaptureEvent>(_capture);
    on<PickPhotoEvent>(_pickPhoto);
  }

  CameraController? _cameraController;
  bool _flashOn = false;
  late String _destination;

  void _init(InitialEvent event, Emitter<CameraState> emit) async {
    try {
      _destination = ModalRoute.of(event.context)!.settings.arguments as String;
      final cameras = await availableCameras();
      if (cameras.isEmpty) throw Exception("Camera not found");
      _cameraController = CameraController(cameras[0], ResolutionPreset.max);
      await _cameraController!.initialize();
      final minZoom = await _cameraController!.getMinZoomLevel();
      await _cameraController!.setZoomLevel(minZoom);
      emit(CameraLoadedState(controller: _cameraController!));
      emit(FlashState(enable: _flashOn));
    } catch (e) {
      debugPrint('OPEN_CAMERA_ERROR: $e');
      AppRouter.pop();
      AppRouter.showMessageError(S.current.open_camera_failed);
    }
  }

  void _toggleFlash(ToggleFlashEvent event, Emitter<CameraState> emit) async {
    final currentState = _flashOn;
    _flashOn = !_flashOn;
    emit(FlashState(enable: _flashOn));
    try {
      if (_flashOn) {
        await _cameraController?.setFlashMode(FlashMode.torch);
      } else {
        await _cameraController?.setFlashMode(FlashMode.off);
      }
    } catch (e) {
      debugPrint('CAMERA_FLASH_ERROR: $e');
      _flashOn = currentState;
      emit(FlashState(enable: _flashOn));
    }
  }

  void _capture(CaptureEvent event, Emitter<CameraState> emit) async {
    try {
      final xFile = await _cameraController!.takePicture();
      AppRouter.pushReplacementNamed(_destination, arguments: xFile);
    } catch (e) {
      debugPrint('TAKE_PICTURE_ERROR: $e');
      AppRouter.pop();
      AppRouter.showMessageError(S.current.error);
    }
  }

  void _pickPhoto(PickPhotoEvent event, Emitter<CameraState> emit) async {
    try {
      final xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (xFile == null) AppRouter.pop();
      AppRouter.pushReplacementNamed(_destination, arguments: xFile);
    } catch (e) {
      debugPrint('PICK_PHOTO_ERROR: $e');
      AppRouter.pop();
      AppRouter.showMessageError(S.current.error);
    }
  }

  @override
  Future<void> close() {
    _cameraController?.dispose();
    return super.close();
  }
}
