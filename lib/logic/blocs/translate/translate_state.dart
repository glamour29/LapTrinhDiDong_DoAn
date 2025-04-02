part of 'translate_bloc.dart';

sealed class TranslateState extends Equatable {
  const TranslateState();
}

final class TranslateInitial extends TranslateState {
  @override
  List<Object> get props => [];
}

final class LoadingState extends TranslateState {
  final bool isLoading;

  const LoadingState({required this.isLoading});

  @override
  List<Object> get props => [isLoading];
}

final class ImageState extends TranslateState {
  final String path;

  const ImageState({required this.path});

  @override
  List<Object> get props => [path];
}

final class ListRectState extends TranslateState {
  final List<Rect> listRect;
  final bool isShow;

  const ListRectState({required this.listRect, required this.isShow});

  @override
  List<Object> get props => [listRect, isShow];
}

final class RectAreaState extends TranslateState {
  final Rect rectArea;
  final bool isShow;

  const RectAreaState({required this.rectArea, required this.isShow});

  @override
  List<Object> get props => [rectArea, isShow];
}

final class LanguageState extends TranslateState {
  final String languageCode;

  const LanguageState({required this.languageCode});

  @override
  List<Object> get props => [languageCode];
}

/// 0 rect area, 1 swipe
final class TypeState extends TranslateState {
  final int type;

  const TypeState({required this.type});

  @override
  List<Object> get props => [type];
}

class ListRectSelectedState extends TranslateState {
  final List<Rect> listRectSelected;
  final int hash;
  final bool isShow;

  const ListRectSelectedState(
      {required this.listRectSelected,
      required this.hash,
      required this.isShow});

  @override
  List<Object> get props => [listRectSelected, hash, isShow];
}

final class ResultState extends TranslateState {
  final String result;

  const ResultState({required this.result});

  @override
  List<Object> get props => [result];
}
