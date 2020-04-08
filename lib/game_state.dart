import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'grid_card.dart';

class GameState with ChangeNotifier {
  Turn _turn = Turn.P1;
  double _translateValue = -110;
  int _cardsFilled = 0;
  final gridCards = [
    GridCard(cardID: 0),
    GridCard(cardID: 1),
    GridCard(cardID: 2),
    GridCard(cardID: 3),
    GridCard(cardID: 4),
    GridCard(cardID: 5),
    GridCard(cardID: 6),
    GridCard(cardID: 7),
    GridCard(cardID: 8),
  ];


  Turn get currentTurn => _turn;

  double get translateValue => _translateValue;
  var _gameBoard = [];

  void resetGame() {
    _cardsFilled = 0;
    _turn = Turn.P1;
    _gameBoard.clear();
    for (int i = 0; i < 9; i++) {
      _gameBoard.add(Turn.None);
    }
    for (int i = 0; i < 9; i++) {
      gridCards[i].playerIcon = null;
    }
    notifyListeners();
  }

  void addPiece(int index) {
    ++_cardsFilled;
    _gameBoard[index] = _turn;
    notifyListeners();
  }

  bool isGameOver() {
    // top row
    if (_gameBoard[0] == _gameBoard[1] &&
        _gameBoard[1] == _gameBoard[2] &&
        _gameBoard[2] == _turn) {
      return true;
    }
    // bottom row
    if (_gameBoard[6] == _gameBoard[7] &&
        _gameBoard[7] == _gameBoard[8] &&
        _gameBoard[8] == _turn) {
      return true;
    }
    // left column
    if (_gameBoard[0] == _gameBoard[3] &&
        _gameBoard[3] == _gameBoard[6] &&
        _gameBoard[6] == _turn) {
      return true;
    }
    // right column
    if (_gameBoard[2] == _gameBoard[5] &&
        _gameBoard[5] == _gameBoard[8] &&
        _gameBoard[8] == _turn) {
      return true;
    }
    // middle column
    if (_gameBoard[1] == _gameBoard[4] &&
        _gameBoard[4] == _gameBoard[7] &&
        _gameBoard[7] == _turn) {
      return true;
    }
    // middle row
    if (_gameBoard[3] == _gameBoard[4] &&
        _gameBoard[4] == _gameBoard[5] &&
        _gameBoard[5] == _turn) {
      return true;
    }
    // top-left to bottom-right diagonal
    if (_gameBoard[0] == _gameBoard[4] &&
        _gameBoard[4] == _gameBoard[8] &&
        _gameBoard[8] == _turn) {
      return true;
    }
    // top-right to bottom-left diagonal
    if (_gameBoard[2] == _gameBoard[4] &&
        _gameBoard[4] == _gameBoard[6] &&
        _gameBoard[6] == _turn) {
      return true;
    }
    if (_cardsFilled == 9) {
      _turn = Turn.Draw;
      notifyListeners();
      return true;
    }

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
