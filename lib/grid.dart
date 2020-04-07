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
    final double linesLength = MediaQuery.of(context).size.width / 1.2;
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          color: Colors.white,
          height: linesLength,
          width: linesLength,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CardPlaceholder(cardID: 1),
                SizedBox(width: spacing),
                CardPlaceholder(cardID: 2),
                SizedBox(width: spacing),
                CardPlaceholder(cardID: 3),
              ],
            ),
            SizedBox(height: spacing),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CardPlaceholder(cardID: 4),
                SizedBox(width: spacing),
                CardPlaceholder(cardID: 5),
                SizedBox(width: spacing),
                CardPlaceholder(cardID: 6),
              ],
            ),
            SizedBox(height: spacing),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CardPlaceholder(cardID: 7),
                SizedBox(width: spacing),
                CardPlaceholder(cardID: 8),
                SizedBox(width: spacing),
                CardPlaceholder(cardID: 9),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class CardPlaceholder extends StatefulWidget {
  final int cardID;
  CardPlaceholder({@required this.cardID});
  @override
  _CardPlaceholderState createState() => _CardPlaceholderState();
}

class _CardPlaceholderState extends State<CardPlaceholder> {
  IconData pieceIcon;
  Color iconColor;
  @override
  Widget build(BuildContext context) {
    double cardSize = MediaQuery.of(context).size.width / 3.2;
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
          gameState.invertTranslateValue();
        }
        if (gameState.turn == Turn.Gameover) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Player XYZ won, resetting game state...'),
            backgroundColor: Colors.transparent,
          ));
        }
      },
      child: Container(
        height: cardSize,
        width: cardSize,
//        color: Colors.red,
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
