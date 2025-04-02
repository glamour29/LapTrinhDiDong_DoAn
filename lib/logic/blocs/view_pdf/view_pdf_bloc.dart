import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'view_pdf_event.dart';

part 'view_pdf_state.dart';

class ViewPdfBloc extends Bloc<ViewPdfEvent, ViewPdfState> {
  ViewPdfBloc() : super(ViewPdfInitial()) {
    on<ChoosePdfFileEvent>(_choosePdfFile);
  }

  void _choosePdfFile(
      ChoosePdfFileEvent event, Emitter<ViewPdfState> emit) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result == null || result.files.isEmpty) return;
    final path = result.files.first.path;
    emit(FileState(path: path!));
  }
}
