import 'package:hive_flutter/hive_flutter.dart';
import 'package:wuwu/stores/hive/home_setting.dart';
import 'package:wuwu/utils/safe_print.dart';

/// 首页设置 `HomeSetting`
const _hiveKeyHomeSetting = '@homeSetting';

/// 手势密码 `List<int>`
const _hiveKeyGesturePassword = '@gesturePassword';

abstract class HiveStoreImpl {
  // region 首页设置
  // 获取首页设置
  static Future<HomeSetting> getHomeSetting() async {
    await requireInitialized();

    HomeSetting cfg = _handle?.get(
      _hiveKeyHomeSetting,
      defaultValue: HomeSetting.defaultValue,
    );
    return cfg;
  }

  /// 修改首页设置
  static Future<void> setHomeSetting({int? type, int? count}) async {
    assert(type != null || count != null);
    assert(type == null || (type >= 0 && type <= 2));
    assert(count == null || (count >= 1 && count <= 20));

    HomeSetting cfg = _handle?.get(
      _hiveKeyHomeSetting,
      defaultValue: HomeSetting.defaultValue,
    );

    if (type != null) cfg.type = type;
    if (count != null) cfg.count = count;

    await cfg.save();
  }

  // endregion

  // region 手势密码
  /// 获取手势密码
  static Future<List<int>> getGesturePassword() async {
    await requireInitialized();

    List<int> p = _handle?.get(_hiveKeyGesturePassword, defaultValue: <int>[]);
    return p;
  }

  /// 设置手势密码
  static Future<void> setGesturePassword(List<int> v) async {
    await requireInitialized();

    // 此次不添加 await 也可以, 修改会在内存中立即生效.
    await _handle?.put(_hiveKeyGesturePassword, v);
  }

  // endregion

  // region lifecycle
  /// 确保已初始化
  static Future<void> requireInitialized() async {
    if (_handle == null) await init();
  }

  /// 初始化
  static Future<void> init() async {
    if (_handle?.isOpen == true) {
      SafePrint.info('[HiveStoreImpl] re-init (skip)');
      return;
    }

    await Hive.initFlutter('wuwu');
    Hive.registerAdapter(HomeSettingAdapter(), override: true);

    final cfgBox = await Hive.openBox('appCfg');
    _handle = cfgBox;
  }

  /// 注销
  static Future<void> dispose() async {
    _handle?.close();
    SafePrint.info('[HiveStoreImpl] closed');
  }

  // endregion

  static Box? _handle;
}
