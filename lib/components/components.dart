import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providerClass.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback function;
  Color color;
  bool ready;

  Button(
      {super.key,
      required this.text,
      required this.function,
      this.color = Colors.black,
      this.ready = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ready ? function : function, //() {},
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          height: 55,
          decoration: BoxDecoration(
            color: color,
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
  GameGrid({super.key});

  List<Widget> createGrid(place) {
    List<Widget> rowList = [];

    for (int x = 0; x < 10; x++) {
      List<Widget> iconList = [];
      for (int y = 0; y < 10; y++) {
        Square temp = Square(x: x, y: y, place: place);
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
    return rowList;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: createGrid(true),
      ),
    );
  }
}

class RandomGameGrid extends GameGrid {
  RandomGameGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: createGrid(false),
      ),
    );
  }
}

class Square extends StatefulWidget {
  int x;
  int y;
  bool place;

  Square({super.key, required this.x, required this.y, required this.place});

  @override
  State<Square> createState() => _SquareState();
}

class _SquareState extends State<Square> {
  void placeShip() {
    context.read<Brain>().placeShip(x: widget.x, y: widget.y);
  }

  void fire() {
    context.read<AI>().receiveShot(x: widget.x, y: widget.y);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.place ? placeShip : fire,
      child: widget.place
          ? Icon(context.watch<Brain>().icon[widget.x][widget.y])
          : Icon(context.watch<AI>().icon[widget.x][widget.y]),
    );
  }
}
