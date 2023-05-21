import 'package:get/get.dart';
import 'package:wuwu/stores/hive_store.dart';
import 'package:wuwu/stores/isar/tag.dart';
import 'package:wuwu/stores/db_store.dart';
import 'package:wuwu/utils/my_toast.dart';
import 'package:wuwu/utils/safe_print.dart';

bool _equal(Iterable<int> l1, Iterable<int> l2) {
  if (l1.length != l2.length) return false;

  for (int i = 0; i < l1.length; i++) {
    if (l1.elementAt(i) != l2.elementAt(i)) return false;
  }

  return true;
}

class GlobalStoreImpl extends GetxService {
  /// 单例
  static GlobalStoreImpl get store => Get.find<GlobalStoreImpl>();

  // region 首页
  /// 展示类型
  final RxInt homeListType = 0.obs;

  /// 展示数量
  final RxInt homeListCount = 5.obs;

  /// 切换展示类型
  Future<void> changeType(int v) async {
    if (homeListType.value == v) return;

    await HiveStoreImpl.setHomeSetting(type: v);
    homeListType(v);
  }

  /// 切换展示数量
  Future<void> changeCount(int v) async {
    if (homeListCount.value == v) return;

    await HiveStoreImpl.setHomeSetting(count: v);
    homeListCount(v);
  }

  // endregion

  // region 手势密码
  /// 手势密码 (为空列表表示未启用)
  final RxList<int> gesturePsw = <int>[].obs;

  /// 修改手势密码
  Future<void> changeGesturePsw(List<int> v) async {
    if (_equal(gesturePsw, v)) return;

    await HiveStoreImpl.setGesturePassword(v);
    gesturePsw(v);
  }

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
  Future<void> sync({
    toast = false,
    homeCfg = false,
    tag = false,
    // consumption = false,
  }) async {
    if (homeCfg) {
      var cfg = await HiveStoreImpl.getHomeSetting();
      homeListType(cfg.type);
      homeListCount(cfg.count);
      SafePrint.info('[sync] homeCfg done.');
    }
    if (tag) {
      tags(await DBStoreImpl.getAllTags());
      SafePrint.info('[sync] tag done.');
    }

    if (toast) MyToast.success('刷新成功');
  }

  /// alias for sync with all flags true
  Future<void> syncAll([toast = false]) => sync(
        toast: toast,
        homeCfg: true,
        tag: true,
      );

  /// 初始化
  Future<void> init() async {
    await DBStoreImpl.init();
    await HiveStoreImpl.init();

    SafePrint.info('[GlobalStoreImpl] initialized.');

    syncAll();
  }

  /// 注销
  Future<void> dispose() async {
    await DBStoreImpl.dispose();
    await HiveStoreImpl.dispose();
  }
}
