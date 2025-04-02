import 'package:calc_pro/core/extensions/context_extension.dart';
import 'package:calc_pro/data/models/history.dart';
import 'package:calc_pro/data/usecase/delete_all_history_use_case.dart';
import 'package:calc_pro/data/usecase/delete_history_use_case.dart';
import 'package:calc_pro/data/usecase/get_list_history_use_case.dart';
import 'package:calc_pro/ui/routers/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'history_event.dart';

part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc({
    required GetListHistoryUseCase getListHistoryUseCase,
    required DeleteAllHistoryUseCase deleteAllHistoryUseCase,
    required DeleteHistoryUseCase deleteHistoryUseCase,
  })  : _deleteHistoryUseCase = deleteHistoryUseCase,
        _deleteAllHistoryUseCase = deleteAllHistoryUseCase,
        _getListHistoryUseCase = getListHistoryUseCase,
        super(HistoryInitial()) {
    on<InitialEvent>(_init);
    on<DeleteEvent>(_delete);
    on<DeleteAllEvent>(_deleteAll);
    on<BackEvent>(_back);
  }

  final GetListHistoryUseCase _getListHistoryUseCase;
  final DeleteAllHistoryUseCase _deleteAllHistoryUseCase;
  final DeleteHistoryUseCase _deleteHistoryUseCase;
  final List<History> _data = [];

  ///Tạo một hash mới dựa vào [DateTime.now().millisecondsSinceEpoch]
  int get _hash => DateTime.now().millisecondsSinceEpoch;

  ///Lấy dữ liệu
  void _init(InitialEvent event, Emitter<HistoryState> emit) async {
    emit(LoadingState());
    final data = await _getListHistoryUseCase.call(offset: _data.length);
    _data.addAll(data);
    emit(LoadedState(data: _data, hash: _hash));
  }

  ///Xóa một phần tử theo id
  void _delete(DeleteEvent event, Emitter<HistoryState> emit) {
    _data.removeWhere((e) => e.id == event.id);
    emit(LoadedState(data: _data, hash: _hash));
    _deleteHistoryUseCase.call(id: event.id);
  }

  ///Xóa tất cả lịch sử
  void _deleteAll(DeleteAllEvent event, Emitter<HistoryState> emit) async {
    final result = await AppRouter.context
        .showDialogCustom(type: DialogCustom.deleteAllHistory) as bool?;
    if (result != true) return;
    _data.clear();
    emit(LoadedState(data: _data, hash: _hash));
    _deleteAllHistoryUseCase.call();
  }

  ///Quay trở về màn hình trước và trả về dữ liệu nếu có
  void _back(BackEvent event, Emitter<HistoryState> emit) {
    AppRouter.pop(event.argument);
  }
}
