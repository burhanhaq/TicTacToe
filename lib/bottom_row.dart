import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'game_state.dart';

class BottomRow extends StatelessWidget {
  final double iconSize = 80.0;
  final IconData iconP1 = Icons.close;
  final Color colorP1 = Colors.green;
  final IconData iconP2 = Icons.radio_button_unchecked;
  final Color colorP2 = Colors.red;

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
                child: Icon(
                  iconP1,
                  color: colorP1,
                  size: iconSize,
                ),
              ),
              SizedBox(width: 40),
              Container(
                child: Icon(
                  iconP2,
                  color: colorP2,
                  size: iconSize,
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
}
