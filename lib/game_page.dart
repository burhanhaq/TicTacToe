import 'package:flutter/material.dart';

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
        child: Column(
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
            Flexible(
              fit: FlexFit.loose,
              child: GridView.count(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 40),
                crossAxisSpacing: 3,
                mainAxisSpacing: 3,
                crossAxisCount: 3,
                children: List.generate(9, (_) {
                  return card();
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget card() {
  return Container(
    height: 5.0,
    width: 5.0,
    color: Colors.brown,
  );
}
