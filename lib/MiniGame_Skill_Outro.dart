import 'dart:async';
import 'package:adobe_xd/pinned.dart';
import 'package:did_u_c_my_dog/MiniGame_Result.dart';
import 'package:did_u_c_my_dog/game_data.dart';
import 'package:flutter/material.dart';


OverlayEntry? overlayEntryMiniGameSkillOutro;


void MiniGameSkillOutro(context) {
  MiniGameResult(context);
  if (overlayEntryMiniGameSkillOutro == null) {

    Timer(Duration(milliseconds: 5000), (){
      overlayEntryMiniGameSkillOutro?.remove();
      overlayEntryMiniGameSkillOutro = null;
      win = 0;
    });

    overlayEntryMiniGameSkillOutro = OverlayEntry(
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
                    Pin(start: 10.0, end: 10.0),
                    Pin(size: 55.0, middle: 0.369),
                    child: Text(
                      win == 1 ? '이번 댕댕퀴즈의 승자는 $nickname!\n이제 상대 댕댕이와 인사해요! 안녕!'
                          : '이번 댕댕퀴즈의 승자는 $opponentNick!\n이제 상대 댕댕이와 인사해요! 안녕!',
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
                    Pin(start: 74.0, end: 74.0),
                    Pin(size: 18.0, end: 25.0),
                    child: Text(
                      '5초 후 종료됩니다.',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: 'TmoneyRoundWindRegular',
                        fontSize: 15,
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
    Overlay.of(context)?.insert(overlayEntryMiniGameSkillOutro!);
  }
}