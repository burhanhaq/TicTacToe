import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'game_state.dart';

class BottomRow extends StatelessWidget {
  final double iconSize = 80.0;
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
                      width: 100.0,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
//                    width: 100,
//                    height: 40,
                child: Icon(
                  Icons.close,
                  color: Colors.green,
                  size: iconSize,
                ),
              ),
              SizedBox(width: 40),
              Container(
//                    width: 100,
//                    height: 40,
                child: Icon(
                  Icons.radio_button_unchecked,
                  color: Colors.red,
                  size: iconSize,
                ),
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
                      width: 100.0,
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
