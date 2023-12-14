import 'dart:async';
import 'package:adobe_xd/pinned.dart';
import 'package:did_u_c_my_dog/MiniGame_Quiz_Game.dart';
import 'package:flutter/material.dart';


OverlayEntry? overlayEntryMiniGameQuizIntro;


void MiniGameQuizIntro(context) {
  // 카운트 다운
  int countdown = 3;

  void startCountdown() {
    if (countdown > 0) {
      Timer(Duration(seconds: 1), () {
        countdown--;
        startCountdown();
        overlayEntryMiniGameQuizIntro?.markNeedsBuild(); // Trigger a rebuild to update the countdown
      });
    }
  }

  startCountdown();


    if (overlayEntryMiniGameQuizIntro == null) {
      Timer(Duration(milliseconds: 5000), () {
        overlayEntryMiniGameQuizIntro?.remove();
        overlayEntryMiniGameQuizIntro = null;
        MiniGameQuizGame(context);
      });

      overlayEntryMiniGameQuizIntro = OverlayEntry(
        builder: (context) =>
            StatefulBuilder(
              builder: (context, setState) =>
                  Stack(
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
                              Pin(size: 63.0, middle: 0.3899),
                              child: Text(
                                '잠시 후 문제가 출제됩니다.\n빠르게 정답을 클릭해주세요!',
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
                              Pin(start: 67.0, end: 67.0),
                              Pin(size: 60.0, end: 16.0),
                              child: Text(
                                countdown > 0 ? '$countdown' : '',
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
      Overlay.of(context)?.insert(overlayEntryMiniGameQuizIntro!);
    }
  }
