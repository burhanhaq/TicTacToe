import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants.dart';
import 'game_state.dart';
import 'grid_card.dart';

class Grid extends StatefulWidget {
  @override
  _GridState createState() => _GridState();
}


class _GridState extends State<Grid> {
  @override
  Widget build(BuildContext context) {
    final double gridLinesLength = MediaQuery.of(context).size.width / 1.2;
    final gameStateGridCards = Provider.of<GameState>(context).gridCards;
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          color: Colors.white,
          height: gridLinesLength,
          width: gridLinesLength,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                gameStateGridCards[0],
                SizedBox(width: spacing),
                gameStateGridCards[1],
                SizedBox(width: spacing),
                gameStateGridCards[2],
              ],
            ),
            SizedBox(height: spacing),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                gameStateGridCards[3],
                SizedBox(width: spacing),
                gameStateGridCards[4],
                SizedBox(width: spacing),
                gameStateGridCards[5],
              ],
            ),
            SizedBox(height: spacing),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                gameStateGridCards[6],
                SizedBox(width: spacing),
                gameStateGridCards[7],
                SizedBox(width: spacing),
                gameStateGridCards[8],
              ],
            ),
          ],
        ),
      ],
    );
  }
}
