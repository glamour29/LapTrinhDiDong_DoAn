part of 'barcode_bloc.dart';

sealed class BarcodeState extends Equatable {
  const BarcodeState();
}

final class BarcodeInitial extends BarcodeState {
  @override
  List<Object> get props => [];
}

final class ResultState extends BarcodeState {
  final String data;
  final BarcodeType barcodeType;

  const ResultState({required this.data, required this.barcodeType});

  @override
  List<Object> get props => [data, barcodeType];
}

final class BarcodeTypeState extends BarcodeState {
  final BarcodeType type;

  const BarcodeTypeState({required this.type});

  @override
  List<Object> get props => [type];
}



final class LoadingState extends BarcodeState {
  final bool isLoading;

  const LoadingState({required this.isLoading});

  @override
  List<Object> get props => [isLoading];
}
