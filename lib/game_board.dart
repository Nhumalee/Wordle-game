import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wordle/game_provider.dart';

class GameBoard extends StatefulWidget {
  GameBoard(this.game, {Key? key}) : super(key: key);
  WordleGame game;

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: Column(
        children: widget.game.wordleBoard
            .map((e) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: e
              .map((e) => Container(
            padding: EdgeInsets.all(16.0),
            width: 60.0,
            height: 60.0,
            margin: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(
                  width: 3,
                  color: Color(0xffa8dadc)
              ),
              borderRadius: BorderRadius.circular(8.0),
              color: e.code == 0 ? Color(0xfff5ebe0)
                  : e.code == 1 ? Colors.green.shade400
                  : Colors.amber.shade400,
            ),
            child: Center(
                child: Text(
                  e.letter!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ))
              .toList(),
        ))
            .toList(),
      ),
    );
  }
}
