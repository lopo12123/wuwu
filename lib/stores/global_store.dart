import 'package:get/get.dart';
import 'package:wuwu/stores/collections/consumption.dart';
import 'package:wuwu/stores/collections/tag.dart';
import 'package:wuwu/stores/db_store.dart';
import 'package:wuwu/utils/my_toast.dart';
import 'package:wuwu/utils/safe_print.dart';

class GlobalStoreImpl extends GetxService {
  static GlobalStoreImpl get store => Get.find<GlobalStoreImpl>();

  final RxList<Tag> tags = <Tag>[].obs;

  Future<void> addTag(Tag tag) async {
    await DBStoreImpl.addTag(tag);
    tags.add(tag);
  }

  Future<void> deleteTag(int tagId) async {
    await DBStoreImpl.deleteTag(tagId);
    tags.removeWhere((tag) => tag.id == tagId);
  }

  final RxList<Consumption> records = <Consumption>[].obs;

  Future<void> init({toast = false, tag = false, consumption = false}) async {
    await DBStoreImpl.init();

    if (tag) {
      tags(await DBStoreImpl.getAllTags());
      SafePrint.info('[GlobalStoreImpl] init(tag) done.');
    }

    if (toast) MyToast.success('刷新成功');
  }
}
