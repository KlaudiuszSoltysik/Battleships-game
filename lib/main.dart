import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/menu.dart';
import 'screens/game.dart';
import 'screens/preparation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      theme: ThemeData.light().copyWith(),
      initialRoute: "/",
      routes: {
        "/": (context) => const Menu(),
        "/preparation": (context) => const Preparation(),
        "/game": (context) => const Game(),
      },
    );
  }
}
