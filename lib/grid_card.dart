import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

import 'constants.dart';
import 'game_state.dart';

class GridCard extends StatefulWidget {
  final int cardID;
  IconData playerIcon;
  Color playerColor;
  double opacity = 0.0;
  bool canRotate = false;

  GridCard({@required this.cardID});

  @override
  _GridCardState createState() => _GridCardState();
}

class _GridCardState extends State<GridCard>
    with SingleTickerProviderStateMixin {
  AnimationController iconRotationController;
  Animation animation;
  AnimationStatus animStatus = AnimationStatus.dismissed;

  @override
  void initState() {
    super.initState();
    iconRotationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 2000))
          ..addListener(() => setState(() {}));
    animation = Tween(begin: 0.0, end: 10.0).animate(iconRotationController)
      ..addListener(() {
//        setState(() {});
      })
      ..addStatusListener((status) {
        animStatus = status;
      });
  }

  @override
  Widget build(BuildContext context) {
    double cardSize = MediaQuery.of(context).size.width / 3.2;
    final gameState = Provider.of<GameState>(context);
    if (gameState.winner == Turn.P1 || gameState.winner == Turn.P2) {
      if (!iconRotationController.isAnimating) {
        if (animStatus == AnimationStatus.dismissed) {
          iconRotationController.forward();
          print('going forward');
        } else {
          iconRotationController.reverse();
          print('going reverse');
        }
      }
    }
    return GestureDetector(
      onTap: () {
        bool gameOver = false;
        // Add piece to board if we can
        if (gameState.winner == Turn.None) {
          if (widget.playerIcon == null) {
            widget.playerIcon = gameState.currentTurn == Turn.P1
                ? Icons.close
                : Icons.radio_button_unchecked;
            widget.playerColor =
                gameState.currentTurn == Turn.P1 ? Colors.green : Colors.red;
            gameState.addPiece(widget.cardID);
            gameOver = gameState.isGameOver();
            if (!gameOver) {
              gameState.changeTurn();
              gameState.invertTranslateValue();
            }
          }
        }

        if (gameOver) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 40),
                children: gameState.currentTurn == Turn.Draw
                    ? <TextSpan>[
                        TextSpan(
                            text: 'No Winner, swipe left to reset game...'),
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
                        TextSpan(text: ' won, swipe left to reset game...'),
                      ],
              ),
            ),
          ));
        }
      },
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            height: cardSize,
            width: cardSize,
            color: Theme.of(context).accentColor,
            child: Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()
                ..rotateY(
                  math.pi * animation.value * (widget.canRotate ? 1.0 : 0.0),
                ),
//              angle: 2 * math.pi * animation.value,
              child: Icon(
                widget.playerIcon,
                size: 60,
                color: widget.playerColor,
              ),
            ),
          ),
          Opacity(
            opacity: widget.opacity,
            child: Container(
              height: cardSize * 0.6,
              width: cardSize * 0.6,
              color: widget.playerColor,
            ),
          ),
          Opacity(
            opacity: 0.1,
            child: Icon(
              Icons.crop_free,
              size: cardSize * 0.8,
//              size: 100,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    iconRotationController.dispose();
    super.dispose();
  }
}
