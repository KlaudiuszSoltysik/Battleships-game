import 'package:flutter/material.dart';
import 'components.dart';

class Brain with ChangeNotifier {
  int ship5 = 0;
  int ship4 = 0;
  int ship3 = 0;
  int ship2 = 0;
  int ship1 = 0;
  bool accept = false;
  bool lock = false;
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
      checkLength();
    }
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
  }
}
