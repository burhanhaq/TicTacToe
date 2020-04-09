import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'grid_card.dart';

class GameState with ChangeNotifier {
  Turn _turn = Turn.P1;
  double _translateValue = -1;
  int _cardsFilled = 0;
  Turn _winner = Turn.None;
  final gridCards = [];

  Turn get currentTurn => _turn;

  double get translateDirection => _translateValue;

  Turn get winner => _winner;
  var _gameBoard = [];

  void resetGame() {
    _cardsFilled = 0;
    _turn = Turn.P1;
    _translateValue = -1;
    _winner = Turn.None;
    _gameBoard.clear();
    gridCards.clear();
    for (int i = 0; i < 9; i++) {
      _gameBoard.add(Turn.None);
      gridCards.add(GridCard(cardID: i));
      gridCards[i].playerIcon = null;
      gridCards[i].opacity = 0.0;
    }
    notifyListeners();
  }

  void addPiece(int index) {
    ++_cardsFilled;
    _gameBoard[index] = _turn;
  }

  void _setWinningCards(int one, int two, int three) {
    gridCards[one].opacity = kOpacityLevel;
    gridCards[two].opacity = kOpacityLevel;
    gridCards[three].opacity = kOpacityLevel;

    gridCards[one].canRotate = true;
    gridCards[two].canRotate = true;
    gridCards[three].canRotate = true;
  }

  bool isGameOver() {
    bool gameOver = false;
    // top row
    if (_gameBoard[0] == _gameBoard[1] &&
        _gameBoard[1] == _gameBoard[2] &&
        _gameBoard[2] == _turn) {
      _setWinningCards(0, 1, 2);
      gameOver = true;
      // bottom row
    } else if (_gameBoard[6] == _gameBoard[7] &&
        _gameBoard[7] == _gameBoard[8] &&
        _gameBoard[8] == _turn) {
      _setWinningCards(6, 7, 8);
      gameOver = true;
    }
    // left column
    else if (_gameBoard[0] == _gameBoard[3] &&
        _gameBoard[3] == _gameBoard[6] &&
        _gameBoard[6] == _turn) {
      _setWinningCards(0, 3, 6);
      gameOver = true;
    }
    // right column
    else if (_gameBoard[2] == _gameBoard[5] &&
        _gameBoard[5] == _gameBoard[8] &&
        _gameBoard[8] == _turn) {
      _setWinningCards(2, 5, 8);
      gameOver = true;
    }
    // middle column
    else if (_gameBoard[1] == _gameBoard[4] &&
        _gameBoard[4] == _gameBoard[7] &&
        _gameBoard[7] == _turn) {
      _setWinningCards(1, 4, 7);
      gameOver = true;
    }
    // middle row
    else if (_gameBoard[3] == _gameBoard[4] &&
        _gameBoard[4] == _gameBoard[5] &&
        _gameBoard[5] == _turn) {
      _setWinningCards(3, 4, 5);
      gameOver = true;
    }
    // top-left to bottom-right diagonal
    else if (_gameBoard[0] == _gameBoard[4] &&
        _gameBoard[4] == _gameBoard[8] &&
        _gameBoard[8] == _turn) {
      _setWinningCards(0, 4, 8);
      gameOver = true;
    }
    // top-right to bottom-left diagonal
    else if (_gameBoard[2] == _gameBoard[4] &&
        _gameBoard[4] == _gameBoard[6] &&
        _gameBoard[6] == _turn) {
      _setWinningCards(2, 4, 6);
      gameOver = true;
    } else if (_cardsFilled == 9) {
      _turn = Turn.Draw;
      gameOver = true;
    }

    if (_turn == Turn.Draw) {
      print('Draw');
    }
    if (gameOver) {
      _winner = _turn;
    }
    notifyListeners();

    return gameOver;
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
