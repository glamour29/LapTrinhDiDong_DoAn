part of 'camera_bloc.dart';

sealed class CameraEvent extends Equatable {
  const CameraEvent();
}

final class InitialEvent extends CameraEvent {
  final BuildContext context;
  const InitialEvent({required this.context});

  @override
  List<Object?> get props => [context];
}

final class ToggleFlashEvent extends CameraEvent {
  const ToggleFlashEvent();

  @override
  List<Object?> get props => [];
}

final class CaptureEvent extends CameraEvent {
  const CaptureEvent();

  @override
  List<Object?> get props => [];
}

final class PickPhotoEvent extends CameraEvent {
const PickPhotoEvent();

@override
List<Object?> get props => [];
}