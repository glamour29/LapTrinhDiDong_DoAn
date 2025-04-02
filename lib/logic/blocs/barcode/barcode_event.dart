part of 'barcode_bloc.dart';

sealed class BarcodeEvent extends Equatable {
  const BarcodeEvent();
}

final class InitialEvent extends BarcodeEvent {
  const InitialEvent();
  @override
  List<Object?> get props => [];
}

final class OnChangeTextEvent extends BarcodeEvent {
  final String text;
  const OnChangeTextEvent({required this.text});
  @override
  List<Object?> get props => [text];
}

final class OnChangeBarcodeTypeEvent extends BarcodeEvent {
  final BarcodeType type;
  const OnChangeBarcodeTypeEvent({required this.type});
  @override
  List<Object?> get props => [type];
}

final class GenerateEvent extends BarcodeEvent {
  final GlobalKey key;
  const GenerateEvent({required this.key});
  @override
  List<Object?> get props => [key];
}
