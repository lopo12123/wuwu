import 'package:get/get.dart';
import 'package:wuwu/views/db_viewer.dart';
import 'package:wuwu/views/entry.dart';
import 'package:wuwu/views/path_lock.dart';
import 'package:wuwu/views/tag_manage.dart';
import 'package:wuwu/views/unknown.dart';

/// 路由
abstract class MyRoutes {
  /// 非法路由
  static const invalid = '/invalid';

  /// 手势密码
  static const path_lock = '/path_lock';

  /// 入口
  static const entry = '/entry';

  /// 标签管理
  static const tag_manage = '/tag_manage';

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
  GetPage(name: MyRoutes.path_lock, page: () => const PathLockView()),
  GetPage(name: MyRoutes.entry, page: () => const EntryView()),
  GetPage(name: MyRoutes.tag_manage, page: () => const TagManageView()),
  GetPage(name: MyRoutes.db_viewer, page: () => const DBViewerView()),
];
