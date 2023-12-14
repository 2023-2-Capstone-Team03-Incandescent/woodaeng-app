import 'dart:async';
import 'package:adobe_xd/pinned.dart';
import 'package:did_u_c_my_dog/Game.dart';
import 'package:did_u_c_my_dog/GameIn_Result_Report.dart';
import 'package:did_u_c_my_dog/game_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

OverlayEntry? overlayEntryResult;


void GameResultOverlay(BuildContext context) {
  if (overlayEntryResult == null) {
    double centerX = MediaQuery.of(context).size.width / 2;
    double centerY = MediaQuery.of(context).size.height / 2;

    overlayEntryResult = OverlayEntry(
        builder: (context) => Stack(
            children: <Widget>[
              SizedBox.expand(
                  child: SvgPicture.string(
                    _svg_kyv0ak,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  )),
              Pinned.fromPins(
                Pin(start: 6.0, end: 4.0),
                Pin(size: 373.0, middle: 0.4494),
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment(-0.011, -1.0),
                      child: SizedBox(
                        width: 176.0,
                        height: 81.0,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment(0.911, -0.839),
                                  end: Alignment(-0.886, 0.823),
                                  colors: [
                                    const Color(0xfffeaecb),
                                    const Color(0xffbcf3ff)
                                  ],
                                  stops: [0.0, 1.0],
                                ),
                                borderRadius: BorderRadius.circular(18.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0x1f0f296b),
                                    offset: Offset(5, 5),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 38.0, vertical: 16.0),
                              child: SizedBox.expand(
                                  child: Text(
                                    '승리',
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontFamily: 'TmoneyRoundWindRegular',
                                      fontSize: 40,
                                      color: const Color(0xff3f39ff),
                                    ),
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 81.0, 0.0, 0.0),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xde3b3b3b),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 18.0, middle: 0.3464),
                            Pin(size: 18.0, start: 16.0),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage(
                                      'assets/images/Random_Box.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 18.0, end: 41.0),
                            Pin(size: 18.0, start: 16.0),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage(
                                      'assets/images/Random_Box.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 18.0, middle: 0.262),
                            Pin(size: 18.0, start: 16.0),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage(
                                      'assets/images/Ball_Gold.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 18.0, middle: 0.7922),
                            Pin(size: 18.0, start: 16.0),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage(
                                      'assets/images/Ball_Gold.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 18.0, middle: 0.1777),
                            Pin(size: 18.0, start: 16.0),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage(
                                      'assets/images/Ball_Red.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 1.0, middle: 0.4986),
                            Pin(size: 203.0, end: 42.0),
                            child: SvgPicture.string(
                              _svg_kyldcq,
                              allowDrawingOutsideViewBox: true,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 18.0, middle: 0.4307),
                            Pin(size: 18.0, start: 16.0),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage(
                                      'assets/images/MiniGame_Icon.png'),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 18.0, end: 13.0),
                            Pin(size: 18.0, start: 16.0),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage(
                                      'assets/images/MiniGame_Icon.png'),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 30.0, middle: 0.4969),
                            Pin(size: 30.0, end: 7.0),
                            child: GestureDetector(
                              onTap: () {
                                if (overlayEntryResult != null) {
                                  overlayEntryResult!.remove();
                                }

                                Navigator.of(context).pushReplacement(
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation, secondaryAnimation) => Game(),
                                    transitionsBuilder: (
                                        context,
                                        animation,
                                        secondaryAnimation,
                                        child,
                                        ) {
                                      const begin = 0.0;
                                      const end = 1.0;
                                      const curve = Curves.easeInOut;
                                      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                                      var opacityAnimation = animation.drive(tween);

                                      return FadeTransition(
                                        opacity: opacityAnimation,
                                        child: child,
                                      );
                                    },
                                    transitionDuration: Duration(seconds: 2),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: const AssetImage('assets/images/Home_Icon.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Align(
                            alignment: Alignment(-0.645, -0.577),
                            child: SizedBox(
                              width: 18.0,
                              height: 13.0,
                              child: SingleChildScrollView(
                                primary: false,
                                child: Text(
                                  '$red_player0_ballScore\n',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontFamily: 'TmoneyRoundWindRegular',
                                    fontSize: 11,
                                    color: const Color(0xffffffff),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(0.41, -0.577),
                            child: SizedBox(
                              width: 18.0,
                              height: 13.0,
                              child: SingleChildScrollView(
                                primary: false,
                                child: Text(
                                  '$blue_player0_ballScore\n',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontFamily: 'TmoneyRoundWindRegular',
                                    fontSize: 11,
                                    color: const Color(0xffffffff),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(-0.645, -0.025),
                            child: SizedBox(
                              width: 18.0,
                              height: 13.0,
                              child: SingleChildScrollView(
                                primary: false,
                                child: Text(
                                  '$red_player1_ballScore\n',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontFamily: 'TmoneyRoundWindRegular',
                                    fontSize: 11,
                                    color: const Color(0xffffffff),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(0.41, -0.025),
                            child: SizedBox(
                              width: 18.0,
                              height: 13.0,
                              child: SingleChildScrollView(
                                primary: false,
                                child: Text(
                                  '$blue_player1_ballScore\n',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontFamily: 'TmoneyRoundWindRegular',
                                    fontSize: 11,
                                    color: const Color(0xffffffff),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(-0.645, 0.52),
                            child: SizedBox(
                              width: 18.0,
                              height: 13.0,
                              child: SingleChildScrollView(
                                primary: false,
                                child: Text(
                                  '$red_player2_ballScore\n',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontFamily: 'TmoneyRoundWindRegular',
                                    fontSize: 11,
                                    color: const Color(0xffffffff),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(0.41, 0.52),
                            child: SizedBox(
                              width: 18.0,
                              height: 13.0,
                              child: SingleChildScrollView(
                                primary: false,
                                child: Text(
                                  '$blue_player2_ballScore\n',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontFamily: 'TmoneyRoundWindRegular',
                                    fontSize: 11,
                                    color: const Color(0xffffffff),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(-0.476, -0.577),
                            child: SizedBox(
                              width: 18.0,
                              height: 13.0,
                              child: SingleChildScrollView(
                                primary: false,
                                child: Text(
                                  '$red_player0_goldScore\n',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontFamily: 'TmoneyRoundWindRegular',
                                    fontSize: 11,
                                    color: const Color(0xffffffff),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(0.578, -0.577),
                            child: SizedBox(
                              width: 18.0,
                              height: 13.0,
                              child: SingleChildScrollView(
                                primary: false,
                                child: Text(
                                  '$blue_player0_goldScore\n',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontFamily: 'TmoneyRoundWindRegular',
                                    fontSize: 11,
                                    color: const Color(0xffffffff),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(-0.476, -0.025),
                            child: SizedBox(
                              width: 18.0,
                              height: 13.0,
                              child: SingleChildScrollView(
                                primary: false,
                                child: Text(
                                  '$red_player1_goldScore\n',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontFamily: 'TmoneyRoundWindRegular',
                                    fontSize: 11,
                                    color: const Color(0xffffffff),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(0.578, -0.025),
                            child: SizedBox(
                              width: 18.0,
                              height: 13.0,
                              child: SingleChildScrollView(
                                primary: false,
                                child: Text(
                                  '$blue_player1_goldScore\n',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontFamily: 'TmoneyRoundWindRegular',
                                    fontSize: 11,
                                    color: const Color(0xffffffff),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(-0.476, 0.52),
                            child: SizedBox(
                              width: 18.0,
                              height: 13.0,
                              child: SingleChildScrollView(
                                primary: false,
                                child: Text(
                                  '$red_player2_goldScore\n',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontFamily: 'TmoneyRoundWindRegular',
                                    fontSize: 11,
                                    color: const Color(0xffffffff),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(0.578, 0.52),
                            child: SizedBox(
                              width: 18.0,
                              height: 13.0,
                              child: SingleChildScrollView(
                                primary: false,
                                child: Text(
                                  '$blue_player2_goldScore\n',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontFamily: 'TmoneyRoundWindRegular',
                                    fontSize: 11,
                                    color: const Color(0xffffffff),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(-0.307, -0.577),
                            child: SizedBox(
                              width: 18.0,
                              height: 13.0,
                              child: SingleChildScrollView(
                                primary: false,
                                child: Text(
                                  '$red_player0_randomBoxScore\n',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontFamily: 'TmoneyRoundWindRegular',
                                    fontSize: 11,
                                    color: const Color(0xffffffff),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 18.0, end: 42.0),
                            Pin(size: 13.0, middle: 0.2115),
                            child: SingleChildScrollView(
                              primary: false,
                              child: Text(
                                '$blue_player0_randomBoxScore\n',
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontFamily: 'TmoneyRoundWindRegular',
                                  fontSize: 11,
                                  color: const Color(0xffffffff),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(-0.307, -0.025),
                            child: SizedBox(
                              width: 18.0,
                              height: 13.0,
                              child: SingleChildScrollView(
                                primary: false,
                                child: Text(
                                  '$red_player1_randomBoxScore\n',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontFamily: 'TmoneyRoundWindRegular',
                                    fontSize: 11,
                                    color: const Color(0xffffffff),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 18.0, end: 42.0),
                            Pin(size: 13.0, middle: 0.4875),
                            child: SingleChildScrollView(
                              primary: false,
                              child: Text(
                                '$blue_player1_randomBoxScore\n',
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontFamily: 'TmoneyRoundWindRegular',
                                  fontSize: 11,
                                  color: const Color(0xffffffff),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(-0.307, 0.52),
                            child: SizedBox(
                              width: 18.0,
                              height: 13.0,
                              child: SingleChildScrollView(
                                primary: false,
                                child: Text(
                                  '$red_player2_randomBoxScore\n',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontFamily: 'TmoneyRoundWindRegular',
                                    fontSize: 11,
                                    color: const Color(0xffffffff),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 18.0, end: 42.0),
                            Pin(size: 13.0, middle: 0.7599),
                            child: SingleChildScrollView(
                              primary: false,
                              child: Text(
                                '$blue_player2_randomBoxScore\n',
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontFamily: 'TmoneyRoundWindRegular',
                                  fontSize: 11,
                                  color: const Color(0xffffffff),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(-0.139, -0.577),
                            child: SizedBox(
                              width: 18.0,
                              height: 13.0,
                              child: SingleChildScrollView(
                                primary: false,
                                child: Text(
                                  '$red_player0_miniGameScore\n',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontFamily: 'TmoneyRoundWindRegular',
                                    fontSize: 11,
                                    color: const Color(0xffffffff),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 18.0, end: 14.0),
                            Pin(size: 13.0, middle: 0.2115),
                            child: SingleChildScrollView(
                              primary: false,
                              child: Text(
                                '$blue_player0_miniGameScore\n',
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontFamily: 'TmoneyRoundWindRegular',
                                  fontSize: 11,
                                  color: const Color(0xffffffff),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(-0.139, -0.025),
                            child: SizedBox(
                              width: 18.0,
                              height: 13.0,
                              child: SingleChildScrollView(
                                primary: false,
                                child: Text(
                                  '$red_player1_miniGameScore\n',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontFamily: 'TmoneyRoundWindRegular',
                                    fontSize: 11,
                                    color: const Color(0xffffffff),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 18.0, end: 14.0),
                            Pin(size: 13.0, middle: 0.4875),
                            child: SingleChildScrollView(
                              primary: false,
                              child: Text(
                                '$blue_player1_miniGameScore\n',
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontFamily: 'TmoneyRoundWindRegular',
                                  fontSize: 11,
                                  color: const Color(0xffffffff),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(-0.139, 0.52),
                            child: SizedBox(
                              width: 18.0,
                              height: 13.0,
                              child: SingleChildScrollView(
                                primary: false,
                                child: Text(
                                  '$red_player2_miniGameScore\n',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontFamily: 'TmoneyRoundWindRegular',
                                    fontSize: 11,
                                    color: const Color(0xffffffff),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 18.0, end: 14.0),
                            Pin(size: 13.0, middle: 0.7599),
                            child: SingleChildScrollView(
                              primary: false,
                              child: Text(
                                '$blue_player2_miniGameScore\n',
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontFamily: 'TmoneyRoundWindRegular',
                                  fontSize: 11,
                                  color: const Color(0xffffffff),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 35.0, start: 9.0),
                            Pin(size: 35.0, middle: 0.1829),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage('${playerResults[5].image}'),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.circular(72.0),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(-1.0, -0.416),
                            child: SizedBox(
                              width: 54.0,
                              height: 11.0,
                              child: Text(
                                '${playerResults[0].nickname}',
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontFamily: 'TmoneyRoundWindRegular',
                                  fontSize: 9,
                                  color: const Color(0xffff7cab),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 54.0, start: 1.0),
                            Pin(size: 46.0, middle: 0.5),
                            child: Stack(
                              children: <Widget>[
                                Pinned.fromPins(
                                  Pin(start: 0.0, end: 0.0),
                                  Pin(size: 11.0, end: 0.0),
                                  child: Text(
                                    '${playerResults[1].nickname}',
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontFamily: 'TmoneyRoundWindRegular',
                                      fontSize: 9,
                                      color: const Color(0xffff7cab),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(size: 35.0, start: 8.0),
                                  Pin(size: 35.0, start: 0.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage('${playerResults[0].image}'),
                                        fit: BoxFit.fill,
                                      ),
                                      borderRadius: BorderRadius.circular(72.0),
                                    ),
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(size: 17.0, end: 7.0),
                                  Pin(size: 17.0, middle: 0.6207),
                                  child: GestureDetector(
                                    onTap: () {
                                      GameResultReportOverlay(context);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: const AssetImage(
                                              'assets/images/Red_Alert_Icon.png'),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 54.0, start: 1.0),
                            Pin(size: 46.0, middle: 0.8089),
                            child: Stack(
                              children: <Widget>[
                                Pinned.fromPins(
                                  Pin(start: 0.0, end: 0.0),
                                  Pin(size: 11.0, end: 0.0),
                                  child: Text(
                                    '${playerResults[2].nickname}',
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontFamily: 'TmoneyRoundWindRegular',
                                      fontSize: 9,
                                      color: const Color(0xffff7cab),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(size: 35.0, start: 8.0),
                                  Pin(size: 35.0, start: 0.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage('${playerResults[1].image}'),
                                        fit: BoxFit.fill,
                                      ),
                                      borderRadius: BorderRadius.circular(72.0),
                                    ),
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(size: 17.0, end: 7.0),
                                  Pin(size: 17.0, middle: 0.6207),
                                  child: GestureDetector(
                                    onTap: () {
                                      GameResultReportOverlay(context);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: const AssetImage(
                                              'assets/images/Red_Alert_Icon.png'),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment(0.189, 0.0),
                            child: SizedBox(
                              width: 54.0,
                              height: 46.0,
                              child: Stack(
                                children: <Widget>[
                                  Pinned.fromPins(
                                    Pin(start: 0.0, end: 0.0),
                                    Pin(size: 11.0, end: 0.0),
                                    child: Text(
                                      '${playerResults[4].nickname}',
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontFamily: 'TmoneyRoundWindRegular',
                                        fontSize: 9,
                                        color: const Color(0xff12d3fe),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Pinned.fromPins(
                                    Pin(start: 9.0, end: 10.0),
                                    Pin(size: 35.0, start: 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage('${playerResults[4].image}'),
                                          fit: BoxFit.fill,
                                        ),
                                        borderRadius: BorderRadius.circular(72.0),
                                      ),
                                    ),
                                  ),
                                  Pinned.fromPins(
                                    Pin(size: 17.0, end: 6.0),
                                    Pin(size: 17.0, middle: 0.6207),
                                    child: GestureDetector(
                                      onTap: () {
                                        GameResultReportOverlay(context);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: const AssetImage(
                                                'assets/images/Red_Alert_Icon.png'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(0.189, -0.618),
                            child: SizedBox(
                              width: 54.0,
                              height: 46.0,
                              child: Stack(
                                children: <Widget>[
                                  Pinned.fromPins(
                                    Pin(start: 0.0, end: 0.0),
                                    Pin(size: 11.0, end: 0.0),
                                    child: Text(
                                      '${playerResults[3].nickname}',
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontFamily: 'TmoneyRoundWindRegular',
                                        fontSize: 9,
                                        color: const Color(0xff12d3fe),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Pinned.fromPins(
                                    Pin(start: 9.0, end: 10.0),
                                    Pin(size: 35.0, start: 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage('${playerResults[3].image}'),
                                          fit: BoxFit.fill,
                                        ),
                                        borderRadius: BorderRadius.circular(72.0),
                                      ),
                                    ),
                                  ),
                                  Pinned.fromPins(
                                    Pin(size: 17.0, end: 6.0),
                                    Pin(size: 17.0, middle: 0.6207),
                                    child: GestureDetector(
                                      onTap: () {
                                        GameResultReportOverlay(context);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: const AssetImage(
                                                'assets/images/Red_Alert_Icon.png'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(0.189, 0.618),
                            child: SizedBox(
                              width: 54.0,
                              height: 46.0,
                              child: Stack(
                                children: <Widget>[
                                  Pinned.fromPins(
                                    Pin(start: 0.0, end: 0.0),
                                    Pin(size: 11.0, end: 0.0),
                                    child: Text(
                                      '${playerResults[5].nickname}',
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontFamily: 'TmoneyRoundWindRegular',
                                        fontSize: 9,
                                        color: const Color(0xff12d3fe),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Pinned.fromPins(
                                    Pin(start: 9.0, end: 10.0),
                                    Pin(size: 35.0, start: 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage('${playerResults[2].image}'),
                                          fit: BoxFit.fill,
                                        ),
                                        borderRadius: BorderRadius.circular(72.0),
                                      ),
                                    ),
                                  ),
                                  Pinned.fromPins(
                                    Pin(size: 17.0, end: 6.0),
                                    Pin(size: 17.0, middle: 0.6207),
                                    child: GestureDetector(
                                    onTap: () {
                                      GameResultReportOverlay(context);
                                      },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: const AssetImage(
                                              'assets/images/Red_Alert_Icon.png'),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 18.0, middle: 0.7078),
                            Pin(size: 18.0, start: 16.0),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage(
                                      'assets/images/Ball_Blue.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ])
    );
    Overlay.of(context)?.insert(overlayEntryResult!);
  }
}

const String _svg_kyldcq =
    '<svg viewBox="180.0 248.0 1.0 203.0" ><path transform="translate(180.0, 248.0)" d="M 0 0 L 0 203" fill="none" stroke="#b2b1b1" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_kyv0ak =
    '<svg viewBox="0.0 0.0 360.0 640.0" ><path  d="M 0 0 L 360 0 L 360 640 L 0 640 L 0 0 Z" fill="#000000" fill-opacity="0.25" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
