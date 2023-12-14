import 'dart:async';
import 'package:adobe_xd/pinned.dart';
import 'package:did_u_c_my_dog/MiniGame_Quiz_Intro.dart';
import 'package:did_u_c_my_dog/MiniGame_Skill_Intro.dart';
import 'package:did_u_c_my_dog/game_data.dart';
import 'package:flutter/material.dart';


OverlayEntry? overlayEntryMinigameIntro;


void MiniGameIntro(context) {
  if (overlayEntryMinigameIntro == null) {

    Timer(Duration(milliseconds: 5000), (){
      overlayEntryMinigameIntro?.remove();
      overlayEntryMinigameIntro = null;

      // 백앤드에서 게임타입 받음
      if(gameType == 0) MiniGameQuizIntro(context);
      else if(gameType == 1) MiniGameSkillIntro(context);

    });


    overlayEntryMinigameIntro = OverlayEntry(
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => Stack(
          children: <Widget>[
            Pinned.fromPins(
              Pin(start: 19.0, end: 19.0),
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
                    margin: EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 0.0),
                  ),
                  Pinned.fromPins(
                    Pin(size: 154.0, middle: 0.5),
                    Pin(size: 37.0, start: 8.0),
                    child: Text(
                      '미니게임!',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: 'TmoneyRoundWindRegular',
                        fontSize: 30,
                        color: const Color(0xff20ac5d),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 40.0, middle: 0.2092),
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
                    alignment: Alignment(0.606, -1.0),
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
                    Pin(start: 20.0, end: 19.0),
                    Pin(size: 85.0, middle: 0.462),
                    child: Text(
                      '안전한 게임 진행을 위해 상대\n플레이어와 함께 안전한 장소로 \n이동해 주세요!',
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
                    Pin(size: 50.0, middle: 0.1801),
                    Pin(size: 50.0, end: 17.0),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage('$image_id'),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(72.0),
                        border: Border.all(
                            width: 2.0, color: const Color(0xffff7cab)),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 50.0, middle: 0.8199),
                    Pin(size: 50.0, end: 17.0),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage('$opponentImage'),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                        border: Border.all(
                            width: 2.0, color: const Color(0xff12d3fe)),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 120.0, middle: 0.5),
                    Pin(size: 21.0, end: 35.0),
                    child: Text(
                      '이동했어요!',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: 'TmoneyRoundWindRegular',
                        fontSize: 20,
                        color: const Color(0xff000000),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    Overlay.of(context)?.insert(overlayEntryMinigameIntro!);
  }
}