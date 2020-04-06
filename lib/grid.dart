import 'package:flutter/material.dart';

import 'constants.dart';

class Grid extends StatefulWidget {
  @override
  _GridState createState() => _GridState();
}

class _GridState extends State<Grid> {
  @override
  Widget build(BuildContext context) {
//    turn = changeTurn(turn);
//    print(turn);
    return Column(
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              color: Colors.white,
              height: 250,
              width: 250,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CardPlaceholder(),
                    SizedBox(width: spacing),
                    CardPlaceholder(),
                    SizedBox(width: spacing),
                    CardPlaceholder()
                  ],
                ),
                SizedBox(height: spacing),
                Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  CardPlaceholder(),
                  SizedBox(width: spacing),
                  CardPlaceholder(),
                  SizedBox(width: spacing),
                  CardPlaceholder()
                ]),
                SizedBox(height: spacing),
                Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  CardPlaceholder(),
                  SizedBox(width: spacing),
                  CardPlaceholder(),
                  SizedBox(width: spacing),
                  CardPlaceholder()
                ]),
              ],
            ),
          ],
        ),
        BottomRow(),
      ],
    );
  }
}

class BottomRow extends StatefulWidget {
  @override
  _BottomRowState createState() => _BottomRowState();
}

class _BottomRowState extends State<BottomRow> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Transform.translate(
          offset: Offset(translateValue, 0.0),
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
                size: 80,
              ),
            ),
            SizedBox(width: 40),
            Container(
//                    width: 100,
//                    height: 40,
              child: Icon(
                Icons.radio_button_unchecked,
                color: Colors.red,
                size: 80,
              ),
            ),
          ],
        ),
        Transform.translate(
          offset: Offset(translateValue, 0.0),
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
    );
  }
}

void changeTurn() {
  if (turn == Turn.P1)
    turn = Turn.P2;
  else
    turn = Turn.P1;
}

class CardPlaceholder extends StatefulWidget {
//  Turn turn;
//  CardPlaceholder(this.turn);
  @override
  _CardPlaceholderState createState() => _CardPlaceholderState();
}

class _CardPlaceholderState extends State<CardPlaceholder> {
  IconData pieceIcon;
  Color iconColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          pieceIcon =
              turn == Turn.P1 ? Icons.close : Icons.radio_button_unchecked;

          iconColor = turn == Turn.P1 ? Colors.green : Colors.red;
          translateValue = turn == Turn.P1 ? -60 : 60;
          changeTurn();

//          if (widget.turn == Turn.P1)
//            widget.turn = Turn.P2;
//          else
//            widget.turn = Turn.P1;
        });
      },
      child: Container(
        height: 100,
        width: 100,
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
