part of 'scanner_bloc.dart';

sealed class ScannerState extends Equatable {
  const ScannerState();
}

final class ScannerInitial extends ScannerState {
  @override
  List<Object> get props => [];
}

final class ImageState extends ScannerState {
  final String path;

  const ImageState({required this.path});

  @override
  List<Object> get props => [path];
}


final class LoadingState extends ScannerState {
  final bool isLoading;

  const LoadingState({required this.isLoading});

  @override
  List<Object> get props => [isLoading];
}

final class ListRectState extends ScannerState {
  final List<Rect> listRect;

  const ListRectState({required this.listRect});

  @override
  List<Object> get props => [listRect];
}

final class ListRectSelectedState extends ScannerState {
  final List<Rect> listRect;
  final int hash;

  const ListRectSelectedState({required this.listRect, required this.hash});

  @override
  List<Object> get props => [listRect, hash];
}

final class ShowCalculatorState extends ScannerState {
  final String input;

  const ShowCalculatorState({required this.input});

  @override
  List<Object> get props => [input];
}
