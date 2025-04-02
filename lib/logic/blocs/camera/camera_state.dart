part of 'camera_bloc.dart';

sealed class CameraState extends Equatable {
  const CameraState();
}

final class CameraInitial extends CameraState {
  @override
  List<Object> get props => [];
}

final class CameraLoadedState extends CameraState {
  final CameraController controller;

  const CameraLoadedState({required this.controller});

  @override
  List<Object> get props => [controller];
}

final class FlashState extends CameraState{
  final bool enable;
  const FlashState({required this.enable});
  @override
  List<Object> get props => [enable];
}