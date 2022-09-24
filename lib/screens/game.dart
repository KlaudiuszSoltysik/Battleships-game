import 'package:flutter/material.dart';
import '../components/components.dart';
import 'package:provider/provider.dart';
import '../components/providerClass.dart';

class Game extends StatefulWidget {
  Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  void initState() {
    context.read<AI>().randomizeBoard();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Text(
              "YOUR TURN",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                decoration: TextDecoration.none,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "YOUR ARMY",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                decoration: TextDecoration.none,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            GameGrid(),
            Text(
              "RADAR",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                decoration: TextDecoration.none,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            RandomGameGrid(),
          ],
        ),
      ),
    );
  }
}
