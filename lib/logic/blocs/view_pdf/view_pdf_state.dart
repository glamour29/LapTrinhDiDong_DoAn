part of 'view_pdf_bloc.dart';

sealed class ViewPdfState extends Equatable {
  const ViewPdfState();
}

final class ViewPdfInitial extends ViewPdfState {
  @override
  List<Object> get props => [];
}

final class FileState extends ViewPdfState {
  final String? path;

  const FileState({required this.path});

  @override
  List<Object?> get props => [path];
}
