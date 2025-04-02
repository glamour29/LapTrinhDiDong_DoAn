import 'package:calc_pro/data/models/subscription.dart';
import 'package:isar/isar.dart';

abstract interface class SubscriptionRepository {
  Future<int> save({required Subscription subscription});

  Future<Subscription?> get();
}

class SubscriptionRepositoryImpl implements SubscriptionRepository {
  const SubscriptionRepositoryImpl({required Isar isar}) : _isar = isar;
  final Isar _isar;

  @override
  Future<Subscription?> get() => _isar.txn(() => _isar.subscriptions.get(0));

  @override
  Future<int> save({required Subscription subscription}) =>
      _isar.writeTxn(() => _isar.subscriptions.put(subscription));
}
