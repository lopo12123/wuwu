import 'package:isar/isar.dart';

part 'record.g.dart';

@collection
class Record {
  Id id = Isar.autoIncrement;

  /// 创建时间
  @Index()
  DateTime? createTime;

  /// 是否是收入
  @Index()
  bool? income;

  /// 金额
  @Index()
  double? amount;

  /// 描述
  String? desc;

  /// 标签
  List<int>? tags;


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createTime': createTime?.toIso8601String(),
      'income': income,
      'amount': amount,
      'desc': desc,
      'tags': tags,
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
