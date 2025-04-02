part of 'scanner_bloc.dart';

sealed class ScannerEvent extends Equatable {
  const ScannerEvent();
}

final class InitialEvent extends ScannerEvent {
  final BuildContext context;

  const InitialEvent({required this.context});

  @override
  List<Object> get props => [context];
}

final class TapEvent extends ScannerEvent {
  final TapDownDetails details;

  const TapEvent({required this.details});

  @override
  List<Object> get props => [details];
}

final class RollBackEvent extends ScannerEvent {
  const RollBackEvent();

  @override
  List<Object> get props => [];
}


final class ShowCalculatorEvent extends ScannerEvent {
  const ShowCalculatorEvent();

  @override
  List<Object> get props => [];
}

final class DismissCalculatorEvent extends ScannerEvent {
  const DismissCalculatorEvent();

  @override
  List<Object> get props => [];
}
