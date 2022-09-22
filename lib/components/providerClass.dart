import 'package:flutter/material.dart';
import 'components.dart';
import 'dart:math';

class Brain with ChangeNotifier {
  int ship5 = 0;
  int ship4 = 0;
  int ship3 = 0;
  int ship2 = 0;
  int ship1 = 0;
  bool accept = false;
  bool lock = false;
  List<List<IconData>> icon = [];

  void init() {
    for (int i = 0; i < 10; i++) {
      List<IconData> temp = [];
      for (int j = 0; j < 10; j++) {
        temp.add(Icons.square_outlined);
      }
      icon.add(temp);
    }
  }

  void placeShip({required x, required y}) {
    if (!lock) {
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
      if (checkLength()) {
        accept = true;
      } else {
        accept = false;
      }
    }
  }

  bool checkLength() {
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
    if ((segments == 35) &
        (ship1 == 5) &
        (ship2 == 4) &
        (ship3 == 3) &
        (ship4 == 2) &
        (ship5 == 1)) {
      return true;
    } else {
      return false;
    }
  }
}

class AI extends Brain {
  List<List<bool>> ship = [];
  List<List<List<int>>> ship5pos = [];
  List<List<List<int>>> ship4pos = [];
  List<List<List<int>>> ship3pos = [];
  List<List<List<int>>> ship2pos = [];
  List<List<int>> ship1pos = [];

  @override
  void init() {
    for (int i = 0; i < 10; i++) {
      List<IconData> temp = [];
      for (int j = 0; j < 10; j++) {
        temp.add(Icons.square_outlined);
      }
      icon.add(temp);
    }

    for (int i = 0; i < 10; i++) {
      List<bool> temp = [];
      for (int i = 0; i < 10; i++) {
        temp.add(false);
      }
      ship.add(temp);
    }

    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 6; j++) {
        List<List<int>> temp2 = [];
        for (int k = j; k < j + 5; k++) {
          List<int> temp = [];
          temp.add(i);
          temp.add(k);
          temp2.add(temp);
        }
        ship5pos.add(temp2);
      }
    }

    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 10; j++) {
        List<int> temp = [];
        temp.add(i);
        temp.add(j);
        ship1pos.add(temp);
      }
    }
  }

  void randomizeBoard() {
    print(ship5pos);

    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 10; j++) {
        if (ship[i][j] == true) {
          icon[i][j] = Icons.square;
        }
      }
    }
    notifyListeners();
  }

  void clearBoard() {
    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 10; j++) {
        icon[i][j] = Icons.square_outlined;
        ship[i][j] = false;
      }
    }
    notifyListeners();
  }

  void fire({required x, required y}) {
    clearBoard();
    randomizeBoard();
  }
}
