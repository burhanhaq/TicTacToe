import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants.dart';
import 'game_state.dart';

class BottomRow extends StatefulWidget {
  @override
  _BottomRowState createState() => _BottomRowState();
}

class _BottomRowState extends State<BottomRow> with TickerProviderStateMixin {
  final IconData iconP1 = Icons.close;
  final Color colorP1 = Colors.green;
  final IconData iconP2 = Icons.radio_button_unchecked;
  final Color colorP2 = Colors.red;
  AnimationController controller;
  AnimationController controller2;
  Animation playingAnimation;
  Animation noAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300))
          ..addListener(() => setState(() {}));
    playingAnimation = Tween(begin: 0.5, end: 1.0).animate(controller);
    controller2 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    noAnimation = Tween(begin: 0.5, end: 1.0).animate(controller2);

    controller.forward();
    playingAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GameState>(
      builder: (context, gameState, _) => Column(
        children: <Widget>[
          Transform.translate(
            offset: Offset(gameState.translateValue, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  color: Colors.green,
                  height: 20.0,
                  width: 3.0,
                ),
                Column(
                  children: <Widget>[
                    Container(
                      color: Colors.green,
                      height: 3.0,
                      width: 150.0,
                    ),
                    SizedBox(height: 18),
                  ],
                ),
                Container(
                  color: Colors.green,
                  height: 20.0,
                  width: 3.0,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Icon(iconP1, color: colorP1),
                  Row(
                    children: <Widget>[
                      Icon(iconP1, color: colorP1),
                      Icon(iconP1, color: colorP1),
                    ],
                  ),
                  Icon(iconP1, color: colorP1),
                ],
              ),
//              SizedBox(width: 10),
              Container(
                child: FadeTransition(
                  opacity: gameState.turn == Turn.P1
                      ? playingAnimation
                      : noAnimation,
                  child: Icon(
                    iconP1,
                    color: colorP1,
                    size: 80,
                  ),
                ),
              ),
              SizedBox(width: 40),
              FadeTransition(
                opacity:
                    gameState.turn == Turn.P2 ? playingAnimation : noAnimation,
                child: Container(
                  child: Icon(
                    iconP2,
                    color: colorP2,
                    size: 80,
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  Icon(iconP2, color: colorP2),
                  Row(
                    children: <Widget>[
                      Icon(iconP2, color: colorP2),
                      Icon(iconP2, color: colorP2),
                    ],
                  ),
                  Icon(iconP2, color: colorP2),
                ],
              ),
            ],
          ),
          Transform.translate(
            offset: Offset(gameState.translateValue, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  color: Colors.green,
                  height: 20.0,
                  width: 3.0,
                ),
                Column(
                  children: <Widget>[
                    SizedBox(height: 18),
                    Container(
                      color: Colors.green,
                      height: 3.0,
                      width: 150.0,
                    ),
                  ],
                ),
                Container(
                  color: Colors.green,
                  height: 20.0,
                  width: 3.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    controller2.dispose();
    super.dispose();
  }
}
