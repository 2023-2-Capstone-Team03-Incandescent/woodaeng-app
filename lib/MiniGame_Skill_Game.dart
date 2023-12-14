import 'dart:async';
import 'package:adobe_xd/pinned.dart';
import 'package:did_u_c_my_dog/MiniGame_Skill_Outro.dart';
import 'package:did_u_c_my_dog/NaverMapTest.dart';
import 'package:did_u_c_my_dog/game_data.dart';
import 'package:flutter/material.dart';


OverlayEntry? overlayEntryMiniGameSkillGame;


void MiniGameSkillGame(context) {
  if (overlayEntryMiniGameSkillGame == null) {

    Timer(Duration(milliseconds: 5000), (){
      overlayEntryMiniGameSkillGame?.remove();
      overlayEntryMiniGameSkillGame = null;
      MiniGameSkillOutro(context);
    });

    overlayEntryMiniGameSkillGame = OverlayEntry(
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
                    Pin(size: 48.0, middle: 0.3524),
                    child: Text(
                      '먼저 성공한 댕댕이를 칭찬해주세요!',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: 'TmoneyRoundWindRegular',
                        fontSize: 20,
                        color: const Color(0xffff7b00),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Align(
                    alignment: Alignment(-0.603, 0.428),
                    child: GestureDetector(
                      onTap: () {
                        // Add your onTap functionality here
                        if(team == 0) win = 1;
                        print('win1');
                        minigameResult(win!);
                      },
                      child: Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage('$image_id'),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(72.0),
                          border: Border.all(width: 2.0, color: const Color(0xffff7cab)),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.632, 0.389),
                    child: GestureDetector(
                      onTap: () {
                        // Add your onTap functionality here
                        if(team == 1) win = 1;
                        print('win2');
                        minigameResult(win!);
                      },
                      child: Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage('$opponentImage'),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(25.0),
                          border: Border.all(width: 2.0, color: const Color(0xff12d3fe)),
                        ),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 88.0, middle: 0.5),
                    Pin(size: 36.0, end: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        win = 2;
                        minigameResult(win!);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent, // Optional: Set a background color if needed
                          borderRadius: BorderRadius.circular(8.0), // Optional: Set border radius
                        ),
                        child: Center(
                          child: Text(
                            '모호할땐?\n다시하기',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontFamily: 'TmoneyRoundWindRegular',
                              fontSize: 15,
                              color: const Color(0xff000000),
                            ),
                            textAlign: TextAlign.center,
                          ),
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
    );
    Overlay.of(context)?.insert(overlayEntryMiniGameSkillGame!);
  }
}