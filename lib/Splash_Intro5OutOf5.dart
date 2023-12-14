import 'package:adobe_xd/page_link.dart';
import 'package:did_u_c_my_dog/SignIn.dart';
import 'package:did_u_c_my_dog/SignIn_RegisterProfile.dart';
import 'package:did_u_c_my_dog/Splash_Intro2OutOf5.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

class Splash_Intro5OutOf5 extends StatelessWidget {
  Splash_Intro5OutOf5({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 50.0, end: 60.0),
            Pin(size: 260.0, middle: 0.55),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(
                      'assets/images/AppIntro_Game5.gif'),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(64.0),
                border: Border.all(width: 2.0, color: const Color(0x80ffffff)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 30.0, end: 20.0),
            Pin(size: 80.0, middle: 0.2051),
            child: SingleChildScrollView(
              primary: false,
              child: Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: 'TmoneyRoundWindRegular',
                    fontSize: 25,
                    color: const Color(0xff000000),
                  ),
                  children: [
                    TextSpan(
                      text: '포인트',
                      style: TextStyle(
                        color: const Color(0xffffca18),
                      ),
                    ),
                    TextSpan(
                      text: '로 댕댕이 간식까지!\n시작해 볼까요?',
                    ),
                  ],
                ),
                textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 23.0, end: 21.0),
            Pin(size: 53.0, end: 25.0),
              child: PageLink(
              links: [
                PageLinkInfo(
                pageBuilder: () => SignIn(),
                ),
              ],
              child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffffa149),
                borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 66.0, end: 66.0),
            Pin(size: 22.0, end: 40.0),
            child: Text(
              '우리 댕댕이와 산책 게임 시작!',
              style: TextStyle(
                fontFamily: 'TmoneyRoundWindRegular',
                fontSize: 18,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 28.0, end: 7.0),
            Pin(size: 18.0, start: 67.0),
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'TmoneyRoundWindRegular',
                  fontSize: 15,
                  color: const Color(0xffffa149),
                ),
                children: [
                  TextSpan(
                    text: '5',
                  ),
                  TextSpan(
                    text: '/5',
                    style: TextStyle(
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
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 5.0, start: 50.0),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(-1.0, 0.0),
                  end: Alignment(1.0, -1.0),
                  colors: [
                    const Color(0xffffa149),
                    const Color(0xffffa149),
                    const Color(0xffffa149)
                  ],
                  stops: [0.0, 1, 1.0],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
