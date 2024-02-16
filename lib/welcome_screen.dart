import 'package:flutter/material.dart';

import 'package:wordle/dashboard.dart';


class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePage();
}

class _WelcomePage extends State<WelcomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),
            image: AssetImage("images/bgWelcomeScreen.jpg"),
          ),

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _textHeader(),
            _textContent(),
            _buttonStart(),
          ],
        ),
      ),
    );
  }
  //_textHeader
  Widget _textHeader() {
    return Padding(padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end ,
        children: <Widget>[
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('ผู้จัดทำ IT-64'),
                    content: Text('น.ส.นันทนัชฐ์ อร่ามโชคชัยสกุล 003'
                        '\nน.ส.จันทร์ประภา คลังสิน 009'
                        '\nน.ส. ฤทัยรัตน์ ชูราษี 012'
                        '\nนาย ปาราเมศ บุญยัง 018'
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('ตกลง'),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(
              Icons.people,
              color: Colors.pink,
            ),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('วิธีการเล่น'),
                    content: Text(
                            '    ทายคำที่คิดว่าเป็นคำตอบ คำที่คุณทายจะถูกแสดงบนตาราง โดยการใช้สัญลักษณ์สีต่าง ๆ เพื่อแสดงถึงความถูกต้องของตำแหน่งและอักษรในคำนั้น ๆ\n'
                                '\n'
                            '    สีเขียว: แสดงว่าตัวอักษรนั้นอยู่ในตำแหน่งที่ถูกต้อง\n '
                            '    สีเหลือง: แสดงว่าตัวอักษรนั้นอยู่ในคำ แต่ไม่อยู่ในตำแหน่งที่ถูกต้อง\n  '
                            '    สีเทา: แสดงว่าตัวอักษรนั้นไม่อยู่ในคำ\n'
                                '\n'
                            'โดยจะต้องทายต่อไปจนกว่าคุณจะเดาคำได้ถูกต้องหรือใช้จำนวนรอบที่กำหนดเสร็จสิ้น\n'
                            '\n'
                            '    สิ้นสุดเกม: เมื่อคุณเดาถูกคำหรือใช้จำนวนรอบที่กำหนดเสร็จสิ้น คุณสามารถเลือกที่จะเริ่มเกมใหม่หรือออกจากเกมได้',),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('ตกลง'),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(
              Icons.info_outline,
              color: Colors.pink,
            ),
          ),
        ],
      ),
    );
  }
  //_textContent
  Widget _textContent(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'Guess what ?',
          style: TextStyle(
            fontFamily: 'bubblegum',
            fontSize: 45.0,
            fontWeight: FontWeight.bold,
            color: Color(0xffe26d5c),
          ),
        ),
        Text(
          'รู้หรือไม่',
          style: TextStyle(
            fontFamily: 'rainbow',
            fontSize: 50.0,
            fontWeight: FontWeight.bold,
            color: Color(0xffa2d2ff),
          ),
        ),
      ],
    );
  }
  //_buttonStart
  Widget _buttonStart() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40.0),
      child: SizedBox(
        height:75, //height of button
        width:250,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Color(0xffffdab9)
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              )
            )
          ),
          child: Text(
            'Start',
            style: TextStyle(
              fontFamily: 'bubblegum',
              fontSize: 30.0,
              color: Colors.pink, // สีของตัวอักษร
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Dashboard()),
            );
          },
        ),
      ),
    );
  }
}//Class