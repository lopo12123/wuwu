import 'package:get/get.dart';
import 'package:wuwu/stores/collections/consumption.dart';
import 'package:wuwu/stores/collections/tag.dart';
import 'package:wuwu/stores/db_store.dart';
import 'package:wuwu/utils/my_toast.dart';
import 'package:wuwu/utils/safe_print.dart';

class GlobalStoreImpl extends GetxService {
  /// 单例
  static GlobalStoreImpl get store => Get.find<GlobalStoreImpl>();

  // region 首页

  // endregion

  // region 标签
  /// 全部标签
  final RxList<Tag> tags = <Tag>[].obs;

  /// 新建标签
  Future<void> addTag(String tagName, int tagColor) async {
    Tag tag = Tag()
      ..tagName = tagName
      ..colorHex = tagColor
      ..createTime = DateTime.now();
    await DBStoreImpl.addTag(tag);
    tags.add(tag);
  }

  /// 删除标签
  Future<void> deleteTag(int tagId) async {
    await DBStoreImpl.deleteTag(tagId);
    tags.removeWhere((tag) => tag.id == tagId);
  }

  // endregion

  // final RxList<Consumption> records = <Consumption>[].obs;

  /// 同步数据
  Future<void> sync({toast = false, tag = false, consumption = false}) async {
    if (tag) {
      tags(await DBStoreImpl.getAllTags());
      SafePrint.info('[GlobalStoreImpl] init(tag) done.');
    }

    if (toast) MyToast.success('刷新成功');
  }

  /// 初始化 isar、hive 等
  Future<void> init() async {
    await DBStoreImpl.init();
  }
}
