import 'package:flutter/material.dart';
import 'package:battleships/components/components.dart';
import 'package:provider/provider.dart';

class Preparation extends StatefulWidget {
  Preparation({super.key});

  @override
  State<Preparation> createState() => _PreparationState();
}

class _PreparationState extends State<Preparation> with ChangeNotifier {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "PREPARE YOUR GRID",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                decoration: TextDecoration.none,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            GameGrid(),
            Button(
              function: () {
                Navigator.pushNamed(context, "/game");
              },
              text: "ACCEPT",
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "5 X ",
                        style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.square),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "4 X ",
                        style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.square),
                      Icon(Icons.square),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "3 X ",
                        style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.square),
                      Icon(Icons.square),
                      Icon(Icons.square),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "2 X ",
                        style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.square),
                      Icon(Icons.square),
                      Icon(Icons.square),
                      Icon(Icons.square),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "1 X ",
                        style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.square),
                      Icon(Icons.square),
                      Icon(Icons.square),
                      Icon(Icons.square),
                      Icon(Icons.square),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
