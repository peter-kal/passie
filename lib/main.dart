import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';
import 'package:passie/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Passie',
      theme: yaruLight,
      darkTheme: yaruDark,
      home: const HomePage(),
    );
  }
}
