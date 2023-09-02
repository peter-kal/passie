import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yaru/yaru.dart';
import 'package:passie/home.dart';
import 'package:passie/provider.dart';
import 'package:window_manager/window_manager.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

Future<void> main() async {
  Size thewindowmax = const Size(530, 550);
  Size thewindowmin = const Size(500, 537);
  await YaruWindowTitleBar.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  await windowManager.ensureInitialized();

  WindowOptions windowOptions = WindowOptions(
    maximumSize: thewindowmax,
    minimumSize: thewindowmin,
    fullScreen: false,
  );
  await windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.focus();
    await windowManager.show();
  });

  runApp(ChangeNotifierProvider(
    create: (_) => ToCodeVariables(),
    child: const MyApp(),
  ));
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
        home: const HomePage(),
      );
    });
  }
}
