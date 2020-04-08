import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'game_page.dart';
import 'game_state.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic-Tac-Toe',
      theme: ThemeData(
        primaryColor: Colors.grey[200],
        accentColor: Colors.grey[800],
      ),
      home: ChangeNotifierProvider(
        create: (context) => GameState()..resetGame(),
        child: GamePage(),
      ),
    );
  }
}
