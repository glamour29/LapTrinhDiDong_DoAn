part of 'qr_gen_bloc.dart';

sealed class QrGenState extends Equatable {
  const QrGenState();
}

final class QrGenInitial extends QrGenState {
  @override
  List<Object> get props => [];
}

final class ResultState extends QrGenState {
  final String text;
  final int version;

  const ResultState({required this.text,required this.version});

  @override
  List<Object> get props => [text, version];
}

final class LoadingState extends QrGenState {
  final bool isLoading;

  const LoadingState({required this.isLoading});

  @override
  List<Object> get props => [isLoading];
}
