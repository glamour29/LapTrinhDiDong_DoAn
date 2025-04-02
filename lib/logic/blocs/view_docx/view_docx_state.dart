part of 'view_docx_bloc.dart';

sealed class ViewDocxState extends Equatable {
  const ViewDocxState();
}

final class ViewDocxInitial extends ViewDocxState {
  @override
  List<Object> get props => [];
}



final class FileState extends ViewDocxState {
  final String path;

  const FileState({required this.path});

  @override
  List<Object> get props => [path];
}
