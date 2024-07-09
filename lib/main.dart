import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaru/yaru.dart';
import 'package:window_manager/window_manager.dart';
import 'package:passie/pages.dart';
import 'bloc/blocs.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  await YaruWindowTitleBar.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  Size thewindowmax = const Size(530, 550);
  Size thewindowmin = const Size(500, 537);

  WindowOptions windowOptions = WindowOptions(
    maximumSize: thewindowmax,
    minimumSize: thewindowmin,
    center: true,
    fullScreen: false,
  );
  await windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.focus();
    await windowManager.show();
  });

  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => PagenavigationBloc()..add(const PasswordPageEvent()),
    ),
    BlocProvider(create: ((context) => PassieBloc()..add(const LoadOptions()))),
    BlocProvider(
      create: (context) => CopyBloc(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return YaruTheme(
      builder: (context, yaru, child) {
        return MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          debugShowCheckedModeBanner: false,
          title: 'Passie',
          theme: yaru.theme,
          darkTheme: yaru.darkTheme,
          home: BlocBuilder<PagenavigationBloc, PagenavigationState>(
              builder: (context, state) => state is PasswordPageState
                  ? const PasswordPage()
                  : const SettingsPage()),
        );
      },
    );
  }
}
