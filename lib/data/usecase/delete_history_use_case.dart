import 'package:calc_pro/data/repositories/history_repository.dart';

class DeleteHistoryUseCase {
  final HistoryRepository _historyRepository;

  const DeleteHistoryUseCase({required HistoryRepository historyRepository})
      : _historyRepository = historyRepository;

  Future<bool> call({required int id}) => _historyRepository.delete(id: id);
}
