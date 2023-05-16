import 'package:get/get.dart';
import 'package:wuwu/views/db_viewer.dart';
import 'package:wuwu/views/entry.dart';
import 'package:wuwu/views/path_lock.dart';
import 'package:wuwu/views/unknown.dart';

/// 路由
abstract class MyRoutes {
  /// 非法路由
  static const invalid = '/invalid';

  /// 入口
  static const entry = '/entry';

  /// 手势密码
  static const path_lock = '/path_lock';

  /// 数据库视图
  static const db_viewer = '/db_viewer';
}

/// 未知页面
final GetPage invalidPage = GetPage(
  name: MyRoutes.invalid,
  page: () => const UnknownView(),
);

/// 规划页面
final List<GetPage> validPages = [
  GetPage(name: MyRoutes.entry, page: () => const EntryView()),
  GetPage(name: MyRoutes.db_viewer, page: () => const DBViewerView()),
  GetPage(name: MyRoutes.path_lock, page: () => const PathLockView()),
];
