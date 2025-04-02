part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

final class InitialState extends HomeState {
  const InitialState();

  @override
  List<Object?> get props => [];
}

final class LoadingState extends HomeState {
  const LoadingState();

  @override
  List<Object?> get props => [];
}

final class ResultState extends HomeState {
  final String result;

  const ResultState(this.result);

  @override
  List<Object?> get props => [result];
}

final class ListPainState extends HomeState {
  final List<List<Offset>> listOffsets;
  final int hash;

  const ListPainState({required this.listOffsets, required this.hash});

  @override
  List<Object> get props => [listOffsets, hash];
}
