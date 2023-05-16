import 'dart:io';

import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';
import 'package:passie/home.dart';
import 'package:window_manager/window_manager.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

Future<void> main() async {
  if (!Platform.isAndroid) {
    WidgetsFlutterBinding.ensureInitialized();
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = const WindowOptions(
      size: Size(500, 540),
      maximumSize: Size(500, 540),
      minimumSize: Size(500, 540),
      fullScreen: false,
    );
    await windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
      await windowManager.getSize();
    });
  }
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
        theme: yaruLight,
        darkTheme: yaruDark,
        home: const HomePage(),
      );
    });
  }
}
