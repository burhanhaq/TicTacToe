import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants.dart';
import 'game_state.dart';
import 'grid.dart';

class GridCard extends StatefulWidget {
  final int cardID;
  IconData playerIcon;
  Color playerColor;

  GridCard({@required this.cardID});

  @override
  _GridCardState createState() => _GridCardState();
}

class _GridCardState extends State<GridCard> {
  @override
  Widget build(BuildContext context) {
    double cardSize = MediaQuery.of(context).size.width / 3.2;
    final gameState = Provider.of<GameState>(context);
    return GestureDetector(
      onTap: () {
        bool gameOver = false;
        // Add piece to board if we can
        if (widget.playerIcon == null) {
          widget.playerIcon = gameState.currentTurn == Turn.P1
              ? Icons.close
              : Icons.radio_button_unchecked;
          widget.playerColor =
              gameState.currentTurn == Turn.P1 ? Colors.green : Colors.red;
          gameState.addPiece(widget.cardID);
          gameOver = gameState.isGameOver();
        }

        if (gameOver) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 20),
                children: gameState.currentTurn == Turn.Draw
                    ? <TextSpan>[
                        TextSpan(text: 'No Winner, resetting game board...'),
                      ]
                    : <TextSpan>[
                        TextSpan(text: 'Player '),
                        TextSpan(
                          text: gameState.currentTurn == Turn.P1 ? 'X' : 'O',
                          style: TextStyle(
                              color: gameState.currentTurn == Turn.P1
                                  ? Colors.green
                                  : Colors.red),
                        ),
                        TextSpan(text: ' won, resetting game state...'),
                      ],
              ),
            ),
          ));
          gameState.resetGame();
        } else {
          gameState.changeTurn();
          gameState.invertTranslateValue();
        }
      },
      child: Container(
        height: cardSize,
        width: cardSize,
//        color: Colors.yellow,
        color: Theme.of(context).accentColor,
        child: Icon(
          widget.playerIcon,
          size: 60,
          color: widget.playerColor,
        ),
      ),
    );
  }
}
