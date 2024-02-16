import 'package:flutter/material.dart';
import 'package:wordle/dashboard.dart';
import 'package:wordle/game_board.dart';
import 'package:wordle/game_screen.dart';
import 'package:wordle/welcome_screen.dart';
import 'package:wordle/word.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}
