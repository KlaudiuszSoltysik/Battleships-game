import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:battleships/components/components.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              TextLiquidFill(
                text: "Battleships",
                loadDuration: const Duration(seconds: 6),
                waveDuration: const Duration(seconds: 3),
                waveColor: Colors.black,
                boxBackgroundColor: Colors.white,
                textStyle: const TextStyle(
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
                    const SizedBox(height: 20),
                    Button(
                      function: () {},
                      text: "MULTIPLAYER",
                    ),
                    const Input(),
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
      ),
    );
  }
}
