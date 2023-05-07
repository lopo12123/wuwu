import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';
import 'package:wuwu/components/styled_text.dart';
import 'package:wuwu/routes/index.dart';
import 'package:wuwu/styles/palette.dart';

Future<void> appPrelude() async {
  await windowManager.ensureInitialized();

  WindowOptions cfg = const WindowOptions(
    size: Size(800, 600),
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

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await appPrelude();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppFrame(
      app: GetMaterialApp(
        debugShowCheckedModeBanner: false,
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
        boxShadow: [
          BoxShadow(
            color: Palette.b80,
            blurRadius: 1,
          ),
        ],
      ),
      child: app,
    );
  }
}
