import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wordle/game_board.dart';
import 'package:wordle/game_provider.dart';
import 'package:wordle/game_screen.dart';



class GameKeyboard extends StatefulWidget {
  GameKeyboard(this.game, {Key? key}) : super(key: key);
  WordleGame game;


  @override
  State<GameKeyboard> createState() => _GameKeyboardState();
}

class _GameKeyboardState extends State<GameKeyboard> {

  List row1 = "QWERTYUIOP".split("");
  List row2 = "ASDFGHJKL".split("");
  List row3 = ["DEL", "Z", "X", "C", "V", "B", "N", "M", "SUBMIT"];


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          WordleGame.game_message,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          height: 20.0,
        ),
        GameBoard(widget.game), //ช่องแสดงศัพท์
        SizedBox(
          height: 30.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: row1.map((e) {
            return InkWell(
              onTap: () {
                print(e);
                if (widget.game.letterId < 5) {
                  print(widget.game.rowId);
                  widget.game.insertWord(widget.game.letterId, Letter(e, 0));
                  widget.game.letterId++;
                  setState(() {});
                }
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      color: Color(0xfff08080)
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                  color: Color(0xffffdab9),
                ),
                child: Text(
                  "${e}",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: row2.map((e) {
            return InkWell(
              onTap: () {
                print(e);
                if (widget.game.letterId < 5) {
                  print(widget.game.rowId);
                  widget.game.insertWord(widget.game.letterId, Letter(e, 0));
                  widget.game.letterId++;
                  setState(() {});
                }
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      color: Color(0xfff08080)
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                  color: Color(0xffffdab9),
                ),
                child: Text(
                  "${e}",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: row3.map((e) {
            return InkWell(
              onTap: () {
                print(e);

                if (e == "DEL") {
                  if (widget.game.letterId > 0) {
                    setState(() {
                      widget.game
                          .insertWord(widget.game.letterId - 1, Letter("", 0));
                      widget.game.letterId--;
                    });
                  }
                } else if (e == "SUBMIT") {
                  // setting the game rules
                  if (widget.game.letterId >= 5) {
                    String guess = widget.game.wordleBoard[widget.game.rowId]
                        .map((e) => e.letter)
                        .join();
                    print(guess);
                    print(WordleGame.game_guess == guess);
                    if (widget.game.checkWordExist(guess.toLowerCase())) {
                      if (guess == WordleGame.game_guess) {
                        setState(() {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Congratulations🎉"),
                                content: Text("You win."),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context); // ปิด Dialog ที่กำลังแสดง

                                      Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => GameScreen()));
                                    },
                                    child: Text("OK"),
                                  ),
                                ],
                              );
                            },
                          );
                          // WordleGame.game_message = "Congratulations🎉";
                          widget.game.wordleBoard[widget.game.rowId]
                              .forEach((element) {
                            element.code = 1;
                          });
                        });
                      } else {
                        print(WordleGame.game_guess);
                        int listLength = guess.length;
                        for (int i = 0; i < listLength; i++) {
                          String char = guess[i].toUpperCase();
                          print(
                              "the test: ${WordleGame.game_guess.contains(
                                  char)}");
                          if (WordleGame.game_guess.contains(char)) {
                            if (WordleGame.game_guess[i] == char) {
                              setState(() {
                                print(char);
                                widget.game.wordleBoard[widget.game.rowId][i]
                                    .code = 1;
                              });
                            } else {
                              setState(() {
                                print(char);
                                widget.game.wordleBoard[widget.game.rowId][i]
                                    .code = 2;
                              });
                            }
                          }
                        }
                        widget.game.rowId++;
                        widget.game.letterId = 0;
                      }
                    } else {
                      WordleGame.game_message =
                      "the world does not exist try again";
                    }
                    if (widget.game.rowId == 5 && guess != WordleGame.game_guess) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Game Over!"),
                            content: Text("You played well, but you lost."),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); // ปิด Dialog ที่กำลังแสดง

                                  Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => GameScreen()));
                                },
                                child: Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  }
                }
                else {
                  if (widget.game.letterId < 5) {
                    print(widget.game.rowId);
                    widget.game.insertWord(widget.game.letterId, Letter(e, 0));
                    widget.game.letterId++;
                    setState(() {});
                  }
                }
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                      color: Color(0xfff08080)
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                  color: Color(0xffffdab9),
                ),
                child: Text(
                  "${e}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}





