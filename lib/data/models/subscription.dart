import 'package:isar/isar.dart';

part 'subscription.g.dart';

@collection
class Subscription {
  final Id id;
  final DateTime startDate;
  final DateTime expiryDate;
  final String productId;

  const Subscription({
    this.id = 0,
    required this.startDate,
    required this.expiryDate,
    required this.productId,
  });

  bool get isVip => expiryDate.isAfter(DateTime.now());
}
