import 'dart:convert';

import 'package:did_u_c_my_dog/Point.dart';
import 'package:did_u_c_my_dog/Profile.dart';
import 'package:did_u_c_my_dog/Ranking.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Point_MapOverlay.dart';

import 'Game_Matching.dart';
import 'package:http/http.dart' as http;
import 'game_data.dart';

void getProfile() async {
  String url = "https://www.woodaeng.kro.kr/users/myprofile";
  var response = await http.get(Uri.parse(url),
      headers: {'accessToken': accessToken});
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String responseBody = utf8.decode(response.bodyBytes);

  Map<String, dynamic> info = jsonDecode(responseBody);

  id = info['id'];
  nickname = info['nickname'];
  image_id = info['image_id'];
  dog_name = info['dog_name'];
  dog_age = info['dog_age'];
  dog_breed = info['dog_breed'];
  dog_sex = info['dog_sex'];

}


class Game extends StatefulWidget {
  Game({
    Key? key,
  }) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {

  DateTime? currentBackPressTime;

  Future<bool> onWillPop(){

    DateTime now = DateTime.now();

    if(currentBackPressTime == null || now.difference(currentBackPressTime!)
        > Duration(seconds: 2))
    {

      currentBackPressTime = now;
      final msg = "'뒤로' 버튼을 한 번 더 누르면 종료됩니다.";


      Fluttertoast.showToast(
          msg: msg,
        fontSize: 15,
        backgroundColor: Colors.grey,
        textColor: Colors.white,);

      return Future.value(false);

    }

    return Future.value(true);

  }

  @override
  Widget build(BuildContext context) {
    if(overlayEntryPointMap != null) {
      overlayEntryPointMap!.remove();
      overlayEntryPointMap = null;
    }
    print("check!!");
    print(accessToken);


    getProfile();
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: WillPopScope(
        onWillPop: onWillPop,
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                  const AssetImage('assets/images/Game_Background_Image.png'),
                  fit: BoxFit.fill,
                ),
              ),
              margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
            ),
            Pinned.fromPins(
              Pin(start: 0.0, end: -0.5),
              Pin(size: 64.0, end: 0.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, -1.0),
                        end: Alignment(0.0, 1.0),
                        colors: [
                          const Color(0xffffffff),
                          const Color(0xffffffff)
                        ],
                        stops: [0.0, 1.0],
                      ),
                    ),
                    margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.5, 0.0),
                  ),
                  Pinned.fromPins(
                    Pin(start: 0.5, end: 0.0),
                    Pin(size: 1.0, start: 0.0),
                    child: SvgPicture.string(
                      _svg_t39jpo,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Align(
                    alignment: Alignment(-0.272, 1.0),
                    child: SizedBox(
                      width: 28.0,
                      height: 13.0,
                      child: Text(
                        '포인트',
                        style: TextStyle(
                          fontFamily: 'TmoneyRoundWindRegular',
                          fontSize: 10,
                          color: const Color(0xffc9c9c9),
                        ),
                        textAlign: TextAlign.center,
                        softWrap: false,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.263, 1.0),
                    child: SizedBox(
                      width: 20.0,
                      height: 13.0,
                      child: Text(
                        '게임',
                        style: TextStyle(
                          fontFamily: 'TmoneyRoundWindRegular',
                          fontSize: 11,
                          color: const Color(0xffffa149),
                        ),
                        textAlign: TextAlign.center,
                        softWrap: false,
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 28.0, end: 31.5),
                    Pin(size: 13.0, end: 0.0),
                    child: Text(
                      '프로필',
                      style: TextStyle(
                        fontFamily: 'TmoneyRoundWindRegular',
                        fontSize: 10,
                        color: const Color(0xffc9c9c9),
                      ),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 18.0, start: 36.0),
                    Pin(size: 13.0, end: 0.0),
                    child: Text(
                      '랭킹',
                      style: TextStyle(
                        fontFamily: 'TmoneyRoundWindRegular',
                        fontSize: 10,
                        color: const Color(0xffc9c9c9),
                      ),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 40.0, start: 25.0),
                    Pin(size: 40.0, start: 6.0),
                    child: PageLink(
                      links: [
                        PageLinkInfo(
                          ease: Curves.linear,
                          duration: 0.3,
                          pageBuilder: () => Ranking(),
                        ),
                      ],
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: const AssetImage(
                                'assets/images/Rank_Unselected_Icon.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 40.0, middle: 0.3588),
                    Pin(size: 40.0, start: 6.0),
                    child: PageLink(
                      links: [
                        PageLinkInfo(
                          ease: Curves.linear,
                          duration: 0.3,
                          pageBuilder: () => Point(),
                        ),
                      ],
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: const AssetImage(
                                'assets/images/Point_Unselected_Icon.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 40.0, end: 25.5),
                    Pin(size: 40.0, start: 6.0),
                    child: PageLink(
                      links: [
                        PageLinkInfo(
                          ease: Curves.linear,
                          duration: 0.3,
                          pageBuilder: () => Profile(),
                        ),
                      ],
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: const AssetImage(
                                'assets/images/Profile_Unselected_Icon.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 40.0, middle: 0.6396),
                    Pin(size: 40.0, start: 6.0),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage(
                              'assets/images/Game_Selected_Icon.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Pinned.fromPins(
              Pin(size: 142.0, middle: 0.5),
              Pin(size: 40.0, end: 98.0),
              child: PageLink(
                links: [
                  PageLinkInfo(
                    transition: LinkTransition.Fade,
                    ease: Curves.easeOut,
                    duration: 2.0,
                    pageBuilder: () => Game_Matching(),
                  ),
                ],
                child: Stack(
                  children: <Widget>[
                    Stack(
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
                      ],
                    ),
                    Pinned.fromPins(
                      Pin(size: 96.0, middle: 0.5),
                      Pin(size: 30.0, start: 4.0),
                      child: Text(
                        '게임 시작',
                        style: TextStyle(
                          fontFamily: 'TmoneyRoundWindRegular',
                          fontSize: 23,
                          color: const Color(0xffffa149),
                        ),
                        textAlign: TextAlign.center,
                        softWrap: false,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(size: 113.0, middle: 0.52),
              Pin(size: 36.0, start: 120.0),
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
                    Pin(start: 22.0, end: 22.0),
                    Pin(size: 24.0, middle: 0.5),
                    child: Text(
                      '$nickname',
                      style: TextStyle(
                        fontFamily: 'TmoneyRoundWindRegular',
                        fontSize: 20,
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
  }
}

const String _svg_t39jpo =
    '<svg viewBox="0.5 576.0 360.0 1.0" ><path transform="translate(0.5, 576.0)" d="M 0 0 L 360 0" fill="none" stroke="#bcbcbc" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
