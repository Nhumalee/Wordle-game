import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wordle/game_screen.dart';
import 'package:wordle/game_provider.dart';
import 'package:wordle/word.dart';

class Dashboard extends StatelessWidget {
  var height, width;

  List<String> img_src = [
    "images/color.png",
    "images/food.png",
    "images/thing.png",
    "images/fruit.png",
    "images/animal2.png",
    "images/occu.png",

  ];
  List img_title = ["Color",
    "Food",
    "Thing",
    "Fruit",
    "Animal",
    "Occupation",
  ];
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xfff8ad9d),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: height * 0.20,
                width: width,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30,left: 10),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              SystemNavigator.pop();
                            },
                            child: Icon(
                              Icons.power_settings_new,
                              color: Color(0xfff08080),
                              size: 30,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),

                      child: Container(
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Color(0xfff08080),
                        ),
                        child: Column(
                          children: [
                            Container(
                             padding: EdgeInsets.only(top: 7),
                              margin: EdgeInsets.all(10),
                              child: Text(
                                "Category",
                                style: TextStyle(
                                  fontFamily: 'bubblegum',
                                  fontSize: 37,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  height: height*0.9,
                  width: width,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 25,
                      childAspectRatio: 1.1,
                    ),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: img_src.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          if(img_src[index]== "images/color.png"){
                            WordleGame.word_list = Color_words;
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => GameScreen()));

                          };
                          if(img_src[index]== "images/food.png"){
                            WordleGame.word_list = Food_words;
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => GameScreen()));

                          };
                          if(img_src[index]== "images/thing.png"){
                            WordleGame.word_list = Thing_words;
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => GameScreen()));

                          };
                          if(img_src[index]== "images/fruit.png"){
                            WordleGame.word_list = Fruit_words;
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => GameScreen()));

                          };
                          if(img_src[index]== "images/animal2.png"){
                            WordleGame.word_list = Animal_words;
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => GameScreen()));

                          };
                          if(img_src[index]== "images/occu.png"){
                            WordleGame.word_list = Occu_words;
                           Navigator.of(context).push(MaterialPageRoute(builder: (context) => GameScreen()));

                          };

                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xfff5ebe0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                spreadRadius: 1,
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              img_src[index] == "images/color.png" || img_src[index] == "images/occu.png"
                                  ? Column(
                                children: [
                                  Image.asset(
                                    img_src[index],
                                    width: 70,
                                  ),

                                ],
                              )
                                  : Image.asset(img_src[index],
                                  width: 100,),
                              Text(
                                img_title[index],
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
