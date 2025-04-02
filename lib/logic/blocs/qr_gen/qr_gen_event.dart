part of 'qr_gen_bloc.dart';

sealed class QrGenEvent extends Equatable {
  const QrGenEvent();
}

final class InitialEvent extends QrGenEvent {
  const InitialEvent();

  @override
  List<Object?> get props => [];
}

final class OnChangeTextEvent extends QrGenEvent {
  final String text;

  const OnChangeTextEvent({required this.text});

  @override
  List<Object?> get props => [text];
}

final class ChangeVersionEvent extends QrGenEvent {
  final double version;

  const ChangeVersionEvent({required this.version});

  @override
  List<Object?> get props => [version];
}


final class GenerateQrEvent extends QrGenEvent {
  final GlobalKey qrKey;
  const GenerateQrEvent({required this.qrKey});

  @override
  List<Object?> get props => [qrKey];
}