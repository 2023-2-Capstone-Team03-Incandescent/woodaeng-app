import 'dart:async';
import 'dart:math';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';


OverlayEntry? overlayEntryRedGetGoldenBall;
OverlayEntry? overlayEntryBlueGetGoldenBall;


void RedPlayerGetGoldenBall(context){

  if (overlayEntryRedGetGoldenBall == null) {
    overlayEntryRedGetGoldenBall = OverlayEntry(

        builder: (context) => StatefulBuilder(
          builder: (context, setState) {

            Timer(Duration(seconds: 6), () { // 5초 후에 오버레이 종료하기
              overlayEntryRedGetGoldenBall?.remove();
              overlayEntryRedGetGoldenBall = null;
            });

            return Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment(0.93, -0.82),
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                        const AssetImage('assets/images/BlueTeam_LoseScore2OnTop.gif'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(-0.93, -0.82),
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                        const AssetImage('assets/images/RedTeam_GetScore2OnTop.gif'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 38.0, end: 37.0),
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
                  alignment: Alignment(0.279, -0.516),
                  child: SizedBox(
                    width: 188.0,
                    height: 37.0,
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontFamily: 'TmoneyRoundWindRegular',
                          fontSize: 30,
                          color: const Color(0xff000000),
                        ),
                        children: [
                          TextSpan(
                            text: ':  2점 획득!',
                            style: TextStyle(
                              color: const Color(0xffffca18),
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
                Align(
                  alignment: Alignment(-0.4, -0.523),
                  child: Container(
                    width: 45.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                        const AssetImage('assets/images/Ball_Gold.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 77.0, end: 77.0),
                  Pin(size: 340.0, middle: 0.45),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage(
                            'assets/images/Plyaer_GetGoldenBall.gif'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ));
    Overlay.of(context)?.insert(overlayEntryRedGetGoldenBall!);
  }
}

void BluePlayerGetGoldenBall(context){

  if (overlayEntryBlueGetGoldenBall == null) {
    overlayEntryBlueGetGoldenBall = OverlayEntry(

        builder: (context) => StatefulBuilder(
          builder: (context, setState) {

            Timer(Duration(seconds: 6), () { // 5초 후에 오버레이 종료하기
              overlayEntryBlueGetGoldenBall?.remove();
              overlayEntryBlueGetGoldenBall = null;
            });

            return Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment(0.93, -0.82),
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                        const AssetImage('assets/images/BlueTeam_GetScore2OnTop.gif'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(-0.93, -0.82),
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                        const AssetImage('assets/images/RedTeam_LoseScore2OnTop.gif'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 38.0, end: 37.0),
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
                  alignment: Alignment(0.279, -0.516),
                  child: SizedBox(
                    width: 188.0,
                    height: 37.0,
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontFamily: 'TmoneyRoundWindRegular',
                          fontSize: 30,
                          color: const Color(0xff000000),
                        ),
                        children: [
                          TextSpan(
                            text: ':  2점 획득!',
                            style: TextStyle(
                              color: const Color(0xffffca18),
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
                Align(
                  alignment: Alignment(-0.4, -0.523),
                  child: Container(
                    width: 45.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                        const AssetImage('assets/images/Ball_Gold.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 77.0, end: 77.0),
                  Pin(size: 340.0, middle: 0.45),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage(
                            'assets/images/Plyaer_GetGoldenBall.gif'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ));
    Overlay.of(context)?.insert(overlayEntryBlueGetGoldenBall!);
  }
}