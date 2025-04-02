import 'package:calc_pro/data/models/history.dart';
import 'package:calc_pro/data/repositories/history_repository.dart';

class InsertHistoryUseCase {
  final HistoryRepository _historyRepository;

  const InsertHistoryUseCase({required HistoryRepository historyRepository})
      : _historyRepository = historyRepository;

  Future<int> call({required History history}) =>
      _historyRepository.insert(history: history);
}
