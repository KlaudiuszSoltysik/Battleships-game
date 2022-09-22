import 'package:flutter/material.dart';
import '../components/components.dart';
import 'package:provider/provider.dart';
import '../components/providerClass.dart';

class Preparation extends StatefulWidget {
  Preparation({super.key});

  @override
  State<Preparation> createState() => _PreparationState();
}

class _PreparationState extends State<Preparation> {
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
              ready: context.read<Brain>().accept,
              color: !context.read<Brain>().accept ? Colors.red : Colors.black,
              function: () {
                Navigator.pushNamed(context, "/game");
                context.read<Brain>().lock = true;
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
                        "${5 - context.watch<Brain>().ship1} X ",
                        style: TextStyle(
                          color: context.watch<Brain>().ship1 > 5
                              ? Colors.red
                              : Colors.black,
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
                        "${4 - context.watch<Brain>().ship2} X ",
                        style: TextStyle(
                          color: context.watch<Brain>().ship2 > 4
                              ? Colors.red
                              : Colors.black,
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
                        "${3 - context.watch<Brain>().ship3} X ",
                        style: TextStyle(
                          color: context.watch<Brain>().ship3 > 3
                              ? Colors.red
                              : Colors.black,
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
                        "${2 - context.watch<Brain>().ship4} X ",
                        style: TextStyle(
                          color: context.watch<Brain>().ship4 > 2
                              ? Colors.red
                              : Colors.black,
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
                        "${1 - context.watch<Brain>().ship5} X ",
                        style: TextStyle(
                          color: context.watch<Brain>().ship5 > 1
                              ? Colors.red
                              : Colors.black,
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
