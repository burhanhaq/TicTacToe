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
  AnimationController screenLeftFlipResetController;
  Animation screenLeftFlipResetAnimation;
  AnimationStatus animStatus = AnimationStatus.dismissed;

  AnimationController screenOpacityController;
  Animation screenOpacityAnimation;
  double screenScale = 1.0;

  AnimationController titleTranslateController;
  Animation titleTranslateAnimation;

  AnimationController titleTextSizeController;
  Animation titleTextSizeAnimation;

  AnimationController playerIconSizeController;
  Animation playerIconSizeAnimation;

  AnimationController fireIconSizeController;
  Animation fireIconSizeAnimation;

  AnimationController iconTranslateController;
  Animation iconTranslateAnimation;

  AnimationController iconOpacityController;
  Animation iconOpacityAnimation;

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

    screenOpacityController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 500));
    screenOpacityAnimation =
//        CurvedAnimation(parent: screenOpacityController, curve: Curves.elasticOut)
//          ..addListener(() => setState(() {}));
        Tween<double>(begin: 0.7, end: 0.0).animate(screenOpacityController)
          ..addListener(() {
            setState(() {});
          })
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed)
        screenScale = 0.0;
    });



    titleTranslateController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    titleTranslateAnimation = Tween<double>(begin: 0.1, end: 0.4)
        .animate(titleTranslateController)
      ..addListener(() {
        setState(() {});
      });

    titleTextSizeController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    titleTextSizeAnimation = Tween<double>(begin: 1.0, end: 0.6)
        .animate(titleTextSizeController)
      ..addListener(() {
        setState(() {});
      });

    playerIconSizeController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    playerIconSizeAnimation = Tween<double>(begin: 1.0, end: 0.5)
        .animate(playerIconSizeController)
      ..addListener(() {
        setState(() {});
      });

    fireIconSizeController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    fireIconSizeAnimation = Tween<double>(begin: 1.0, end: 2.0)
        .animate(fireIconSizeController)
      ..addListener(() {
        setState(() {});
      });

    iconTranslateController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    iconTranslateAnimation = Tween<double>(begin: 0.25, end: 0.337)
        .animate(iconTranslateController)
      ..addListener(() {
        setState(() {});
      })
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        iconOpacityController.forward();
      }
    });

    iconOpacityController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    iconOpacityAnimation = Tween<double>(begin: 1.0, end: 0.0)
        .animate(iconOpacityController)
      ..addListener(() {
        setState(() {});
      });
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
            alignment: Alignment.center,
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
                        SizedBox(height: 60.0),
                        SizedBox(height: 50.0),
                        Grid(),
                        BottomRow(),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  screenOpacityController.forward();
                  titleTranslateController.forward();
                  titleTextSizeController.forward();
                  fireIconSizeController.forward();
                  playerIconSizeController.forward();
                  iconTranslateController.forward();
                  print('tapped');
                },
                child: Opacity(
                  opacity: screenOpacityAnimation.value,
                  child: Transform.scale(
                    scale: screenScale,
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      color: Colors.grey[900],
                    ),
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(0.0, -MediaQuery.of(context).size.height * titleTranslateAnimation.value), // middle
                child: Text(
                  'Tic-Tac-Toe',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 60 * titleTextSizeAnimation.value,
                    decoration: TextDecoration.none,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(0.0, MediaQuery.of(context).size.height * iconTranslateAnimation.value),
                child: Opacity(
                  opacity: iconOpacityAnimation.value,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.close, color: Colors.green, size: 160 * playerIconSizeAnimation.value),
                      Icon(Icons.whatshot, color: Colors.orange, size: 40 * fireIconSizeAnimation.value), // starting
                      Icon(Icons.radio_button_unchecked,
                          color: Colors.red, size: 160 * playerIconSizeAnimation.value),
                    ],
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
    screenOpacityController.dispose();
    titleTextSizeController.dispose();
    titleTranslateController.dispose();
    playerIconSizeController.dispose();
    fireIconSizeController.dispose();
    super.dispose();
  }
}
