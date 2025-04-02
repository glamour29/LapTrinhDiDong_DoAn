part of 'view_docx_bloc.dart';

sealed class ViewDocxEvent extends Equatable {
  const ViewDocxEvent();
}

final class ChoosePdfFileEvent extends ViewDocxEvent {
  const ChoosePdfFileEvent();

  @override
  List<Object?> get props => [];
}
