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
      onTap: ready ? function : () {},
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

class GameGrid extends StatelessWidget with ChangeNotifier {
  GameGrid({super.key});

  List<Widget> createGrid() {
    List<Widget> rowList = [];

    for (int x = 0; x < 10; x++) {
      List<Widget> iconList = [];
      for (int y = 0; y < 10; y++) {
        Square temp = Square(x: x, y: y);
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
        children: createGrid(),
      ),
    );
  }
}

class Square extends StatefulWidget with ChangeNotifier {
  int x;
  int y;

  Square({super.key, required this.x, required this.y});

  @override
  State<Square> createState() => _SquareState();
}

class _SquareState extends State<Square> {
  void placeShip() {
    context.read<Brain>().placeShip(x: widget.x, y: widget.y);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: placeShip,
      child: Icon(context.watch<Brain>().icon[widget.x][widget.y]),
    );
  }
}
