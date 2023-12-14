import 'dart:async';
import 'package:did_u_c_my_dog/Splash_Intro1OutOf5.dart';
import 'package:flutter/material.dart';
import 'SignIn.dart';

class Splash extends StatelessWidget {
  Splash({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void navigateToSignIn() {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Splash_Intro1OutOf5(),
        ),
      );
    }

    Timer(
      Duration(seconds: 4),
      navigateToSignIn,
    );

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.0, -1.0),
                end: Alignment(0.0, 1.0),
                colors: [const Color(0xffffffff), const Color(0xffffc691)],
                stops: [0.0, 1.0],
              ),
            ),
          ),
          Center(
            child: Container(
              width: 180.0,
              height: 180.0,
              decoration: BoxDecoration(
                color: const Color(0xffffecdb),
                borderRadius: BorderRadius.circular(130.0),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.0, -0.033),
            child: Container(
              width: 102.0,
              height: 100.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/WooDaeng_Icon.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.005, 0.125),
            child: SizedBox(
              width: 145.0,
              height: 20.0,
              child: Text(
                '우리 댕댕이 봤어요?',
                style: TextStyle(
                  fontFamily: 'TmoneyRoundWindRegular',
                  fontSize: 14,
                  color: const Color(0xffffa149),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
