part of 'history_bloc.dart';

sealed class HistoryState extends Equatable {
  const HistoryState();
}

final class HistoryInitial extends HistoryState {
  @override
  List<Object> get props => [];
}

final class LoadingState extends HistoryState {
  const LoadingState();

  @override
  List<Object> get props => [];
}

final class LoadedState extends HistoryState {
  final List<History> data;
  final int hash;

  const LoadedState({required this.data, required this.hash});

  @override
  List<Object> get props => [data, hash];
}
