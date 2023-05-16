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
}
