part of 'splash_bloc.dart';

sealed class SplashEvent extends Equatable {
  const SplashEvent();
}

final class InitialEvent extends SplashEvent {
  const InitialEvent();
  @override
  List<Object?> get props => [];
}
