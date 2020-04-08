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

class _GamePageState extends State<GamePage> with TickerProviderStateMixin {
  double x = 0;
  double y = 0;
  double z = 0;
  AnimationController screenLeftFlipResetController;
  Animation screenLeftFlipResetAnimation;
  AnimationStatus animStatus = AnimationStatus.dismissed;

  AnimationController scaleDownController;
  Animation scaleDownAnimation;

  @override
  void initState() {
    super.initState();
    screenLeftFlipResetController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    screenLeftFlipResetAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(screenLeftFlipResetController)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) => animStatus = status);

    scaleDownController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    scaleDownAnimation =
        CurvedAnimation(parent: scaleDownController, curve: Curves.elasticOut)
          ..addListener(() => setState(() {}));
//        Tween<double>(begin: 1.0, end: 0.0).animate(scaleDownController)
//          ..addListener(() {
//            setState(() {});
//          });
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
                  screenLeftFlipResetController.forward();
                } else {
                  screenLeftFlipResetController.reverse();
                }
                gameState.resetGame();
              }
            }
          },
          onTap: () {
            if (gameState.winner != Turn.None) {
              if (animStatus == AnimationStatus.dismissed) {
                screenLeftFlipResetController.forward();
              } else {
                screenLeftFlipResetController.reverse();
              }
              gameState.resetGame();
            }
          },
          onLongPress: () {},
          child: Stack(
            children: <Widget>[
              Transform(
                alignment: FractionalOffset.center,
                transform: Matrix4.identity()
                  ..rotateY(math.pi *
                      (screenLeftFlipResetAnimation.value < 0.5
                          ? screenLeftFlipResetAnimation.value
                          : (1 - screenLeftFlipResetAnimation.value)))
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
                          child: Hero(
                            tag: 'title',
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
                        ),
                        SizedBox(height: 30.0),
                        Grid(),
                        BottomRow(),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  scaleDownController.forward();
                  print('tapped');
                },
                child: Transform(
                  alignment: FractionalOffset.center,
                  transform: Matrix4.identity()
                    ..setEntry(1, 1, 1 - scaleDownAnimation.value),
//                    ..setEntry(0, 0, scaleDownAnimation.value),
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.grey[800],
                    child: Center(
//                      child: Text('Let\'s play!',
//                          style: TextStyle(
//                            fontSize: 50,
//                            color: Theme.of(context).primaryColor,
//                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'Tic-Tac-Toe',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 60,
                              decoration: TextDecoration.none,
                              letterSpacing: 1.5,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.close, color: Colors.green, size: 120),
                              Icon(Icons.whatshot, color: Colors.orange, size: 30),
                              Icon(Icons.radio_button_unchecked,
                                  color: Colors.red, size: 120),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    screenLeftFlipResetController.dispose();
    super.dispose();
  }
}
