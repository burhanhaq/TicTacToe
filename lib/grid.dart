import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants.dart';
import 'game_state.dart';

class Grid extends StatefulWidget {
  @override
  _GridState createState() => _GridState();
}

class _GridState extends State<Grid> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          color: Colors.white,
          height: 250,
          width: 250,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CardPlaceholder(),
                SizedBox(width: spacing),
                CardPlaceholder(),
                SizedBox(width: spacing),
                CardPlaceholder()
              ],
            ),
            SizedBox(height: spacing),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CardPlaceholder(),
                SizedBox(width: spacing),
                CardPlaceholder(),
                SizedBox(width: spacing),
                CardPlaceholder()
              ],
            ),
            SizedBox(height: spacing),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CardPlaceholder(),
                SizedBox(width: spacing),
                CardPlaceholder(),
                SizedBox(width: spacing),
                CardPlaceholder()
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class CardPlaceholder extends StatefulWidget {
  @override
  _CardPlaceholderState createState() => _CardPlaceholderState();
}

class _CardPlaceholderState extends State<CardPlaceholder> {
  IconData pieceIcon;
  Color iconColor;
  @override
  Widget build(BuildContext context) {
    final gameState = Provider.of<GameState>(context);
    Turn currentTurn = gameState.turn;
    return GestureDetector(
      onTap: () {
        if (pieceIcon == null) {
          pieceIcon = currentTurn == Turn.P1
              ? Icons.close
              : Icons.radio_button_unchecked;
          iconColor = currentTurn == Turn.P1 ? Colors.green : Colors.red;
          gameState.changeTurn();
//          gameState.turn = currentTurn;
          gameState.invertTranslateValue();
//          gameState.translateValue = gameState.translateValue;
        }
      },
      child: Container(
        height: 100,
        width: 100,
        color: Theme.of(context).accentColor,
        child: Icon(
          pieceIcon,
          size: 60,
          color: iconColor,
        ),
      ),
    );
  }
}
