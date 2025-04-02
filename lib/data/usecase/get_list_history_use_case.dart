import 'package:calc_pro/data/models/history.dart';
import 'package:calc_pro/data/repositories/history_repository.dart';

class GetListHistoryUseCase {
  final HistoryRepository _historyRepository;

  const GetListHistoryUseCase({required HistoryRepository historyRepository})
      : _historyRepository = historyRepository;

  Future<List<History>> call({required int offset}) =>
      _historyRepository.getList(offset: offset);
}
