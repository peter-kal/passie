import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';
import 'package:passie/home.dart';
import 'package:window_manager/window_manager.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = WindowOptions(
    size: Size(584, 505),
    maximumSize: Size(600, 605),
    minimumSize: Size(370, 490),
    titleBarStyle: TitleBarStyle.hidden,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
  YaruWindowTitleBar.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return YaruTheme(builder: (context, yaru, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Passie',
        theme: yaru.theme,
        darkTheme: yaru.darkTheme,
        home: HomePage(),
      );
    });
  }
}
