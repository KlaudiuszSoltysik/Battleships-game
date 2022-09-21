import 'package:flutter/material.dart';
import '../screens/preparation.dart';
import 'package:provider/provider.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback function;
  Color color;

  Button(
      {super.key,
      required this.text,
      required this.function,
      this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: context.watch<Brain>().accept ? function : () {},
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

class Brain with ChangeNotifier {
  int ship5 = 0;
  int ship4 = 0;
  int ship3 = 0;
  int ship2 = 0;
  int ship1 = 0;
  bool accept = false;

  List<List<Square>> squareList = [];
  List<List<IconData>> icon = [
    [
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined
    ],
    [
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined
    ],
    [
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined
    ],
    [
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined
    ],
    [
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined
    ],
    [
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined
    ],
    [
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined
    ],
    [
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined
    ],
    [
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined
    ],
    [
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined,
      Icons.square_outlined
    ]
  ];

  void placeShip({required x, required y}) {
    if (icon[x][y] == Icons.square) {
      icon[x][y] = Icons.square_outlined;
    } else {
      if ((x == 0) & (y == 0)) {
        if (icon[x + 1][y + 1] == Icons.square_outlined) {
          icon[x][y] = Icons.square;
        }
      } else if ((x == 0) & (y == 9)) {
        if (icon[x + 1][y - 1] == Icons.square_outlined) {
          icon[x][y] = Icons.square;
        }
      } else if ((x == 9) & (y == 0)) {
        if (icon[x - 1][y + 1] == Icons.square_outlined) {
          icon[x][y] = Icons.square;
        }
      } else if ((x == 9) & (y == 9)) {
        if (icon[x - 1][y - 1] == Icons.square_outlined) {
          icon[x][y] = Icons.square;
        }
      } else if (x == 0) {
        if ((icon[x + 1][y + 1] == Icons.square_outlined) &
            (icon[x + 1][y - 1] == Icons.square_outlined)) {
          icon[x][y] = Icons.square;
        }
      } else if (x == 9) {
        if ((icon[x - 1][y + 1] == Icons.square_outlined) &
            (icon[x - 1][y - 1] == Icons.square_outlined)) {
          icon[x][y] = Icons.square;
        }
      } else if (y == 0) {
        if ((icon[x + 1][y + 1] == Icons.square_outlined) &
            (icon[x - 1][y + 1] == Icons.square_outlined)) {
          icon[x][y] = Icons.square;
        }
      } else if (y == 9) {
        if ((icon[x + 1][y - 1] == Icons.square_outlined) &
            (icon[x - 1][y - 1] == Icons.square_outlined)) {
          icon[x][y] = Icons.square;
        }
      } else if ((icon[x + 1][y + 1] == Icons.square_outlined) &
          (icon[x + 1][y - 1] == Icons.square_outlined) &
          (icon[x - 1][y + 1] == Icons.square_outlined) &
          (icon[x - 1][y - 1] == Icons.square_outlined)) {
        icon[x][y] = Icons.square;
      }
    }
    notifyListeners();
    checkLength();
  }

  void checkLength() {
    ship5 = 0;
    ship4 = 0;
    ship3 = 0;
    ship2 = 0;
    ship1 = 0;
    accept = false;
    int shipLength;
    int segments = 0;

    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 10; j++) {
        shipLength = 0;
        if (icon[j][i] == Icons.square) {
          shipLength++;
          for (int k = 1; k < 6; k++) {
            if (j + k < 10) {
              if (icon[j + k][i] == Icons.square) {
                shipLength++;
              } else {
                break;
              }
            } else {
              break;
            }
          }
          if (shipLength > 5) {
            icon[j + shipLength - 1][i] = Icons.square_outlined;
            ship5++;
          } else if (shipLength == 5) {
            ship5++;
          } else if (shipLength == 4) {
            ship4++;
          } else if (shipLength == 3) {
            ship3++;
          } else if (shipLength == 2) {
            ship2++;
          }
          j += shipLength - 1;
        }
      }
    }
    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 10; j++) {
        shipLength = 0;
        if (icon[i][j] == Icons.square) {
          shipLength++;
          for (int k = 1; k < 6; k++) {
            if (j + k < 10) {
              if (icon[i][j + k] == Icons.square) {
                shipLength++;
              } else {
                break;
              }
            } else {
              break;
            }
          }
          if (shipLength > 5) {
            icon[i][j + shipLength - 1] = Icons.square_outlined;
            ship5++;
          } else if (shipLength == 5) {
            ship5++;
          } else if (shipLength == 4) {
            ship4++;
          } else if (shipLength == 3) {
            ship3++;
          } else if (shipLength == 2) {
            ship2++;
          }
          j += shipLength - 1;
        }
      }
    }
    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 10; j++) {
        if (icon[i][j] == Icons.square) {
          if ((i == 0) & (j == 0)) {
            if ((icon[i + 1][j] == Icons.square_outlined) &
                (icon[i][j + 1] == Icons.square_outlined)) {
              ship1++;
            }
          } else if ((i == 0) & (j == 9)) {
            if ((icon[i + 1][j] == Icons.square_outlined) &
                (icon[i][j - 1] == Icons.square_outlined)) {
              ship1++;
            }
          } else if ((i == 9) & (j == 0)) {
            if ((icon[i - 1][j] == Icons.square_outlined) &
                (icon[i][j + 1] == Icons.square_outlined)) {
              ship1++;
            }
          } else if ((i == 9) & (j == 9)) {
            if ((icon[i - 1][j] == Icons.square_outlined) &
                (icon[i][j - 1] == Icons.square_outlined)) {
              ship1++;
            }
          } else if (i == 0) {
            if ((icon[i + 1][j] == Icons.square_outlined) &
                (icon[i][j - 1] == Icons.square_outlined) &
                (icon[i][j + 1] == Icons.square_outlined)) {
              ship1++;
            }
          } else if (i == 9) {
            if ((icon[i - 1][j] == Icons.square_outlined) &
                (icon[i][j - 1] == Icons.square_outlined) &
                (icon[i][j + 1] == Icons.square_outlined)) {
              ship1++;
            }
          } else if (j == 0) {
            if ((icon[i + 1][j] == Icons.square_outlined) &
                (icon[i - 1][j] == Icons.square_outlined) &
                (icon[i][j + 1] == Icons.square_outlined)) {
              ship1++;
            }
          } else if (j == 9) {
            if ((icon[i + 1][j] == Icons.square_outlined) &
                (icon[i - 1][j] == Icons.square_outlined) &
                (icon[i][j - 1] == Icons.square_outlined)) {
              ship1++;
            }
          } else if ((icon[i + 1][j] == Icons.square_outlined) &
              (icon[i - 1][j] == Icons.square_outlined) &
              (icon[i][j + 1] == Icons.square_outlined) &
              (icon[i][j - 1] == Icons.square_outlined)) {
            ship1++;
          }
          segments++;
        }
      }
    }
    if (segments == 35) {
      accept = true;
    } else {
      accept = false;
    }
    print("ship 5 $ship5");
    print("ship 4 $ship4");
    print("ship 3 $ship3");
    print("ship 2 $ship2");
    print("ship 1 $ship1");
  }
}
