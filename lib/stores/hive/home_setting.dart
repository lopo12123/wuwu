import 'package:hive/hive.dart';

part 'home_setting.g.dart';

@HiveType(typeId: 0)
class HomeSetting extends HiveObject {
  /// 展示类型
  ///
  /// - 0: 全部
  /// - 1: 支出
  /// - 2: 收入
  @HiveField(0)
  int type;

  /// 展示长度
  @HiveField(1)
  int count;

  HomeSetting({required this.type, required this.count});

  static HomeSetting get defaultValue => HomeSetting(type: 0, count: 5);
}
