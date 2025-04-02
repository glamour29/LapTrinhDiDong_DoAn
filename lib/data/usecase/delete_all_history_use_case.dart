import 'package:calc_pro/data/repositories/history_repository.dart';

class DeleteAllHistoryUseCase {
  final HistoryRepository _historyRepository;

  const DeleteAllHistoryUseCase({required HistoryRepository historyRepository})
      : _historyRepository = historyRepository;

  Future<void> call() => _historyRepository.deleteAll();
}
