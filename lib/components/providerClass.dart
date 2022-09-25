import 'package:flutter/material.dart';
import 'dart:math';

class Brain with ChangeNotifier {
  int ship5 = 0;
  int ship4 = 0;
  int ship3 = 0;
  int ship2 = 0;
  int ship1 = 0;
  bool accept = false;
  int segments = 0;
  bool lock = false;
  List<List<IconData>> icon = [];

  Brain() {
    for (int i = 0; i < 10; i++) {
      List<IconData> temp = [];
      for (int j = 0; j < 10; j++) {
        temp.add(Icons.square_outlined);
      }
      icon.add(temp);
    }
  }

  void placeShip({required int x, required int y}) {
    if (!lock) {
      if (icon[x][y] == Icons.square) {
        icon[x][y] = Icons.square_outlined;
      } else {
        if (validate(x, y)) {
          icon[x][y] = Icons.square;
        }
      }
      notifyListeners();

      if ((checkLength()) & (countSegments())) {
        accept = true;
      } else {
        accept = false;
      }
    }
  }

  bool validate(int x, int y) {
    if ((x == 0) & (y == 0)) {
      if (icon[x + 1][y + 1] == Icons.square_outlined) {
        return true;
      }
    } else if ((x == 0) & (y == 9)) {
      if (icon[x + 1][y - 1] == Icons.square_outlined) {
        return true;
      }
    } else if ((x == 9) & (y == 0)) {
      if (icon[x - 1][y + 1] == Icons.square_outlined) {
        return true;
      }
    } else if ((x == 9) & (y == 9)) {
      if (icon[x - 1][y - 1] == Icons.square_outlined) {
        return true;
      }
    } else if (x == 0) {
      if ((icon[x + 1][y + 1] == Icons.square_outlined) &
          (icon[x + 1][y - 1] == Icons.square_outlined)) {
        return true;
      }
    } else if (x == 9) {
      if ((icon[x - 1][y + 1] == Icons.square_outlined) &
          (icon[x - 1][y - 1] == Icons.square_outlined)) {
        return true;
      }
    } else if (y == 0) {
      if ((icon[x + 1][y + 1] == Icons.square_outlined) &
          (icon[x - 1][y + 1] == Icons.square_outlined)) {
        return true;
      }
    } else if (y == 9) {
      if ((icon[x + 1][y - 1] == Icons.square_outlined) &
          (icon[x - 1][y - 1] == Icons.square_outlined)) {
        return true;
      }
    } else if ((icon[x + 1][y + 1] == Icons.square_outlined) &
        (icon[x + 1][y - 1] == Icons.square_outlined) &
        (icon[x - 1][y + 1] == Icons.square_outlined) &
        (icon[x - 1][y - 1] == Icons.square_outlined)) {
      return true;
    }
    return false;
  }

  bool checkLength() {
    ship5 = 0;
    ship4 = 0;
    ship3 = 0;
    ship2 = 0;
    ship1 = 0;
    accept = false;
    int shipLength;
    segments = 0;

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
        }
      }
    }
    if ((ship1 == 5) &
        (ship2 == 4) &
        (ship3 == 3) &
        (ship4 == 2) &
        (ship5 == 1)) {
      return true;
    } else {
      return false;
    }
  }

  bool countSegments() {
    segments = 5 * ship5 + 4 * ship4 + 3 * ship3 + 2 * ship2 + 1 * ship1;
    if (segments == 35) {
      return true;
    } else {
      return false;
    }
  }

  bool receiveHit(int x, int y) {
    if (icon[x][y] == Icons.square) {
      icon[x][y] = Icons.dangerous;
      notifyListeners();
      return true;
    } else {
      icon[x][y] = Icons.egg;
      notifyListeners();
      return false;
    }
  }
}

class AI extends Brain {
  List<List<bool>> ship = [];
  final List<List<List<int>>> ship5pos = [];
  final List<List<List<int>>> ship4pos = [];
  final List<List<List<int>>> ship3pos = [];
  final List<List<List<int>>> ship2pos = [];
  final List<List<int>> ship1pos = [];
  List<int> lastShot = [];
  List<int> lastHit = [];
  var brain;

  AI(this.brain) {
    for (int i = 0; i < 10; i++) {
      List<bool> temp = [];
      for (int j = 0; j < 10; j++) {
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
    for (int i = 0; i < 6; i++) {
      for (int j = 0; j < 10; j++) {
        List<List<int>> temp2 = [];
        for (int k = i; k < i + 5; k++) {
          List<int> temp = [];
          temp.add(k);
          temp.add(i);
          temp2.add(temp);
        }
        ship5pos.add(temp2);
      }
    }

    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 7; j++) {
        List<List<int>> temp2 = [];
        for (int k = j; k < j + 4; k++) {
          List<int> temp = [];
          temp.add(i);
          temp.add(k);
          temp2.add(temp);
        }
        ship4pos.add(temp2);
      }
    }
    for (int i = 0; i < 7; i++) {
      for (int j = 0; j < 10; j++) {
        List<List<int>> temp2 = [];
        for (int k = i; k < i + 4; k++) {
          List<int> temp = [];
          temp.add(k);
          temp.add(i);
          temp2.add(temp);
        }
        ship4pos.add(temp2);
      }
    }

    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 8; j++) {
        List<List<int>> temp2 = [];
        for (int k = j; k < j + 3; k++) {
          List<int> temp = [];
          temp.add(i);
          temp.add(k);
          temp2.add(temp);
        }
        ship3pos.add(temp2);
      }
    }
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 10; j++) {
        List<List<int>> temp2 = [];
        for (int k = i; k < i + 3; k++) {
          List<int> temp = [];
          temp.add(k);
          temp.add(i);
          temp2.add(temp);
        }
        ship3pos.add(temp2);
      }
    }

    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 9; j++) {
        List<List<int>> temp2 = [];
        for (int k = j; k < j + 2; k++) {
          List<int> temp = [];
          temp.add(i);
          temp.add(k);
          temp2.add(temp);
        }
        ship2pos.add(temp2);
      }
    }
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 10; j++) {
        List<List<int>> temp2 = [];
        for (int k = i; k < i + 2; k++) {
          List<int> temp = [];
          temp.add(k);
          temp.add(i);
          temp2.add(temp);
        }
        ship2pos.add(temp2);
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
    ship5pos.shuffle();
    ship4pos.shuffle();
    ship3pos.shuffle();
    ship2pos.shuffle();
    ship1pos.shuffle();
  }

  void randomizeBoard() {
    for (List<int> i in ship5pos.removeAt(0)) {
      ship[i[0]][i[1]] = true;
    }
    for (int i = 0; i < 2; i++) {
      for (List<int> j in ship4pos.removeAt(0)) {
        ship[j[0]][j[1]] = true;
      }
    }
    // for (int i = 0; i < 3; i++) {
    //   for (List<int> j in ship3pos.removeAt(0)) {
    //     ship[j[0]][j[1]] = true;
    //   }
    // }
    // for (int i = 0; i < 4; i++) {
    //   for (List<int> j in ship2pos.removeAt(0)) {
    //     ship[j[0]][j[1]] = true;
    //   }
    // }
    // for (int i = 0; i < 5; i++) {
    //   List<int> temp = ship1pos.removeAt(0);
    //   ship[temp[0]][temp[1]] = true;
    // }

    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 10; j++) {
        if (ship[i][j] == true) {
          icon[i][j] = Icons.square;
        }
      }
    }
  }

  void clearBoard() {
    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 10; j++) {
        icon[i][j] = Icons.square_outlined;
        ship[i][j] = false;
      }
    }
  }

  void receiveShot({required int x, required int y}) {
    if (ship[x][y] == true) {
      icon[x][y] = Icons.dangerous;
      notifyListeners();
    } else {
      icon[x][y] = Icons.egg;
      notifyListeners();
      AImove();
    }
  }

  void AImove() {
    if (lastShot.isEmpty) {
      int x = Random().nextInt(10);
      int y = Random().nextInt(10);
      lastShot = [x, y];
      while (true) {
        int x = Random().nextInt(10);
        int y = Random().nextInt(10);
        if (brain.receiveShot()) {
          lastHit = lastShot;
        } else {
          break;
        }
      }
    } else {}
    notifyListeners();
  }
}
