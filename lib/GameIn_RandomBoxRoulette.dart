import 'dart:async';
import 'dart:math';
import 'package:adobe_xd/pinned.dart';
import 'package:did_u_c_my_dog/game_data.dart';
import 'package:flutter/material.dart';
import 'NaverMapTest.dart';

OverlayEntry? overlayEntryRandomBoxRoulette;
OverlayEntry? overlayEntryGetFog;
OverlayEntry? overlayEntryGetRedScore;
OverlayEntry? overlayEntryGetBlueScore;
OverlayEntry? overlayEntryGetRandomBox;
OverlayEntry? overlayEntryGetPoint;
OverlayEntry? overlayEntryGetBlank;

int index = random;

void GetRandomBox(context){
  PlyaerGetRandomBox(context);
  Timer(Duration(seconds: 5), (){
    RandomBoxRouletteOverlay(context);
  });
}

void PlyaerGetRandomBox(context) {
  if (overlayEntryGetRandomBox == null) {
    overlayEntryGetRandomBox = OverlayEntry(
        builder: (context) => StatefulBuilder(
          builder: (context, setState) {

            Timer(Duration(seconds: 5), () { // 5초 후에 오버레이 종료하기
              overlayEntryGetRandomBox?.remove();
              overlayEntryGetRandomBox = null;
              RandomBoxRouletteOverlay(context);
            });

            return Stack(
              children: <Widget>[
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
                    width: 200.0,
                    height: 37.0,
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: 'TmoneyRoundWindRegular',
                          fontSize: 30,
                          color: const Color(0xff000000),
                        ),
                        children: [
                          TextSpan(
                            text: '랜덤박스',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: const Color(0xffc41eff),
                            ),
                          ),
                          TextSpan(
                            text: ' ',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: const Color(0xff12d3fe),
                            ),
                          ),
                          TextSpan(
                            text: '획득!',
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
                Align(
                  alignment: Alignment(-0.54, -0.523),
                  child: Container(
                    width: 45.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                        const AssetImage('assets/images/Random_Box_Filled.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 77.0, end: 77.0),
                  Pin(size: 206.0, middle: 0.5276),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage(
                            'assets/images/Player_GetRandomBox.gif'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ));
    Overlay.of(context)?.insert(overlayEntryGetRandomBox!);
  }
}


void RandomBoxRouletteOverlay(BuildContext context) {
  if (overlayEntryRandomBoxRoulette == null) {
    int currentIndex = index-2;

    List<String> imagePaths = [
      'assets/images/Random_Box_Cloud.png',
      'assets/images/Random_Box_GetBlueScore.png',
      'assets/images/Random_Box_GetPoint.png',
      'assets/images/Random_Box_GetRedScore.png',
      'assets/images/Random_Box_Filled.png',
    ];

    void _changeImage() {
      currentIndex = (currentIndex + 1) % imagePaths.length;
      overlayEntryRandomBoxRoulette!.markNeedsBuild();
    }

    Timer? timer;
    void startTimer() {
      timer = Timer(Duration(milliseconds: 8000), (){
        Timer.periodic(Duration(milliseconds: 300), (Timer timer){
          overlayEntryRandomBoxRoulette!.remove();
          overlayEntryRandomBoxRoulette = null;
          RandomBoxRouletteResult(currentIndex, context);
        }
        );
      });
    }

    startTimer();
    Timer.periodic(Duration(milliseconds: 800), (Timer timer) {
      _changeImage();
    });

    overlayEntryRandomBoxRoulette = OverlayEntry(
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => Stack(
          children: <Widget>[
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
                width: 200.0,
                height: 37.0,
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: 'TmoneyRoundWindRegular',
                      fontSize: 30,
                      color: const Color(0xff000000),
                    ),
                    children: [
                      // TextSpan(
                      //   text: ':',
                      //   style: TextStyle(
                      //decoration: TextDecoration.none,
                      //     color: const Color(0xffc41eff),
                      //   ),
                      // ),
                      // TextSpan(
                      //   text: ' ',
                      //   style: TextStyle(
                      //decoration: TextDecoration.none,
                      //     color: const Color(0xff12d3fe),
                      //   ),
                      // ),
                      TextSpan(
                        text: '박스 여는 중...',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: const Color(0xffc41eff),
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
              alignment: Alignment(-0.54, -0.523),
              child: Container(
                width: 45.0,
                height: 45.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                    const AssetImage('assets/images/Random_Box_Filled.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0.0, 0.084),
              child: Container(
                width: 140.0,
                height: 140.0,
                decoration: BoxDecoration(
                  color: const Color(0xd9fff3e8),
                  borderRadius: BorderRadius.circular(34.0),
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(start: 77.0, end: 77.0),
              Pin(size: 150.0, middle: 0.53),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePaths[currentIndex]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    Overlay.of(context)?.insert(overlayEntryRandomBoxRoulette!);
  }
}

void RandomBoxRouletteResult(imageIndex, BuildContext context){
  if (imageIndex == 0) {Fog(context);}
  else if(imageIndex ==1) {GetBlueScore(context);}
  else if(imageIndex ==2) {GetPoint(context);}
  else if(imageIndex ==3) {GetRedScore(context);}
  else {Blank(context);}
}

void Fog(BuildContext context){

  if (overlayEntryGetFog == null) {
    overlayEntryGetFog = OverlayEntry(
        builder: (context) => StatefulBuilder(
          builder: (context, setState) {

            Timer(Duration(seconds: 5), () { // 5초 후에 오버레이 종료하기
              overlayEntryGetFog?.remove();
              overlayEntryGetFog = null;
            });

            return Stack(
              children: <Widget>[
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
                    width: 200.0,
                    height: 37.0,
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: 'TmoneyRoundWindRegular',
                          fontSize: 30,
                          color: const Color(0xff000000),
                        ),
                        children: [
                          TextSpan(
                            text: ':',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: const Color(0xffc41eff),
                            ),
                          ),
                          TextSpan(
                            text: ' ',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: const Color(0xff12d3fe),
                            ),
                          ),
                          TextSpan(
                            text: '적 시야 차단!',
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
                Align(
                  alignment: Alignment(-0.54, -0.523),
                  child: Container(
                    width: 45.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                        const AssetImage('assets/images/Random_Box_Filled.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 77.0, end: 77.0),
                  Pin(size: 206.0, middle: 0.5276),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage(
                            'assets/images/FogGIF.gif'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ));
    Overlay.of(context)?.insert(overlayEntryGetFog!);
  }
}

void GetBlueScore(BuildContext context){

  if (overlayEntryGetBlueScore == null) {
    overlayEntryGetBlueScore = OverlayEntry(
        builder: (context) => StatefulBuilder(
          builder: (context, setState) {

            Timer(Duration(seconds: 5), () { // 5초 후에 오버레이 종료하기
              overlayEntryGetBlueScore?.remove();
              overlayEntryGetBlueScore = null;
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
                        const AssetImage('assets/images/BlueTeam_GetScore1OnTop.gif'),
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
                        const AssetImage('assets/images/RedTeam_LoseScore1OnTop.gif'),
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
                    width: 200.0,
                    height: 37.0,
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: 'TmoneyRoundWindRegular',
                          fontSize: 30,
                          color: const Color(0xff000000),
                        ),
                        children: [
                          TextSpan(
                            text: ':',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: const Color(0xffc41eff),
                            ),
                          ),
                          TextSpan(
                            text: ' 블루팀',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: const Color(0xff12d3fe),
                            ),
                          ),
                          TextSpan(
                            text: ' +1점!',
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
                  alignment: Alignment(-0.54, -0.523),
                  child: Container(
                    width: 45.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                        const AssetImage('assets/images/Random_Box_Filled.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 77.0, end: 77.0),
                  Pin(size: 206.0, middle: 0.5276),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage(
                            'assets/images/GetBlueScoreImage.gif'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ));
    Overlay.of(context)?.insert(overlayEntryGetBlueScore!);
  }
}

void GetPoint(BuildContext context){

  if (overlayEntryGetPoint == null) {
    overlayEntryGetPoint = OverlayEntry(
        builder: (context) => StatefulBuilder(
          builder: (context, setState) {

            Timer(Duration(seconds: 5), () { // 5초 후에 오버레이 종료하기
              overlayEntryGetPoint?.remove();
              overlayEntryGetPoint = null;
            });

            return Stack(
              children: <Widget>[
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
                    width: 200.0,
                    height: 37.0,
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: 'TmoneyRoundWindRegular',
                          fontSize: 30,
                          color: const Color(0xff000000),
                        ),
                        children: [
                          TextSpan(
                            text: ':',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: const Color(0xffc41eff),
                            ),
                          ),
                          TextSpan(
                            text: ' ',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: const Color(0xff12d3fe),
                            ),
                          ),
                          TextSpan(
                            text: '50P 획득!',
                            style: TextStyle(
                              decoration: TextDecoration.none,
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
                  alignment: Alignment(-0.54, -0.523),
                  child: Container(
                    width: 45.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                        const AssetImage('assets/images/Random_Box_Filled.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 77.0, end: 77.0),
                  Pin(size: 206.0, middle: 0.5276),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage(
                            'assets/images/PointGIF.gif'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ));
    Overlay.of(context)?.insert(overlayEntryGetPoint!);
  }
}

void GetRedScore(BuildContext context){

  if (overlayEntryGetRedScore == null) {
    overlayEntryGetRedScore = OverlayEntry(
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {

          Timer(Duration(seconds: 5), () { // 5초 후에 오버레이 종료하기
            overlayEntryGetRedScore?.remove();
            overlayEntryGetRedScore = null;
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
                      const AssetImage('assets/images/BlueTeam_LoseScore1OnTop.gif'),
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
                      const AssetImage('assets/images/RedTeam_GetScore1OnTop.gif'),
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
                  width: 200.0,
                  height: 37.0,
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: 'TmoneyRoundWindRegular',
                        fontSize: 30,
                        color: const Color(0xff000000),
                      ),
                      children: [
                        TextSpan(
                          text: ':',
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: const Color(0xffc41eff),
                          ),
                        ),
                        TextSpan(
                          text: ' 레드팀',
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: const Color(0xffff7cab),
                          ),
                        ),
                        TextSpan(
                          text: ' +1점!',
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
                alignment: Alignment(-0.54, -0.523),
                child: Container(
                  width: 45.0,
                  height: 45.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                      const AssetImage('assets/images/Random_Box_Filled.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Pinned.fromPins(
                Pin(start: 77.0, end: 77.0),
                Pin(size: 206.0, middle: 0.5276),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage(
                          'assets/images/GetRedScoreImage.gif'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),

            ],
          );
        },
    ));
    Overlay.of(context)?.insert(overlayEntryGetRedScore!);
  }
}

void Blank(context){

  if (overlayEntryGetBlank == null) {
    overlayEntryGetBlank = OverlayEntry(
        builder: (context) => StatefulBuilder(
          builder: (context, setState) {

            Timer(Duration(seconds: 5), () { // 5초 후에 오버레이 종료하기
              overlayEntryGetBlank?.remove();
              overlayEntryGetBlank = null;
            });

            return Stack(
              children: <Widget>[
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
                    width: 200.0,
                    height: 37.0,
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: 'TmoneyRoundWindRegular',
                          fontSize: 30,
                          color: const Color(0xff000000),
                        ),
                        children: [
                          TextSpan(
                            text: '빈 상자였어요...',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: const Color(0xffc41eff),
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
                  alignment: Alignment(-0.54, -0.523),
                  child: Container(
                    width: 45.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                        const AssetImage('assets/images/Random_Box_Filled.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 77.0, end: 77.0),
                  Pin(size: 250.0, middle: 0.5276),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage(
                            'assets/images/GetBlank.gif'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ));
    Overlay.of(context)?.insert(overlayEntryGetBlank!);
  }
}