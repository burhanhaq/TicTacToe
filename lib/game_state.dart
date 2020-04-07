import 'package:flutter/foundation.dart';

import 'constants.dart';

class GameState with ChangeNotifier {
  Turn _turn = Turn.P1;
  double _translateValue = -110;
  Turn _winner;

  Turn get turn => _turn;

  double get translateValue => _translateValue;
  var gameBoard = [];

  void initializeGameBoard() {
    gameBoard.clear();
    for (int i = 0; i < 9; i++) {
      gameBoard.add(Turn.None);
    }
  }

  void addPiece(int index) {
    gameBoard[index] = _turn;
  }

  bool isGameOver() {
    // top row
    if (gameBoard[0] == gameBoard[1] &&
        gameBoard[1] == gameBoard[2] &&
        gameBoard[2] == _turn) return true;
    // bottom row
    if (gameBoard[6] == gameBoard[7] &&
        gameBoard[7] == gameBoard[8] &&
        gameBoard[8] == _turn) return true;
    // left column
    if (gameBoard[0] == gameBoard[3] &&
        gameBoard[3] == gameBoard[6] &&
        gameBoard[6] == _turn) return true;
    // right column
    if (gameBoard[2] == gameBoard[5] &&
        gameBoard[5] == gameBoard[8] &&
        gameBoard[8] == _turn) return true;
    // middle column
    if (gameBoard[1] == gameBoard[4] &&
        gameBoard[4] == gameBoard[7] &&
        gameBoard[7] == _turn) return true;
    // middle row
    if (gameBoard[3] == gameBoard[4] &&
        gameBoard[4] == gameBoard[5] &&
        gameBoard[5] == _turn) return true;
    // top-left to bottom-right diagonal
    if (gameBoard[0] == gameBoard[4] &&
        gameBoard[4] == gameBoard[8] &&
        gameBoard[8] == _turn) return true;
    // top-right to bottom-left diagonal
    if (gameBoard[2] == gameBoard[4] &&
        gameBoard[4] == gameBoard[6] &&
        gameBoard[6] == _turn) return true;
    return false;
  }

  void changeTurn() {
    if (_turn == Turn.P1)
      _turn = Turn.P2;
    else
      _turn = Turn.P1;
    notifyListeners();
  }

  void invertTranslateValue() {
    _translateValue *= -1;
    notifyListeners();
  }
}
