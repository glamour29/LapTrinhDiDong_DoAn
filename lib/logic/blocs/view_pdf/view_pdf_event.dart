part of 'view_pdf_bloc.dart';

sealed class ViewPdfEvent extends Equatable {
  const ViewPdfEvent();
}



final class ChoosePdfFileEvent extends ViewPdfEvent {
  const ChoosePdfFileEvent();

  @override
  List<Object?> get props => [];
}
