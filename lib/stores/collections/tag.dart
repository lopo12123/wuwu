import 'package:isar/isar.dart';

part 'tag.g.dart';

@collection
class Tag {
  Id id = Isar.autoIncrement;

  /// 标签名
  String? tagName;

  /// 标签颜色十六进制值
  int? colorHex;
}
