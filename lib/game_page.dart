import 'package:flutter/material.dart';

import 'grid.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
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
              Grid(),
            ],
          ),
        ),
      ),
    );
  }
}
