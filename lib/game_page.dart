import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  double spacing = 3.0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              Container(
                child: Stack(
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
                            Card(),
                            SizedBox(width: spacing),
                            Card(),
                            SizedBox(width: spacing),
                            Card()
                          ],
                        ),
                        SizedBox(height: spacing),
                        Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                          Card(),
                          SizedBox(width: spacing),
                          Card(),
                          SizedBox(width: spacing),
                          Card()
                        ]),
                        SizedBox(height: spacing),
                        Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                          Card(),
                          SizedBox(width: spacing),
                          Card(),
                          SizedBox(width: spacing),
                          Card()
                        ]),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
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
