import 'dart:async';
import 'package:adobe_xd/pinned.dart';
import 'package:did_u_c_my_dog/game_data.dart';
import 'package:flutter/material.dart';



OverlayEntry? overlayEntryMiniGameResult;


void MiniGameResult(context) {

  if (overlayEntryMiniGameResult == null) {

    Timer(Duration(seconds: 5), (){
      overlayEntryMiniGameResult?.remove();
      overlayEntryMiniGameResult = null;
      win = 0;
    });

    overlayEntryMiniGameResult = OverlayEntry(
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => Stack(
          children: <Widget>[
            Pinned.fromPins(
              Pin(start: 8.0, end: 28.0), // start 20 end 20
              Pin(size: 54.0, middle: 0.2338),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.0, -1.0),
                    end: Alignment(0.0, 1.0),
                    colors: [
                      const Color(0xffffebf2),
                      const Color(0xffdff9ff)
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
              ),
            ),
            Align(
              alignment: Alignment(-1, -0.51),
              child: SizedBox(
                width: 375.0,
                height: 25.0,
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: 'TmoneyRoundWindRegular',
                      fontSize: 20,
                      color: const Color(0xff000000),
                    ),
                    children: [
                      TextSpan(
                        text: win == 1 ? '$nickname' : '$opponentNick',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: win == 1 && team == 0 ? Color(0xffff7cab) : Color(0xff12d3fe),
                        ),
                      ),
                      TextSpan(
                        text: '가 ',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: const Color(0xff000000),
                        ),
                      ),
                      TextSpan(
                        text: win == 1 ? '$opponentNick' : '$nickname',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: win == 1 && team == 0 ? Color(0xff12d3fe) : Color(0xffff7cab),
                        ),
                      ),
                      TextSpan(
                        text: '의 원판 2개를 물어갔어요!',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: const Color(0xff000000),
                        ),
                      ),
                    ],
                  ),
                  textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    Overlay.of(context)?.insert(overlayEntryMiniGameResult!);
  }
}