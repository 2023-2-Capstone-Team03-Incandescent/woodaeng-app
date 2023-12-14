import 'dart:async';
import 'package:adobe_xd/pinned.dart';
import 'package:did_u_c_my_dog/MiniGame_Quiz_Outro.dart';
import 'package:did_u_c_my_dog/game_data.dart';
import 'package:flutter/material.dart';
import 'dart:collection';
import 'NaverMapTest.dart';



OverlayEntry? overlayEntryMiniGameQuizGame;



void MiniGameQuizGame(context) {


  bool isClicked1 = false;
  bool isClicked2 = false;
  bool isClicked3 = false;
  bool isClicked4 = false;


  if (overlayEntryMiniGameQuizGame == null) {

    Timer(Duration(seconds: 20), (){
      overlayEntryMiniGameQuizGame?.remove();
      overlayEntryMiniGameQuizGame = null;
      MiniGameQuizOutro(context);
    });

    overlayEntryMiniGameQuizGame = OverlayEntry(
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => Stack(
          children: <Widget>[
            Pinned.fromPins(
              Pin(start: 13.0, end: 13.0),
              Pin(size: 204.0, middle: 0.4496),
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, -1.0),
                        end: Alignment(0.0, 1.0),
                        colors: [
                          const Color(0xffffffff),
                          const Color(0xffe8e8e8)
                        ],
                        stops: [0.0, 1.0],
                      ),
                      borderRadius: BorderRadius.circular(34.0),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xffc9c9c9),
                          offset: Offset(0, 0),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    margin: EdgeInsets.fromLTRB(6.0, 2.0, 6.0, 0.0),
                  ),
                  Pinned.fromPins(
                    Pin(size: 154.0, middle: 0.5),
                    Pin(size: 37.0, start: 8.0),
                    child: Text(
                      '댕댕퀴즈!',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: 'TmoneyRoundWindRegular',
                        fontSize: 30,
                        color: const Color(0xffc41eff),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 40.0, middle: 0.2211),
                    Pin(size: 48.0, start: 2.0),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage(
                              'assets/images/MiniGameRed_Icon.png'),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.582, -1.0),
                    child: Container(
                      width: 40.0,
                      height: 47.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage(
                              'assets/images/MiniGameBlue_Icon.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(size: 63.0, middle: 0.3899),
                    child: Text(
                      '$question',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: 'TmoneyRoundWindRegular',
                        fontSize: 20,
                        color: const Color(0xffff7b00),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 100.0, start: 37.0),
                    Pin(size: 19.0, middle: 0.6324),
                    child: GestureDetector(
                      onTap: () {
                        if(option?['$answer'] != option!['0'] && isClicked2 == false && isClicked3 == false && isClicked4 == false) {
                          isClicked1 = true;
                          print('clicked! $isClicked1');
                          overlayEntryMiniGameQuizGame?.markNeedsBuild();
                        }
                        else if(option?['$answer'] == option!['0']) {
                          print('정답입니다');
                          isClicked1 = true;
                          win = 1;
                          minigameResult(win!);
                        }
                      },
                      child: Text(
                        '1. ${option!['0']}',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: 'TmoneyRoundWindRegular',
                          fontSize: 16,
                          color: isClicked1 ?  Colors.red : Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 100.0, start: 37.0),
                    Pin(size: 19.0, end: 30.0),
                    child: GestureDetector(
                      onTap: () {
                        if(option?['$answer'] != option!['2'] && isClicked1 == false && isClicked2 == false && isClicked4 == false) {
                          isClicked3 = true;
                          print('clicked! $isClicked3');
                          overlayEntryMiniGameQuizGame?.markNeedsBuild();
                        }
                        else if(option?['$answer'] == option!['2']) {
                          print('정답입니다');
                          isClicked3 = true;
                          win = 1;
                          minigameResult(win!);
                        }
                      },
                      child: Text(
                        '3. ${option!['2']}',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: 'TmoneyRoundWindRegular',
                          fontSize: 16,
                          color: isClicked3 ?  Colors.red : Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 100.0, end: 37.0),
                    Pin(size: 19.0, end: 30.0),
                    child: GestureDetector(
                      onTap: () {
                        if(option?['$answer'] != option!['3'] && isClicked1 == false && isClicked2 == false && isClicked3 == false) {
                          isClicked4 = true;
                          print('clicked! $isClicked4');
                          overlayEntryMiniGameQuizGame?.markNeedsBuild();
                        }
                        else if(option?['$answer'] == option!['3']) {
                          print('정답입니다');
                          isClicked4 = true;
                          win = 1;
                          minigameResult(win!);
                        }
                      },
                      child: Text(
                        '4. ${option!['3']}',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: 'TmoneyRoundWindRegular',
                          fontSize: 16,
                          color: isClicked4 ?  Colors.red : Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 100.0, end: 37.0),
                    Pin(size: 19.0, middle: 0.6324),
                    child: GestureDetector(
                      onTap: () {
                        if(option?['$answer'] != option!['1'] && isClicked1 == false && isClicked3 == false && isClicked4 == false) {
                          isClicked2 = true;
                          print('clicked! $isClicked2');
                          overlayEntryMiniGameQuizGame?.markNeedsBuild();
                        }
                        else if(option?['$answer'] == option!['1']) {
                          print('정답입니다');
                          isClicked2 = true;
                          win = 1;
                          minigameResult(win!);
                        }
                      },
                      child: Text(
                        '2. ${option!['1']}',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: 'TmoneyRoundWindRegular',
                          fontSize: 16,
                          color: isClicked2 ?  Colors.red : Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    Overlay.of(context)?.insert(overlayEntryMiniGameQuizGame!);
  }
}