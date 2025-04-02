import 'package:calc_pro/data/models/history.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_auth_quick/fire_auth_quick.dart';
import 'package:isar/isar.dart';

abstract interface class HistoryRepository {
  Future<int> insert({required History history});

  Future<List<History>> getList({required int offset});

  Future<bool> delete({required int id});

  Future<void> deleteAll();
}

class HistoryRemoteRepositoryImpl implements HistoryRepository {
  @override
  Future<int> insert({required History history}) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FireAuthQuick.currentUser!.uid)
        .collection("history")
        .doc(history.id.toString())
        .set(history.toJson(), SetOptions(merge: true));
    return history.id;
  }

  @override
  Future<List<History>> getList({required int offset}) async {
    final snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(FireAuthQuick.currentUser!.uid)
        .collection("history")
        .get();
    return snapshot.docs.map((e) => History.fromJson(e.data())).toList();
  }

  @override
  Future<void> deleteAll() => FirebaseFirestore.instance
      .collection("users")
      .doc(FireAuthQuick.currentUser!.uid)
      .delete();

  @override
  Future<bool> delete({required int id}) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FireAuthQuick.currentUser!.uid)
        .collection("history")
        .doc(id.toString())
        .delete();
    return true;
  }
}

class HistoryRepositoryImpl implements HistoryRepository {
  final Isar _isar;

  const HistoryRepositoryImpl({required Isar isar}) : _isar = isar;

  @override
  Future<bool> delete({required int id}) =>
      _isar.writeTxn(() => _isar.historys.delete(id));

  @override
  Future<void> deleteAll() => _isar.writeTxn(() => _isar.historys.clear());

  @override
  Future<List<History>> getList({required int offset}) => _isar.txn(() =>
      _isar.historys.where(sort: Sort.desc).anyId().offset(offset).findAll());

  @override
  Future<int> insert({required History history}) =>
      _isar.writeTxn(() => _isar.historys.put(history));
}
