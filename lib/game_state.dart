import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'grid_card.dart';

class GameState with ChangeNotifier {
  Turn _turn = Turn.P1;
  double _translateValue = -110;
  int _cardsFilled = 0;
  Turn _winner = Turn.None;
  final gridCards = [
//    GridCard(cardID: 0),
//    GridCard(cardID: 1),
//    GridCard(cardID: 2),
//    GridCard(cardID: 3),
//    GridCard(cardID: 4),
//    GridCard(cardID: 5),
//    GridCard(cardID: 6),
//    GridCard(cardID: 7),
//    GridCard(cardID: 8),
  ];

  Turn get currentTurn => _turn;
  double get translateValue => _translateValue;
  Turn get winner => _winner;
  var _gameBoard = [];

  void resetGame() {
    _cardsFilled = 0;
    _turn = Turn.P1;
    _translateValue = -110;
//    gameOver = false;
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
    notifyListeners();
  }

  bool isGameOver() {
    bool gameOver = false;
    // top row
    if (_gameBoard[0] == _gameBoard[1] &&
        _gameBoard[1] == _gameBoard[2] &&
        _gameBoard[2] == _turn) {
      gridCards[0].opacity = kOpacityLevel;
      gridCards[1].opacity = kOpacityLevel;
      gridCards[2].opacity = kOpacityLevel;
      gameOver = true;
      // bottom row
    } else if (_gameBoard[6] == _gameBoard[7] &&
        _gameBoard[7] == _gameBoard[8] &&
        _gameBoard[8] == _turn) {
      gridCards[6].opacity = kOpacityLevel;
      gridCards[7].opacity = kOpacityLevel;
      gridCards[8].opacity = kOpacityLevel;
      gameOver = true;
    }
    // left column
    else if (_gameBoard[0] == _gameBoard[3] &&
        _gameBoard[3] == _gameBoard[6] &&
        _gameBoard[6] == _turn) {
      gridCards[0].opacity = kOpacityLevel;
      gridCards[3].opacity = kOpacityLevel;
      gridCards[6].opacity = kOpacityLevel;
      gameOver = true;
    }
    // right column
    else if (_gameBoard[2] == _gameBoard[5] &&
        _gameBoard[5] == _gameBoard[8] &&
        _gameBoard[8] == _turn) {
      gridCards[2].opacity = kOpacityLevel;
      gridCards[5].opacity = kOpacityLevel;
      gridCards[8].opacity = kOpacityLevel;
      gameOver = true;
    }
    // middle column
    else if (_gameBoard[1] == _gameBoard[4] &&
        _gameBoard[4] == _gameBoard[7] &&
        _gameBoard[7] == _turn) {
      gridCards[1].opacity = kOpacityLevel;
      gridCards[4].opacity = kOpacityLevel;
      gridCards[7].opacity = kOpacityLevel;
      gameOver = true;
    }
    // middle row
    else if (_gameBoard[3] == _gameBoard[4] &&
        _gameBoard[4] == _gameBoard[5] &&
        _gameBoard[5] == _turn) {
      gridCards[3].opacity = kOpacityLevel;
      gridCards[4].opacity = kOpacityLevel;
      gridCards[5].opacity = kOpacityLevel;
      gameOver = true;
    }
    // top-left to bottom-right diagonal
    else if (_gameBoard[0] == _gameBoard[4] &&
        _gameBoard[4] == _gameBoard[8] &&
        _gameBoard[8] == _turn) {
      gridCards[0].opacity = kOpacityLevel;
      gridCards[4].opacity = kOpacityLevel;
      gridCards[8].opacity = kOpacityLevel;
      gameOver = true;
    }
    // top-right to bottom-left diagonal
    else if (_gameBoard[2] == _gameBoard[4] &&
        _gameBoard[4] == _gameBoard[6] &&
        _gameBoard[6] == _turn) {
      gridCards[2].opacity = kOpacityLevel;
      gridCards[4].opacity = kOpacityLevel;
      gridCards[6].opacity = kOpacityLevel;
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
