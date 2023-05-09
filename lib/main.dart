import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';
import 'package:windows_single_instance/windows_single_instance.dart';
import 'package:wuwu/components/styled_text.dart';
import 'package:wuwu/routes/index.dart';
import 'package:wuwu/styles/palette.dart';

/// 配置窗口初始数据
Future<void> setupWindowCfg() async {
  await windowManager.ensureInitialized();

  WindowOptions cfg = const WindowOptions(
    size: Size(390, 800),
    center: true,
    backgroundColor: Palette.transparent,
    titleBarStyle: TitleBarStyle.hidden,
  );

  windowManager.waitUntilReadyToShow(cfg, () async {
    await windowManager.setAsFrameless();
    await windowManager.show();
    await windowManager.focus();
  });
}

/// 确保单实例运行
Future<void> setupSingleTonCfg(List<String> args) async {
  await WindowsSingleInstance.ensureSingleInstance(
    args,
    'wuwu',
    onSecondWindow: (args) async {
      // 唤起并聚焦
      if (await windowManager.isMinimized()) await windowManager.restore();
      windowManager.focus();
    },
  );
}

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupWindowCfg();
  await setupSingleTonCfg(args);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppFrame(
      app: GetMaterialApp(
        // debugShowCheckedModeBanner: false,
        title: 'wuwu',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Palette.b90),
          scaffoldBackgroundColor: Palette.b10,
          fontFamily: StyledTextFamily.ZhuoKai.name,
        ),
        initialRoute: MyRoutes.entry,
        unknownRoute: invalidPage,
        getPages: validPages,
      ),
    );
  }
}

class AppFrame extends StatelessWidget {
  final Widget app;

  const AppFrame({super.key, required this.app});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow: [BoxShadow(color: Palette.b80, blurRadius: 1)],
      ),
      child: app,
    );
  }
}
