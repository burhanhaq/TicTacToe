import 'package:flutter/material.dart';

import 'constants.dart';

class Grid extends StatefulWidget {
  @override
  _GridState createState() => _GridState();
}

class _GridState extends State<Grid> {
  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}

class CardPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
//      color: Colors.brown,
      color: Theme.of(context).accentColor,
    );
  }
}
