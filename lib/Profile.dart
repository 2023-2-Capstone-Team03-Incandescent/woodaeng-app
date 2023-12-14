import 'dart:convert';

import 'package:did_u_c_my_dog/Game.dart';
import 'package:did_u_c_my_dog/Point.dart';
import 'package:did_u_c_my_dog/Profile.dart';
import 'package:did_u_c_my_dog/Ranking.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:intl/intl.dart';
import './Profile_Settings.dart';
import 'package:adobe_xd/page_link.dart';
import './Profile_GameRecords.dart';
import './Profile_Achievements.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart'as http;
import 'Profile_Achievements.dart';
import 'Point_MapOverlay.dart';
import 'game_data.dart';


String ?gender;

class GameRecords {
  int user_id;
  String game_code;
  int mvp;
  int win;
  String location;
  int ball_cnt;
  String time;

  GameRecords(this.user_id, this.game_code, this.mvp, this.win, this.location, this.ball_cnt, this.time);

  GameRecords.fromJson(Map<String, dynamic> json)
      : user_id = json['user_id'],
        game_code = json['game_code'],
        mvp = json['mvp'],
        win = json['win'],
        location = json['location'],
        ball_cnt = json['ball_cnt'],
        time = DateFormat('yyyy년 MM월 dd일').format(DateTime.parse(json['time']));// Convert string to DateTime

  Map<String, dynamic> toJson() => {
    'user_id': user_id,
    'game_code': game_code,
    'mvp': mvp,
    'win': win,
    'location': location,
    'ball_cnt': ball_cnt,
    'time': time, // Convert DateTime to string
  };
}

List<dynamic> gameRecords = [];



void getGameRecords() async {
  String url = "https://www.woodaeng.kro.kr/users/gameRecord";
  var response = await http.get(Uri.parse(url), headers: {'accessToken': accessToken});
  var statusCode = response.statusCode;

  if (response.body != null && statusCode == 200) {
    dynamic responseBody = json.decode(response.body);

    if (responseBody is List) {
      // Assuming 'gameRecords' is the key that holds the list of game records
      var gameRecordsData = responseBody;

      gameRecords = gameRecordsData
          .map((gameData) => GameRecords.fromJson(gameData))
          .toList();
    } else {
      // Handle the case where 'gameRecords' is not a List in the response
      print('Error: Game records data is not a List');
    }
  } else {
    // Handle error or unexpected response
    print('Error: $statusCode');
  }
}

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

class Profile extends StatelessWidget {
  Profile({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    getAchievement();
    getProfile();
   getGameRecords();
    if(overlayEntryPointMap != null) {
      overlayEntryPointMap!.remove();
      overlayEntryPointMap = null;
    }
    if(dog_sex == 0) gender = '남자';
    else gender = '여자';
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Stack(
          children: <Widget>[
            Pinned.fromPins(
              Pin(size: 150.0, middle: 0.7149),
              Pin(size: 20.0, start: 98.0),
              child: Text(
                '$dog_name($dog_breed, $gender, $dog_age살)',
                style: TextStyle(
                  fontFamily: 'TmoneyRoundWindRegular',
                  fontSize: 13,
                  color: const Color(0xb3000000),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Pinned.fromPins(
              Pin(start: 0.0, end: 0.0),
              Pin(size: 1.0, middle: 0.5023),
              child: SvgPicture.string(
                _svg_dr2shc,
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
            ),
            Pinned.fromPins(
              Pin(start: 0.0, end: 0.0),
              Pin(size: 1.0, middle: 0.4476),
              child: SvgPicture.string(
                _svg_ag8azw,
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
            ),
            Pinned.fromPins(
              Pin(start: 0.0, end: 0.0),
              Pin(size: 1.0, middle: 0.3928),
              child: SvgPicture.string(
                _svg_auog60,
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
            ),
            Pinned.fromPins(
              Pin(start: 0.0, end: 0.0),
              Pin(size: 1.0, middle: 0.338),
              child: SvgPicture.string(
                _svg_dfq88q,
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
            ),
            Pinned.fromPins(
              Pin(size: 80.0, start: 50.0),
              Pin(size: 80.0, start: 50.0),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('$image_id'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(40.0),
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(size: 98.0, middle: 0.687),
              Pin(size: 30.0, start: 55.0),
              child: Text(
                '$nickname',
                style: TextStyle(
                  fontFamily: 'TmoneyRoundWindRegular',
                  fontSize: 25,
                  color: const Color(0xff000000),
                ),
                softWrap: false,
              ),
            ),
            Pinned.fromPins(
              Pin(start: 0.0, end: -0.5),
              Pin(size: 64.0, end: 0.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    color: const Color(0xffffffff),
                    margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.5, 0.0),
                  ),
                  Pinned.fromPins(
                    Pin(start: 0.5, end: 0.0),
                    Pin(size: 1.0, start: 0.5),
                    child: SvgPicture.string(
                      _svg_rpaipl,
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
                    alignment: Alignment(0.261, 1.0),
                    child: SizedBox(
                      width: 18.0,
                      height: 13.0,
                      child: Text(
                        '게임',
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
                  Pinned.fromPins(
                    Pin(size: 28.0, end: 31.5),
                    Pin(size: 13.0, end: 0.0),
                    child: Text(
                      '프로필',
                      style: TextStyle(
                        fontFamily: 'TmoneyRoundWindRegular',
                        fontSize: 10,
                        color: const Color(0xffffa149),
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
                    Pin(size: 40.0, middle: 0.6396),
                    Pin(size: 40.0, start: 6.0),
                    child: PageLink(
                      links: [
                        PageLinkInfo(
                          ease: Curves.linear,
                          duration: 0.3,
                          pageBuilder: () => Game(),
                        ),
                      ],
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: const AssetImage(
                                'assets/images/Game_Unselected_Icon.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
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
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage(
                              'assets/images/Profile_Selected_Icon.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Pinned.fromPins(
              Pin(size: 26.0, end: 21.0),
              Pin(size: 26.0, start: 37.0),
              child: PageLink(
                links: [
                  PageLinkInfo(
                    ease: Curves.linear,
                    duration: 0.3,
                    pageBuilder: () => Profile_Settings(),
                  ),
                ],
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage('assets/images/Settings_Icon.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(size: 65.0, end: 27.0),
              Pin(size: 11.0, middle: 0.3116),
              child: Text(
                '플레이 날짜',
                style: TextStyle(
                  fontFamily: 'TmoneyRoundWindRegular',
                  fontSize: 9,
                  color: const Color(0xff000000),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Pinned.fromPins(
              Pin(size: 28.0, start: 51.0),
              Pin(size: 11.0, middle: 0.3116),
              child: Text(
                '결과',
                style: TextStyle(
                  fontFamily: 'TmoneyRoundWindRegular',
                  fontSize: 9,
                  color: const Color(0xff000000),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Align(
              alignment: Alignment(0.253, -0.377),
              child: SizedBox(
                width: 60.0,
                height: 11.0,
                child: Text(
                  '획득 원판',
                  style: TextStyle(
                    fontFamily: 'TmoneyRoundWindRegular',
                    fontSize: 9,
                    color: const Color(0xff000000),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Align(
              alignment: Alignment(-0.296, -0.377),
              child: SizedBox(
                width: 73.0,
                height: 11.0,
                child: Text(
                  '플레이 지역',
                  style: TextStyle(
                    fontFamily: 'TmoneyRoundWindRegular',
                    fontSize: 9,
                    color: const Color(0xff000000),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(start: 17.0, end: 27.0),
              Pin(size: 23.0, middle: 0.4733),
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(size: 23.0, start: 0.0),
                    Pin(start: 0.0, end: 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: gameRecords.length > 2 ? gameRecords[2].mvp == 1 ? const AssetImage('assets/images/MVP_Icon.png') : AssetImage(' ') : AssetImage(' '),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 65.0,
                      height: 13.0,
                      child: Text(
                        gameRecords.length > 2 ? '${gameRecords[2].time}' : '',
                        style: TextStyle(
                          fontFamily: 'TmoneyRoundWindRegular',
                          fontSize: 10,
                          color: const Color(0xff000000),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 28.0, start: 34.0),
                    Pin(size: 13.0, middle: 0.5),
                    child: Text(
                      gameRecords.length > 2  ?
                      gameRecords[2].win == 1 ? '승리' : '패배'
                          : '',
                      style: TextStyle(
                          fontFamily: 'TmoneyRoundWindRegular',
                          fontSize: 10,
                          color: gameRecords.length > 2 ? gameRecords[2].win == 1 ? const Color(0xff002bff) : const Color(0xffff0000) : Colors.white
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.301, 0.0),
                    child: SizedBox(
                      width: 30.0,
                      height: 13.0,
                      child: Text(
                        gameRecords.length > 2 ? '${gameRecords[2].ball_cnt}개' : '',
                        style: TextStyle(
                          fontFamily: 'TmoneyRoundWindRegular',
                          fontSize: 10,
                          color: const Color(0xff000000),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(-0.309, 0.0),
                    child: SizedBox(
                      width: 73.0,
                      height: 13.0,
                      child: Text(
                        gameRecords.length > 2 ? '${gameRecords[2].location}' : '',
                        style: TextStyle(
                          fontFamily: 'TmoneyRoundWindRegular',
                          fontSize: 10,
                          color: const Color(0xff000000),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Pinned.fromPins(
              Pin(start: 17.0, end: 27.0),
              Pin(size: 23.0, middle: 0.4149),
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(size: 23.0, start: 0.0),
                    Pin(start: 0.0, end: 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: gameRecords.length > 1 ? gameRecords[1].mvp == 1 ? const AssetImage('assets/images/MVP_Icon.png') : AssetImage(' ') : AssetImage(' '),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 65.0,
                      height: 13.0,
                      child: Text(
                        gameRecords.length > 1 ? '${gameRecords[1].time}' : '',
                        style: TextStyle(
                          fontFamily: 'TmoneyRoundWindRegular',
                          fontSize: 10,
                          color: const Color(0xff000000),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 28.0, start: 34.0),
                    Pin(size: 13.0, middle: 0.5),
                    child: Text(
                      gameRecords.length > 1 ?
                      gameRecords[1].win == 1 ? '승리' : '패배'
                          : '',
                      style: TextStyle(
                        fontFamily: 'TmoneyRoundWindRegular',
                        fontSize: 10,
                        color: gameRecords.length > 1 ? gameRecords[1].win == 1 ? const Color(0xff002bff) : const Color(0xffff0000) : Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.301, 0.0),
                    child: SizedBox(
                      width: 30.0,
                      height: 13.0,
                      child: Text(
                        gameRecords.length > 1 ?'${gameRecords[1].ball_cnt}개' : '',
                        style: TextStyle(
                          fontFamily: 'TmoneyRoundWindRegular',
                          fontSize: 10,
                          color: const Color(0xff000000),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(-0.309, 0.0),
                    child: SizedBox(
                      width: 73.0,
                      height: 13.0,
                      child: Text(
                        gameRecords.length > 1 ?'${gameRecords[1].location}' : '',
                        style: TextStyle(
                          fontFamily: 'TmoneyRoundWindRegular',
                          fontSize: 10,
                          color: const Color(0xff000000),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Pinned.fromPins(
              Pin(start: 17.0, end: 27.0),
              Pin(size: 23.0, middle: 0.3582),
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(size: 23.0, start: 0.0),
                    Pin(start: 0.0, end: 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: gameRecords.length > 0 ? gameRecords[0].mvp == 1 ? const AssetImage('assets/images/MVP_Icon.png') : AssetImage(' ') : AssetImage(' '),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 65.0,
                      height: 13.0,
                      child: Text(
                        gameRecords.length > 0 ? '${gameRecords[0].time}' : '',
                        style: TextStyle(
                          fontFamily: 'TmoneyRoundWindRegular',
                          fontSize: 10,
                          color: const Color(0xff000000),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 28.0, start: 34.0),
                    Pin(size: 13.0, middle: 0.5),
                    child: Text(
                      gameRecords.length > 0 ?
                      gameRecords[0].win == 1 ? '승리' : '패배'
                          : '',
                      style: TextStyle(
                          fontFamily: 'TmoneyRoundWindRegular',
                          fontSize: 10,
                          color: gameRecords.length > 0  ? gameRecords[0].win == 1 ? const Color(0xff002bff) : const Color(0xffff0000) : Colors.white
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.301, 0.0),
                    child: SizedBox(
                      width: 30.0,
                      height: 13.0,
                      child: Text(
                        gameRecords.length > 0  ? '${gameRecords[0].ball_cnt}개' : '',
                        style: TextStyle(
                          fontFamily: 'TmoneyRoundWindRegular',
                          fontSize: 10,
                          color: const Color(0xff000000),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(-0.309, 0.0),
                    child: SizedBox(
                      width: 73.0,
                      height: 13.0,
                      child: Text(
                        gameRecords.length > 0  ?'${gameRecords[0].location}' : '',
                        style: TextStyle(
                          fontFamily: 'TmoneyRoundWindRegular',
                          fontSize: 10,
                          color: const Color(0xff000000),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment(-0.241, 0.082),
              child: Container(
                width: 28.0,
                height: 28.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('assets/images/Flag_Icon.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(start: 0.0, end: 0.0),
              Pin(size: 1.0, middle: 0.2207),
              child: SvgPicture.string(
                _svg_nlpftk,
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
            ),
            Align(
              alignment: Alignment(-0.311, -0.502),
              child: Container(
                width: 26.0,
                height: 26.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                    const AssetImage('assets/images/Game_Records_Icon.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(-0.045, -0.502),
              child: SizedBox(
                width: 60.0,
                height: 18.0,
                child: Text(
                  '대전기록',
                  style: TextStyle(
                    fontFamily: 'TmoneyRoundWindRegular',
                    fontSize: 15,
                    color: const Color(0xff000000),
                  ),
                  softWrap: false,
                ),
              ),
            ),
            Align(
              alignment: Alignment(-0.037, 0.077),
              child: SizedBox(
                width: 32.0,
                height: 18.0,
                child: Text(
                  '업적',
                  style: TextStyle(
                    fontFamily: 'TmoneyRoundWindRegular',
                    fontSize: 15,
                    color: const Color(0xff000000),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Align(
              alignment: Alignment(0.281, -0.498),
              child: SizedBox(
                width: 40.0,
                height: 11.0,
                child: PageLink(
                  links: [
                    PageLinkInfo(
                      ease: Curves.linear,
                      duration: 0.3,
                      pageBuilder: () => Profile_GameRecords(),
                    ),
                  ],
                  child: Text(
                    '더 보기 >',
                    style: TextStyle(
                      fontFamily: 'TmoneyRoundWindRegular',
                      fontSize: 9,
                      color: const Color(0xff5d5a5a),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0.225, 0.075),
              child: SizedBox(
                width: 40.0,
                height: 11.0,
                child: PageLink(
                  links: [
                    PageLinkInfo(
                      ease: Curves.linear,
                      duration: 0.3,
                      pageBuilder: () => Profile_Achievements(),
                    ),
                  ],
                  child: Text(
                    '더 보기 >',
                    style: TextStyle(
                      fontFamily: 'TmoneyRoundWindRegular',
                      fontSize: 9,
                      color: const Color(0xff5d5a5a),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(start: 29.0, end: 29.0),
              Pin(size: 201.0, middle: 0.779),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: 131.0,
                      height: 41.0,
                      child: Stack(
                        children: <Widget>[
                          Pinned.fromPins(
                            Pin(size: 105.0, end: 3.0),
                            Pin(size: 13.0, middle: 0.25),
                            child: Text(
                              '원판 콜렉터',
                              style: TextStyle(
                                fontFamily: 'TmoneyRoundWindRegular',
                                fontSize: 11,
                                color: const Color(0xff000000),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 25.0, start: 2.0),
                            Pin(size: 25.0, start: 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage(
                                      'assets/images/Trophy_Blue_Icon.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(start: 0.0, end: 0.0),
                            Pin(size: 15.0, end: 0.0),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment(-0.977, 0.0),
                                      end: Alignment(0.978, 0.0),
                                      colors: [
                                        const Color(0xff12d3fe),
                                        const Color(0xfffff8f1),
                                        const Color(0xffdedede)
                                      ],
                                      stops: [0.0, percentage1! / 50, 1.0],
                                    ),
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment(-0.03, 1.0),
                                  child: SizedBox(
                                    width: 30.0,
                                    height: 13.0,
                                    child: Text.rich(
                                      TextSpan(
                                        style: TextStyle(
                                          fontFamily: 'TmoneyRoundWindRegular',
                                          fontSize: 10,
                                          color: const Color(0xff12d3fe),
                                        ),
                                        children: [
                                          TextSpan(
                                            text: '$ball_cnt',
                                          ),
                                          TextSpan(
                                            text: '/50',
                                            style: TextStyle(
                                              color: const Color(0xff000000),
                                            ),
                                          ),
                                        ],
                                      ),
                                      textHeightBehavior: TextHeightBehavior(
                                          applyHeightToFirstAscent: false),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 131.0,
                      height: 41.0,
                      child: Stack(
                        children: <Widget>[
                          Pinned.fromPins(
                            Pin(size: 105.0, end: 3.0),
                            Pin(size: 13.0, middle: 0.25),
                            child: Text(
                              '궁금한 건 못 참아',
                              style: TextStyle(
                                fontFamily: 'TmoneyRoundWindRegular',
                                fontSize: 11,
                                color: const Color(0xff000000),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 25.0, start: 2.0),
                            Pin(size: 25.0, start: 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage(
                                      'assets/images/Trophy_Blue_Icon.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(start: 0.0, end: 0.0),
                            Pin(size: 15.0, end: 0.0),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment(-0.977, 0.0),
                                      end: Alignment(0.978, 0.0),
                                      colors: [
                                        const Color(0xff12d3fe),
                                        const Color(0xfffff8f1),
                                        const Color(0xffdedede)
                                      ],
                                      stops: [0.0, percentage3! / 15, 1.0],
                                    ),
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment(-0.03, 1.0),
                                  child: SizedBox(
                                    width: 30.0,
                                    height: 13.0,
                                    child: Text.rich(
                                      TextSpan(
                                        style: TextStyle(
                                          fontFamily: 'TmoneyRoundWindRegular',
                                          fontSize: 10,
                                          color: const Color(0xff12d3fe),
                                        ),
                                        children: [
                                          TextSpan(
                                            text: '$box_cnt',
                                          ),
                                          TextSpan(
                                            text: '/15',
                                            style: TextStyle(
                                              color: const Color(0xff000000),
                                            ),
                                          ),
                                        ],
                                      ),
                                      textHeightBehavior: TextHeightBehavior(
                                          applyHeightToFirstAscent: false),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: SizedBox(
                      width: 131.0,
                      height: 41.0,
                      child: Stack(
                        children: <Widget>[
                          Pinned.fromPins(
                            Pin(size: 105.0, end: 3.0),
                            Pin(size: 13.0, middle: 0.25),
                            child: Text(
                              '오늘은 내가 주인공!',
                              style: TextStyle(
                                fontFamily: 'TmoneyRoundWindRegular',
                                fontSize: 11,
                                color: const Color(0xff000000),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(start: 0.0, end: 0.0),
                            Pin(size: 15.0, end: 0.0),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment(-0.977, 0.0),
                                      end: Alignment(0.978, 0.0),
                                      colors: [
                                        const Color(0xffffca18),
                                        const Color(0xfffff8f1),
                                        const Color(0xffdedede)
                                      ],
                                      stops: [0.0, percentage7! / 5, 1.0],
                                    ),
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment(-0.03, 1.0),
                                  child: SizedBox(
                                    width: 30.0,
                                    height: 13.0,
                                    child: Text.rich(
                                      TextSpan(
                                        style: TextStyle(
                                          fontFamily: 'TmoneyRoundWindRegular',
                                          fontSize: 10,
                                          color: const Color(0xff12d3fe),
                                        ),
                                        children: [
                                          TextSpan(
                                            text: '$mvp_cnt',
                                          ),
                                          TextSpan(
                                            text: '/5',
                                            style: TextStyle(
                                              color: const Color(0xff000000),
                                            ),
                                          ),
                                        ],
                                      ),
                                      textHeightBehavior: TextHeightBehavior(
                                          applyHeightToFirstAscent: false),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 25.0, start: 2.0),
                            Pin(size: 25.0, start: 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage(
                                      'assets/images/Trophy_Gold_Icon.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      width: 131.0,
                      height: 41.0,
                      child: Stack(
                        children: <Widget>[
                          Pinned.fromPins(
                            Pin(size: 105.0, end: 3.0),
                            Pin(size: 13.0, middle: 0.25),
                            child: Text(
                              '이겼댕!',
                              style: TextStyle(
                                fontFamily: 'TmoneyRoundWindRegular',
                                fontSize: 11,
                                color: const Color(0xff000000),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(start: 0.0, end: 0.0),
                            Pin(size: 15.0, end: 0.0),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment(-0.977, 0.0),
                                      end: Alignment(0.978, 0.0),
                                      colors: [
                                        const Color(0xffffca18),
                                        const Color(0xfffff8f1),
                                        const Color(0xffdedede)
                                      ],
                                      stops: [0.0, percentage6! / 10, 1.0],
                                    ),
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment(-0.03, 1.0),
                                  child: SizedBox(
                                    width: 30.0,
                                    height: 13.0,
                                    child: Text.rich(
                                      TextSpan(
                                        style: TextStyle(
                                          fontFamily: 'TmoneyRoundWindRegular',
                                          fontSize: 10,
                                          color: const Color(0xff12d3fe),
                                        ),
                                        children: [
                                          TextSpan(
                                            text: '$win_cnt',
                                          ),
                                          TextSpan(
                                            text: '/10',
                                            style: TextStyle(
                                              color: const Color(0xff000000),
                                            ),
                                          ),
                                        ],
                                      ),
                                      textHeightBehavior: TextHeightBehavior(
                                          applyHeightToFirstAscent: false),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 25.0, start: 2.0),
                            Pin(size: 25.0, start: 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage(
                                      'assets/images/Trophy_Gold_Icon.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(
                      width: 131.0,
                      height: 41.0,
                      child: Stack(
                        children: <Widget>[
                          Pinned.fromPins(
                            Pin(size: 105.0, end: 3.0),
                            Pin(size: 13.0, middle: 0.25),
                            child: Text(
                              '친구를 찾아요',
                              style: TextStyle(
                                fontFamily: 'TmoneyRoundWindRegular',
                                fontSize: 11,
                                color: const Color(0xff000000),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(start: 0.0, end: 0.0),
                            Pin(size: 15.0, end: 0.0),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment(-0.977, 0.0),
                                      end: Alignment(0.978, 0.0),
                                      colors: [
                                        const Color(0xffc41eff),
                                        const Color(0xfffff8f1),
                                        const Color(0xffdedede)
                                      ],
                                      stops: [0.0, percentage4! / 10, 1.0],
                                    ),
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment(-0.03, 1.0),
                                  child: SizedBox(
                                    width: 30.0,
                                    height: 13.0,
                                    child: Text.rich(
                                      TextSpan(
                                        style: TextStyle(
                                          fontFamily: 'TmoneyRoundWindRegular',
                                          fontSize: 10,
                                          color: const Color(0xff12d3fe),
                                        ),
                                        children: [
                                          TextSpan(
                                            text: '$mini_cnt',
                                          ),
                                          TextSpan(
                                            text: '/10',
                                            style: TextStyle(
                                              color: const Color(0xff000000),
                                            ),
                                          ),
                                        ],
                                      ),
                                      textHeightBehavior: TextHeightBehavior(
                                          applyHeightToFirstAscent: false),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 25.0, start: 2.0),
                            Pin(size: 25.0, start: 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage(
                                      'assets/images/Trophy_Purple_Icon.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 131.0,
                      height: 41.0,
                      child: Stack(
                        children: <Widget>[
                          Pinned.fromPins(
                            Pin(size: 105.0, end: 3.0),
                            Pin(size: 13.0, middle: 0.25),
                            child: Text(
                              '성실한 산책러',
                              style: TextStyle(
                                fontFamily: 'TmoneyRoundWindRegular',
                                fontSize: 11,
                                color: const Color(0xff000000),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(start: 0.0, end: 0.0),
                            Pin(size: 15.0, end: 0.0),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment(-0.977, 0.0),
                                      end: Alignment(0.978, 0.0),
                                      colors: [
                                        const Color(0xffc41eff),
                                        const Color(0xfffff8f1),
                                        const Color(0xffdedede)
                                      ],
                                      stops: [0.0, percentage5! / 20, 1.0],
                                    ),
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment(-0.03, 1.0),
                                  child: SizedBox(
                                    width: 30.0,
                                    height: 13.0,
                                    child: Text.rich(
                                      TextSpan(
                                        style: TextStyle(
                                          fontFamily: 'TmoneyRoundWindRegular',
                                          fontSize: 10,
                                          color: const Color(0xff12d3fe),
                                        ),
                                        children: [
                                          TextSpan(
                                            text: '$game_cnt',
                                          ),
                                          TextSpan(
                                            text: '/20',
                                            style: TextStyle(
                                              color: const Color(0xff000000),
                                            ),
                                          ),
                                        ],
                                      ),
                                      textHeightBehavior: TextHeightBehavior(
                                          applyHeightToFirstAscent: false),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 25.0, start: 2.0),
                            Pin(size: 25.0, start: 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage(
                                      'assets/images/Trophy_Purple_Icon.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
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
  }
}

const String _svg_dr2shc =
    '<svg viewBox="0.0 321.0 360.0 1.0" ><path transform="translate(0.0, 321.0)" d="M 0 0 L 360 0" fill="none" stroke="#bcbcbc" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ag8azw =
    '<svg viewBox="0.0 286.0 360.0 1.0" ><path transform="translate(0.0, 286.0)" d="M 0 0 L 360 0" fill="none" stroke="#bcbcbc" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_auog60 =
    '<svg viewBox="0.0 251.0 360.0 1.0" ><path transform="translate(0.0, 251.0)" d="M 0 0 L 360 0" fill="none" stroke="#bcbcbc" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_dfq88q =
    '<svg viewBox="0.0 216.0 360.0 1.0" ><path transform="translate(0.0, 216.0)" d="M 0 0 L 360 0" fill="none" stroke="#bcbcbc" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_rpaipl =
    '<svg viewBox="0.5 576.5 360.0 1.0" ><path transform="translate(0.5, 576.55)" d="M 0 0 L 360 0" fill="none" stroke="#bcbcbc" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_nlpftk =
    '<svg viewBox="0.0 141.0 360.0 1.0" ><path transform="translate(0.0, 141.0)" d="M 0 0 L 360 0" fill="none" stroke="#bcbcbc" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
