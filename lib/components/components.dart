import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback function;

  Button({super.key, required this.text, required this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          height: 55,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Input extends StatelessWidget {
  Input({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SizedBox(
          height: 45,
          child: TextField(
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.bottom,
            autocorrect: false,
            style: TextStyle(
              fontSize: 25,
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              hintText: "ENTER THE KEY",
            ),
          ),
        ),
      ),
    );
  }
}

class GameGrid extends StatelessWidget {
  List<Square> shipList = [];
  bool unlocked = true;

  GameGrid({super.key, this.unlocked = true});

  List<Widget> createGrid() {
    List<Widget> rowList = [];

    if (unlocked == true) {
      for (int x = 0; x < 10; x++) {
        List<Widget> iconList = [];
        for (int y = 0; y < 10; y++) {
          Square temp = Square();
          shipList.add(temp);
          iconList.add(
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: temp,
              ),
            ),
          );
        }
        rowList.add(Column(children: iconList));
      }
    } else {}
    return rowList;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: createGrid(),
      ),
    );
  }
}

class Square extends StatefulWidget {
  late int x;
  late int y;

  Square({super.key});

  @override
  State<Square> createState() => _SquareState();
}

class _SquareState extends State<Square> {
  IconData icon = Icons.square_outlined;
  bool shipPlaced = false;

  void PlaceShip() {
    if (shipPlaced == false) {
      shipPlaced = true;
      setState(() {
        icon = Icons.square;
      });
    } else {
      shipPlaced = false;
      setState(() {
        icon = Icons.square_outlined;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: PlaceShip,
      child: Icon(icon),
    );
  }
}
