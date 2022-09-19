import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback function;

  const Button({super.key, required this.text, required this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          height: 55,
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
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
  const Input({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
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
  const GameGrid({super.key});

  List<Widget> createGrid() {
    List<Widget> rowList = [];

    for (int x = 0; x < 10; x++) {
      List<Widget> iconList = [];
      for (int y = 0; y < 10; y++) {
        iconList.add(
          const Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: Square(),
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

class Square extends StatefulWidget {
  const Square({super.key});

  @override
  State<Square> createState() => _SquareState();
}

class _SquareState extends State<Square> {
  IconData icon = Icons.square_outlined;

  void PlaceShip() {
    setState(() {
      if (icon == Icons.square_outlined) {
        icon = Icons.square;
      } else {
        icon = Icons.square_outlined;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: PlaceShip,
      child: Icon(icon),
    );
  }
}
