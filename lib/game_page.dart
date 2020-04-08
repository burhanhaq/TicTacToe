import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

import 'bottom_row.dart';
import 'game_state.dart';
import 'grid.dart';
import 'constants.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage>
    with SingleTickerProviderStateMixin {
  double x = 0;
  double y = 0;
  double z = 0;
  AnimationController screenFlipController;
  Animation animation;
  AnimationStatus animStatus = AnimationStatus.dismissed;

  @override
  void initState() {
    super.initState();
    screenFlipController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(screenFlipController)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) => animStatus = status);
  }

  @override
  Widget build(BuildContext context) {
    final gameState = Provider.of<GameState>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[800],
        body: GestureDetector(
          onHorizontalDragUpdate: (details) {
            if (gameState.winner != Turn.None) {
              if (details.primaryDelta < 0) {
                if (animStatus == AnimationStatus.dismissed) {
                  screenFlipController.forward();
                } else {
                  screenFlipController.reverse();
                }
                gameState.resetGame();
              }
            }
          },
          onTap: () {
            if (gameState.winner != Turn.None) {
                if (animStatus == AnimationStatus.dismissed) {
                  screenFlipController.forward();
                } else {
                  screenFlipController.reverse();
                }
                gameState.resetGame();
              }
          },
          child: Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()
              ..rotateY(math.pi *
                  (animation.value < 0.5
                      ? animation.value
                      : (1 - animation.value)))
              ..setEntry(3, 2, 0.002),
            child: Container(
              color: Theme.of(context).accentColor,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 40.0),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        'Tic-Tac-Toe',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 30,
                          decoration: TextDecoration.none,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Grid(),
                    BottomRow(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    screenFlipController.dispose();
    super.dispose();
  }
}
