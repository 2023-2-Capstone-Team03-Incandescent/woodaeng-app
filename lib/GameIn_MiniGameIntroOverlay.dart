import 'dart:async';
import 'package:adobe_xd/pinned.dart';
import 'package:did_u_c_my_dog/MiniGame_Intro.dart';
import 'package:flutter/material.dart';


OverlayEntry? overlayEntryMinigameIntro;

void MiniGameIntroOverlay(BuildContext context) {
  if (overlayEntryMinigameIntro == null) {

    // 흑-백 색깔 전환하기
    Color backgroundColor = Colors.black;
    Color textColor = Colors.white;


    Timer.periodic(Duration(milliseconds: 700), (timer) {
      backgroundColor = (backgroundColor == Colors.black) ? Colors.white : Colors.black; // 배경 색 토글
      textColor = (textColor == Colors.white) ? Colors.black : Colors.white; // 텍스트 색 토글

      overlayEntryMinigameIntro!.markNeedsBuild(); // 오버레이 계속 덮어 씌우기
    });

    Timer(Duration(milliseconds: 5600), () {
      overlayEntryMinigameIntro?.remove(); //
      overlayEntryMinigameIntro = null; // overylay entry null로 해야 나중에 또 호출(생성) 가능함
      MiniGameIntro(context);
    });

    overlayEntryMinigameIntro = OverlayEntry(
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => Stack(
          children: <Widget>[
            Container(
              color: backgroundColor,
            ),
            Center(
              child: Container(
                width: 158.0,
                height: 158.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('assets/images/MiniGame_Icon.png'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(start: 18.0, end: 18.0),
              Pin(size: 58.0, middle: 0.2491),
              child: Text(
                '상대 댕댕이 발견!',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontFamily: 'TmoneyRoundWindRegular',
                  fontSize: 40,
                  color: textColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
    Overlay.of(context)?.insert(overlayEntryMinigameIntro!);
  }
}