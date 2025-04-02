part of 'translate_bloc.dart';

sealed class TranslateEvent extends Equatable {
  const TranslateEvent();
}

final class InitialEvent extends TranslateEvent {
  final BuildContext context;

  const InitialEvent({required this.context});

  @override
  List<Object?> get props => [context];
}

final class SelectedLanguageEvent extends TranslateEvent {
  final String languageCode;

  const SelectedLanguageEvent({required this.languageCode});

  @override
  List<Object?> get props => [languageCode];
}

final class OnPanStartEvent extends TranslateEvent {
  final DragStartDetails details;

  const OnPanStartEvent({required this.details});

  @override
  List<Object?> get props => [details];
}

final class OnPanUpdateEvent extends TranslateEvent {
  final DragUpdateDetails details;

  const OnPanUpdateEvent({required this.details});

  @override
  List<Object?> get props => [details];
}

final class OnPanEndEvent extends TranslateEvent {

  const OnPanEndEvent();

  @override
  List<Object?> get props => [];
}

final class SelectedTypeEvent extends TranslateEvent {
  final int index;

  const SelectedTypeEvent({required this.index});

  @override
  List<Object?> get props => [index];
}

final class OnSwipeStartEvent extends TranslateEvent {
  final DragStartDetails details;

  const OnSwipeStartEvent({required this.details});

  @override
  List<Object?> get props => [details];
}

final class OnSwipeUpdateEvent extends TranslateEvent {
  final DragUpdateDetails details;

  const OnSwipeUpdateEvent({required this.details});

  @override
  List<Object?> get props => [details];
}

final class OnSwipeEndEvent extends TranslateEvent {

  const OnSwipeEndEvent();

  @override
  List<Object?> get props => [];
}

final class ResultEvent extends TranslateEvent {
  final String result;

  const ResultEvent({required this.result});

  @override
  List<Object?> get props => [result];
}

final class CopyEvent extends TranslateEvent {
  final String text;

  const CopyEvent({required this.text});

  @override
  List<Object?> get props => [text];
}

