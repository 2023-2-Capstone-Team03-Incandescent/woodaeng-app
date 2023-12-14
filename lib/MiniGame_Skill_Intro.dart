import 'dart:async';
import 'package:adobe_xd/pinned.dart';
import 'package:did_u_c_my_dog/MiniGame_Skill_Game.dart';
import 'package:did_u_c_my_dog/game_data.dart';
import 'package:flutter/material.dart';


OverlayEntry? overlayEntryMiniGameSkillIntro;

String message = "잠시 후 명령어가 주어져요.\n빠르게 댕기자랑을 보여주세요!";


void MiniGameSkillIntro(context) {
  if (overlayEntryMiniGameSkillIntro == null) {

    Timer(Duration(seconds: 20), (){
      overlayEntryMiniGameSkillIntro?.remove();
      overlayEntryMiniGameSkillIntro = null;
      MiniGameSkillGame(context);
    });

    // 카운트 다운
    int countdown=5;

    void startCountdown() {
      if (countdown > 0) {
        Timer(Duration(seconds: 1), () {
          countdown--;
          startCountdown();
          overlayEntryMiniGameSkillIntro?.markNeedsBuild(); // Trigger a rebuild to update the countdown
        });
      } else {
        message = '시작!';
        overlayEntryMiniGameSkillIntro?.markNeedsBuild(); // Trigger a rebuild to update the message
      }
    }


    startCountdown();

    overlayEntryMiniGameSkillIntro = OverlayEntry(
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
                      '댕기자랑!',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: 'TmoneyRoundWindRegular',
                        fontSize: 30,
                        color: const Color(0xffffc400),
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
                      '$message',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: 'TmoneyRoundWindRegular',
                        fontSize: countdown > 0 ? 20 : 40,
                        color: const Color(0xffff7b00),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(start: 67.0, end: 67.0),
                    Pin(size: 60.0, end: 16.0),
                    child: Text(
                      countdown > 0 ? '$countdown' : '$question',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: 'TmoneyRoundWindRegular',
                        fontSize: 25,
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
    Overlay.of(context)?.insert(overlayEntryMiniGameSkillIntro!);
  }
}
