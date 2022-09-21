import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../components/components.dart';

class Menu extends StatelessWidget with ChangeNotifier {
  Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: <Widget>[
            TextLiquidFill(
              text: "Battleships",
              loadDuration: Duration(seconds: 6),
              waveDuration: Duration(seconds: 3),
              waveColor: Colors.black,
              boxBackgroundColor: Colors.white,
              textStyle: TextStyle(
                fontFamily: "UnifrakturMagunita",
                decoration: TextDecoration.none,
                fontSize: 70,
              ),
              boxHeight: 150,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Button(
                    function: () {
                      Navigator.pushNamed(context, "/preparation");
                    },
                    text: "SINGLEPLAYER",
                  ),
                  SizedBox(height: 20),
                  Button(
                    function: () {},
                    text: "MULTIPLAYER",
                  ),
                  Input(),
                ],
              ),
            ),
            Expanded(
              child: Image.asset(
                "assets/logo.png",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
