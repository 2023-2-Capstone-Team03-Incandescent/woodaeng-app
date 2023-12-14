import 'dart:async';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';


OverlayEntry? overlayEntryGoldenBallSpawnOverlay;
OverlayEntry? overlayEntryRandomBoxSpawnOverlay;



void GoldenBallSpawnOverlay(context) {
  if (overlayEntryGoldenBallSpawnOverlay == null) {

    Timer(Duration(milliseconds: 5000), (){
      overlayEntryGoldenBallSpawnOverlay?.remove();
      overlayEntryGoldenBallSpawnOverlay = null;
    });

    overlayEntryGoldenBallSpawnOverlay = OverlayEntry(
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => Stack(
          children: <Widget>[
            Pinned.fromPins(
              Pin(start: 34.0, end: 41.0),
              Pin(size: 54.0, middle: 0.2765),
              child: Stack(
                children: <Widget>[
                  Container(
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
                  Pinned.fromPins(
                    Pin(size: 45.0, start: 37.0),
                    Pin(start: 5.0, end: 4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage('assets/images/Ball_Gold.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 199.0, end: 30.0),
                    Pin(size: 60.0, middle: -1),
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: 'TmoneyRoundWindRegular',
                          fontSize: 18,
                          color: const Color(0xff000000),
                        ),
                        children: [
                          TextSpan(
                            text: '주변 어딘가에 \n',
                          ),
                          TextSpan(
                            text: '황금원판',
                            style: TextStyle(
                              color: const Color(0xffffca18),
                            ),
                          ),
                          TextSpan(
                            text: '이 생성됐어요!',
                          ),
                        ],
                      ),
                      textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
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
    Overlay.of(context)?.insert(overlayEntryGoldenBallSpawnOverlay!);
  }
}


void RandomBoxSpawnOverlay(context) {
  if (overlayEntryRandomBoxSpawnOverlay == null) {

    Timer(Duration(milliseconds: 5000), (){
      overlayEntryRandomBoxSpawnOverlay?.remove();
      overlayEntryRandomBoxSpawnOverlay = null;
    });

    overlayEntryRandomBoxSpawnOverlay = OverlayEntry(
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => Stack(
          children: <Widget>[
            Pinned.fromPins(
              Pin(start: 34.0, end: 41.0),
              Pin(size: 54.0, middle: 0.2765),
              child: Stack(
                children: <Widget>[
                  Container(
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
                  Pinned.fromPins(
                    Pin(size: 45.0, start: 37.0),
                    Pin(start: 5.0, end: 4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage('assets/images/Random_Box_Filled.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 199.0, end: 30.0),
                    Pin(size: 60.0, middle: -1),
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: 'TmoneyRoundWindRegular',
                          fontSize: 18,
                          color: const Color(0xff000000),
                        ),
                        children: [
                          TextSpan(
                            text: '주변 어딘가에 \n',
                          ),
                          TextSpan(
                            text: '랜덤박스',
                            style: TextStyle(
                              color: const Color(0xffC41EFF),
                            ),
                          ),
                          TextSpan(
                            text: '가 생성됐어요!',
                          ),
                        ],
                      ),
                      textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
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
    Overlay.of(context)?.insert(overlayEntryRandomBoxSpawnOverlay!);
  }
}