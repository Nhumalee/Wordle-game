import 'package:flutter/material.dart';
import 'package:wordle/game_board.dart';
import 'package:wordle/game_keyboard.dart';
import 'package:wordle/game_screen.dart';
import 'package:wordle/game_provider.dart';


class GameScreen extends StatefulWidget {

  const GameScreen({Key? key}) : super(key: key);

  @override

  State<GameScreen> createState() => _GameScreen();
}

class _GameScreen extends State<GameScreen> {

  WordleGame _game = WordleGame();
  late String word;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WordleGame.initGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xfff8ad9d),
      appBar: AppBar(
        backgroundColor:Color(0xfff08080),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Guess word ?",
            style: TextStyle(
              fontFamily: 'bubblegum',
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),


          GameKeyboard(_game),//ช่องคำศัพท์และแป้นพิมพ์
        ],
      ),
    );
  }
}
