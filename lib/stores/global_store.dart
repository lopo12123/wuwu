import 'package:get/get.dart';
import 'package:wuwu/stores/collections/consumption.dart';
import 'package:wuwu/stores/collections/tag.dart';
import 'package:wuwu/stores/db_store.dart';
import 'package:wuwu/utils/safe_print.dart';

class GlobalStoreImpl extends GetxService {
  static GlobalStoreImpl get store => Get.find<GlobalStoreImpl>();

  final RxList<Tag> tags = <Tag>[].obs;
  final RxList<Consumption> records = <Consumption>[].obs;

  Future<void> init() async {
    var t = await DBStoreImpl.getAllTags();
    if (t.ok) {
      tags(t.value);
    } else {
      SafePrint.warn('[GlobalStoreImpl] init. partial failed. (tag)');
    }
  }
}
