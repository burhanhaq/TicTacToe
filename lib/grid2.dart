import 'package:flutter/material.dart';

import 'constants.dart';

class Grid2 extends StatefulWidget {
  @override
  _Grid2State createState() => _Grid2State();
}

class _Grid2State extends State<Grid2> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
