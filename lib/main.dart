import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/menu.dart';
import 'screens/game.dart';
import 'screens/preparation.dart';
import 'package:provider/provider.dart';
import '../components/providerClass.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Brain()),
        ChangeNotifierProvider(create: (context) => AI()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    context.watch<Brain>().init();
    context.watch<AI>().init();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      theme: ThemeData.light().copyWith(),
      initialRoute: "/",
      routes: {
        "/": (context) => Menu(),
        "/preparation": (context) => Preparation(),
        "/game": (context) => Game(),
      },
    );
  }
}
