import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wuwu/components/common/styled_text.dart';
import 'package:wuwu/platform_spec/platform_spec.dart';
import 'package:wuwu/platform_spec/windows_spec.dart';
import 'package:wuwu/routes/index.dart';
import 'package:wuwu/stores/global_store.dart';
import 'package:wuwu/styles/palette.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await PlatformSpec.init(args);

  await Get.put(GlobalStoreImpl()).init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();

    GetMaterialApp app = GetMaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'wuwu',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Palette.b90),
        scaffoldBackgroundColor: Palette.b10,
        fontFamily: StyledTextFamily.ShouShu,
      ),
      initialRoute: MyRoutes.entry,
      unknownRoute: invalidPage,
      getPages: validPages,
      builder: (context, page) {
        return botToastBuilder(
          context,
          MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: page!,
          ),
        );
      },
      navigatorObservers: [BotToastNavigatorObserver()],
    );

    return PlatformSpec.isWin ? AppFrame(app: app) : app;
  }
}
