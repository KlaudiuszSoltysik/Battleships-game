import 'package:flutter/material.dart';
import 'package:battleships/components/components.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          children: const <Widget>[
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
            GameGrid(),
          ],
        ),
      ),
    );
  }
}