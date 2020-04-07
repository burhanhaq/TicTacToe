import 'package:flutter/foundation.dart';

import 'constants.dart';

class GameState with ChangeNotifier {
  Turn _turn = Turn.P1;
  double _translateValue = -110;

  Turn get turn => _turn;
  void changeTurn() {
    if (_turn == Turn.P1)
      _turn = Turn.P2;
    else
      _turn = Turn.P1;
    notifyListeners();
  }

  double get translateValue => _translateValue;
  void invertTranslateValue() {
    _translateValue *= -1;
    notifyListeners();
  }
}
