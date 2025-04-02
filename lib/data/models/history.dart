import 'package:isar/isar.dart';

part 'history.g.dart';

@collection
class History {
  Id id = DateTime.now().millisecondsSinceEpoch;
  String value;

  History(this.value);
  History.mapping({required this.id,required this.value});

  Map<String, dynamic> toJson() => {'id': id, 'value': value};

  factory History.fromJson(dynamic json)  =>  History.mapping(id: json['id'], value: json['value']);
}
