part of 'history_bloc.dart';

sealed class HistoryEvent extends Equatable {
  const HistoryEvent();
}

final class InitialEvent extends HistoryEvent {
  const InitialEvent();

  @override
  List<Object?> get props => [];
}

final class DeleteEvent extends HistoryEvent {
  final int id;

  const DeleteEvent({required this.id});

  @override
  List<Object?> get props => [id];
}

final class DeleteAllEvent extends HistoryEvent {
  const DeleteAllEvent();

  @override
  List<Object?> get props => [];
}

final class BackEvent extends HistoryEvent {
  final Object? argument;

  const BackEvent({this.argument});

  @override
  List<Object?> get props => [argument];
}
