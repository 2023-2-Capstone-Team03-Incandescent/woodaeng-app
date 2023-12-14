import 'dart:convert';

import 'package:did_u_c_my_dog/Profile_Achievements_GetPoint.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './Profile.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'game_data.dart';

// 업적에 있는 퍼센트 게이지는 가은이가 주는 정수값 변수로 받아서 percentage#1~7로 저장해두고
// BoxDecoration에 LinearGradient, stops: [0.0, 0.51, 1.0],의 중앙 값 수정할 것.
// e.g. 현재 원판 뒤집은 횟수가 10으로 오면, 원판 콜렉터 업적 달성치는 50이므로 진척도는 1/5임
// percetage1 = 10, -> stops: [0.0, percentage1 / 50, 1.0]
//                  == stops: [0.0, 0.2, 1.0]
// 위 내용은 박스 그라데이션 (퍼센티지 박스) 표시법이고, #/N으로 표시 된 텍스트도 percentage#/N으로 수정.
// 위젯 코드에 업적 별로 주석 추가해놓았음.
// 위 작업 끝나면 Profile.dart에 있는 업적 미리보기 화면에도 반영해야함.

int ?user_id=0;
int ?ball_cnt=0;
int ?gold_cnt=0;
int ?box_cnt=0;
int ?mini_cnt=0;
int ?game_cnt=0;
int ?win_cnt=0;
int ?mvp_cnt=0;

int? percentage1 = ball_cnt;
int? percentage2 = gold_cnt;
int? percentage3 = box_cnt;
int? percentage4 = mini_cnt;
int? percentage5 = game_cnt;
int? percentage6 = win_cnt;
int? percentage7 = mvp_cnt;

void getAchievement() async {
  String url = "https://www.woodaeng.kro.kr/users/trophy";
  var response = await http.get(Uri.parse(url),
  headers: {'accessToken': accessToken});
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String responseBody = utf8.decode(response.bodyBytes);

  Map<String, dynamic> trophy = jsonDecode(responseBody);

  ball_cnt = trophy['ball_cnt'];
  gold_cnt = trophy['gold_cnt'];
  box_cnt = trophy['box_cnt'];
  mini_cnt = trophy['mini_cnt'];
  game_cnt = trophy['game_cnt'];
  win_cnt = trophy['win_cnt'];
  mvp_cnt = trophy['mvp_cnt'];
}

class Profile_Achievements extends StatefulWidget {
  Profile_Achievements({
    Key? key,
  }) : super(key: key);

  @override
  State<Profile_Achievements> createState() => _Profile_AchievementsState();
}

class _Profile_AchievementsState extends State<Profile_Achievements> {
  @override
  Widget build(BuildContext context) {
    getAchievement();
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 18.0, start: 16.0),
            Pin(size: 18.0, start: 30.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  ease: Curves.linear,
                  duration: 0.3,
                  pageBuilder: () => Profile(),
                ),
              ],
              child: SvgPicture.string(
                _svg_em7ua,
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 50.0, middle: 0.5314),
            Pin(size: 30.0, start: 73.0),
            child: Text(
              '업적',
              style: TextStyle(
                fontFamily: 'TmoneyRoundWindRegular',
                fontSize: 25,
                color: const Color(0xff000000),
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 35.0, middle: 0.4123),
            Pin(size: 35.0, start: 71.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/Flag_Icon.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 42.0, end: 37.0),
            Pin(size: 48.0, middle: 0.228),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    width: 25.0,
                    height: 38.0,
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromPins(
                          Pin(start: 0.0, end: 0.0),
                          Pin(size: 25.0, start: 0.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if(percentage1! >= 50) {
                                  AchievementsGetPoint(context);
                                  percentage1 = percentage1! - 50;
                                }
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage('assets/images/Dog_Bone_Icon.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(-0.111, 1.0),
                          child: SizedBox(
                            width: 19.0,
                            height: 11.0,
                            child: Text(
                              '받기',
                              style: TextStyle(
                                fontFamily: 'TmoneyRoundWindRegular',
                                fontSize: 9,
                                color: const Color(0xff6a6767),
                              ),
                              softWrap: false,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 110.0, start: 65.0),
                  Pin(size: 16.0, start: 3.0),
                  child: Text(
                    '원판 콜렉터',
                    style: TextStyle(
                      fontFamily: 'TmoneyRoundWindRegular',
                      fontSize: 12,
                      color: const Color(0xff000000),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 80.0, middle: 0.6763),
                  Pin(size: 11.0, start: 18.0),
                  child: Text(
                    '물어온 원판 개수',
                    style: TextStyle(
                      fontFamily: 'TmoneyRoundWindRegular',
                      fontSize: 9,
                      color: const Color(0xff6a6767),
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage(
                            'assets/images/Trophy_Blue_Icon.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: SizedBox(
                    width: 250.0,
                    height: 15.0,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(-0.977, 0.0),
                              end: Alignment(0.978, 0.0),
                              colors: [
                                const Color(0xff12d3fe),
                                const Color(0xffe0e0e0),
                                const Color(0xffdedede)
                              ],
                              stops: [0.0, percentage1! / 50, 1.0], // 원판 콜렉터
                            ),
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                        ),
                        Align(
                          alignment: Alignment(-0.025, 1.0),
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
                                    text: '$ball_cnt', // 원판 콜렉터
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
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 42.0, end: 37.0),
            Pin(size: 48.0, middle: 0.3429),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    width: 25.0,
                    height: 38.0,
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromPins(
                          Pin(start: 0.0, end: 0.0),
                          Pin(size: 25.0, start: 0.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if(percentage2! >= 15) {
                                  AchievementsGetPoint(context);
                                  percentage2 = percentage2! - 15;
                                }
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage('assets/images/Dog_Bone_Icon.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(-0.111, 1.0),
                          child: SizedBox(
                            width: 19.0,
                            height: 11.0,
                            child: Text(
                              '받기',
                              style: TextStyle(
                                fontFamily: 'TmoneyRoundWindRegular',
                                fontSize: 9,
                                color: const Color(0xff6a6767),
                              ),
                              softWrap: false,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 110.0, start: 65.0),
                  Pin(size: 14.0, start: 3.0),
                  child: Text(
                    '심마니',
                    style: TextStyle(
                      fontFamily: 'TmoneyRoundWindRegular',
                      fontSize: 12,
                      color: const Color(0xff000000),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 90.0, middle: 0.6763),
                  Pin(size: 11.0, start: 18.0),
                  child: Text(
                    '물어온 황금원판 개수',
                    style: TextStyle(
                      fontFamily: 'TmoneyRoundWindRegular',
                      fontSize: 9,
                      color: const Color(0xff6a6767),
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage(
                            'assets/images/Trophy_Blue_Icon.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: SizedBox(
                    width: 250.0,
                    height: 15.0,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(-0.977, 0.0),
                              end: Alignment(0.978, 0.0),
                              colors: [
                                const Color(0xff12d3fe),
                                const Color(0xffe0e0e0),
                                const Color(0xffdedede)
                              ],
                              stops: [0.0, percentage2! / 15, 1.0], // 심마니
                            ),
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                        ),
                        Align(
                          alignment: Alignment(-0.025, 1.0),
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
                                    text: '$gold_cnt', // 심마니
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
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 42.0, end: 37.0),
            Pin(size: 48.0, middle: 0.4578),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    width: 25.0,
                    height: 38.0,
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromPins(
                          Pin(start: 0.0, end: 0.0),
                          Pin(size: 25.0, start: 0.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if(percentage3! >= 15) {
                                  AchievementsGetPoint(context);
                                  percentage3 = percentage3! - 15;
                                }
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage('assets/images/Dog_Bone_Icon.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(-0.111, 1.0),
                          child: SizedBox(
                            width: 19.0,
                            height: 11.0,
                            child: Text(
                              '받기',
                              style: TextStyle(
                                fontFamily: 'TmoneyRoundWindRegular',
                                fontSize: 9,
                                color: const Color(0xff6a6767),
                              ),
                              softWrap: false,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 110.0, start: 65.0),
                  Pin(size: 14.0, start: 3.0),
                  child: Text(
                    '궁금한 건 못 참아',
                    style: TextStyle(
                      fontFamily: 'TmoneyRoundWindRegular',
                      fontSize: 12,
                      color: const Color(0xff000000),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 80.0, middle: 0.6763),
                  Pin(size: 11.0, start: 18.0),
                  child: Text(
                    '랜덤박스 개봉 횟수',
                    style: TextStyle(
                      fontFamily: 'TmoneyRoundWindRegular',
                      fontSize: 9,
                      color: const Color(0xff6a6767),
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage(
                            'assets/images/Trophy_Blue_Icon.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: SizedBox(
                    width: 250.0,
                    height: 15.0,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(-0.977, 0.0),
                              end: Alignment(0.978, 0.0),
                              colors: [
                                const Color(0xff12d3fe),
                                const Color(0xffe0e0e0),
                                const Color(0xffdedede)
                              ],
                              stops: [0.0, percentage3! / 15, 1.0], // 궁금한 건 못 참아
                            ),
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                        ),
                        Align(
                          alignment: Alignment(-0.025, 1.0),
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
                                    text: '$box_cnt', // 궁금한 건 못 참아
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
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 42.0, end: 37.0),
            Pin(size: 48.0, middle: 0.5726),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    width: 25.0,
                    height: 38.0,
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromPins(
                          Pin(start: 0.0, end: 0.0),
                          Pin(size: 25.0, start: 0.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if(percentage4! >= 10) {
                                  AchievementsGetPoint(context);
                                  percentage4 = percentage4! - 10;
                                }
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage('assets/images/Dog_Bone_Icon.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(-0.111, 1.0),
                          child: SizedBox(
                            width: 19.0,
                            height: 11.0,
                            child: Text(
                              '받기',
                              style: TextStyle(
                                fontFamily: 'TmoneyRoundWindRegular',
                                fontSize: 9,
                                color: const Color(0xff6a6767),
                              ),
                              softWrap: false,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 110.0, start: 65.0),
                  Pin(size: 14.0, start: 3.0),
                  child: Text(
                    '친구를 찾아요',
                    style: TextStyle(
                      fontFamily: 'TmoneyRoundWindRegular',
                      fontSize: 12,
                      color: const Color(0xff000000),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 90.0, middle: 0.6763),
                  Pin(size: 11.0, start: 18.0),
                  child: Text(
                    '미니게임 플레이 횟수',
                    style: TextStyle(
                      fontFamily: 'TmoneyRoundWindRegular',
                      fontSize: 9,
                      color: const Color(0xff6a6767),
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: SizedBox(
                    width: 250.0,
                    height: 15.0,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(-0.977, 0.0),
                              end: Alignment(0.978, 0.0),
                              colors: [
                                const Color(0xffc41eff),
                                const Color(0xffe0e0e0),
                                const Color(0xffdedede)
                              ],
                              stops: [0.0, percentage4! / 10, 1.0], // 친구를 찾아요
                            ),
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                        ),
                        Align(
                          alignment: Alignment(-0.025, 1.0),
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
                                    text: '$mini_cnt', // 친구를 찾아요
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
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 30.0,
                    height: 30.0,
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
          Pinned.fromPins(
            Pin(start: 42.0, end: 37.0),
            Pin(size: 48.0, middle: 0.6875),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    width: 25.0,
                    height: 38.0,
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromPins(
                          Pin(start: 0.0, end: 0.0),
                          Pin(size: 25.0, start: 0.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if(percentage5! >= 20) {
                                  AchievementsGetPoint(context);
                                  percentage5 = percentage5! - 20;
                                }
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage('assets/images/Dog_Bone_Icon.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(-0.111, 1.0),
                          child: SizedBox(
                            width: 19.0,
                            height: 11.0,
                            child: Text(
                              '받기',
                              style: TextStyle(
                                fontFamily: 'TmoneyRoundWindRegular',
                                fontSize: 9,
                                color: const Color(0xff6a6767),
                              ),
                              softWrap: false,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 110.0, start: 65.0),
                  Pin(size: 16.0, start: 3.0),
                  child: Text(
                    '성실한 산책러',
                    style: TextStyle(
                      fontFamily: 'TmoneyRoundWindRegular',
                      fontSize: 12,
                      color: const Color(0xff000000),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 80.0, middle: 0.6763),
                  Pin(size: 11.0, start: 18.0),
                  child: Text(
                    '게임 플레이 횟수',
                    style: TextStyle(
                      fontFamily: 'TmoneyRoundWindRegular',
                      fontSize: 9,
                      color: const Color(0xff6a6767),
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: SizedBox(
                    width: 250.0,
                    height: 15.0,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(-0.977, 0.0),
                              end: Alignment(0.978, 0.0),
                              colors: [
                                const Color(0xffc41eff),
                                const Color(0xffe0e0e0),
                                const Color(0xffdedede)
                              ],
                              stops: [0.0, percentage5! / 20, 1.0], // 성실한 산책러
                            ),
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                        ),
                        Align(
                          alignment: Alignment(-0.025, 1.0),
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
                                    text: '$game_cnt', // 성실한 산책러
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
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 30.0,
                    height: 30.0,
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
          Pinned.fromPins(
            Pin(start: 42.0, end: 37.0),
            Pin(size: 48.0, middle: 0.8024),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    width: 25.0,
                    height: 38.0,
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromPins(
                          Pin(start: 0.0, end: 0.0),
                          Pin(size: 25.0, start: 0.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if(percentage6! >= 10) {
                                  AchievementsGetPoint(context);
                                  percentage6 = percentage6! - 10;
                                }
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage('assets/images/Dog_Bone_Icon.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(-0.111, 1.0),
                          child: SizedBox(
                            width: 19.0,
                            height: 11.0,
                            child: Text(
                              '받기',
                              style: TextStyle(
                                fontFamily: 'TmoneyRoundWindRegular',
                                fontSize: 9,
                                color: const Color(0xff6a6767),
                              ),
                              softWrap: false,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 110.0, start: 65.0),
                  Pin(size: 16.0, start: 3.0),
                  child: Text(
                    '이겼댕!',
                    style: TextStyle(
                      fontFamily: 'TmoneyRoundWindRegular',
                      fontSize: 12,
                      color: const Color(0xff000000),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 80.0, middle: 0.6763),
                  Pin(size: 11.0, start: 18.0),
                  child: Text(
                    '게임 승리 횟수',
                    style: TextStyle(
                      fontFamily: 'TmoneyRoundWindRegular',
                      fontSize: 9,
                      color: const Color(0xff6a6767),
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: SizedBox(
                    width: 250.0,
                    height: 15.0,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(-0.977, 0.0),
                              end: Alignment(0.978, 0.0),
                              colors: [
                                const Color(0xffffca18),
                                const Color(0xffe0e0e0),
                                const Color(0xffdedede)
                              ],
                              stops: [0.0, percentage6! / 10, 1.0], // 이겼댕!
                            ),
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                        ),
                        Align(
                          alignment: Alignment(-0.025, 1.0),
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
                                    text: '$win_cnt', // 이겼댕!
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
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 30.0,
                    height: 30.0,
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
          Pinned.fromPins(
            Pin(start: 42.0, end: 37.0),
            Pin(size: 48.0, end: 57.0),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    width: 25.0,
                    height: 38.0,
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromPins(
                          Pin(start: 0.0, end: 0.0),
                          Pin(size: 25.0, start: 0.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if(percentage7! >= 5) {
                                  AchievementsGetPoint(context);
                                  percentage7 = percentage7! - 5;
                                }
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage('assets/images/Dog_Bone_Icon.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(-0.111, 1.0),
                          child: SizedBox(
                            width: 19.0,
                            height: 11.0,
                            child: Text(
                              '받기',
                              style: TextStyle(
                                fontFamily: 'TmoneyRoundWindRegular',
                                fontSize: 9,
                                color: const Color(0xff6a6767),
                              ),
                              softWrap: false,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 110.0, start: 65.0),
                  Pin(size: 16.0, start: 3.0),
                  child: Text(
                    '오늘은 내가 주인공!',
                    style: TextStyle(
                      fontFamily: 'TmoneyRoundWindRegular',
                      fontSize: 12,
                      color: const Color(0xff000000),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 80.0, middle: 0.6763),
                  Pin(size: 11.0, start: 18.0),
                  child: Text(
                    'MVP 달성 횟수',
                    style: TextStyle(
                      fontFamily: 'TmoneyRoundWindRegular',
                      fontSize: 9,
                      color: const Color(0xff6a6767),
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: SizedBox(
                    width: 250.0,
                    height: 15.0,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(-0.977, 0.0),
                              end: Alignment(0.978, 0.0),
                              colors: [
                                const Color(0xffffca18),
                                const Color(0xffe0e0e0),
                                const Color(0xffdedede)
                              ],
                              stops: [0.0, percentage7! / 5, 1.0], // 오늘은 내가 주인공!
                            ),
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                        ),
                        Align(
                          alignment: Alignment(-0.025, 1.0),
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
                                    text: '$mvp_cnt', // 오늘은 내가 주인공!
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
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 30.0,
                    height: 30.0,
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
        ],
      ),
    );
  }
}

const String _svg_em7ua =
    '<svg viewBox="16.0 30.0 18.0 18.0" ><path transform="translate(10.38, 23.67)" d="M 22.06487274169922 13.59468078613281 L 11.11859798431396 13.59468078613281 L 15.36411571502686 9.289215087890625 C 15.97280979156494 8.611400604248047 15.97280979156494 7.516055583953857 15.36411571502686 6.838243007659912 C 14.75541973114014 6.160430431365967 13.76821041107178 6.160430431365967 13.15440082550049 6.838243007659912 L 6.085356712341309 14.10439682006836 C 5.778451919555664 14.41890239715576 5.624999523162842 14.84728050231934 5.624999523162842 15.31903839111328 L 5.624999523162842 15.34072875976562 C 5.624999523162842 15.81248664855957 5.778451919555664 16.24086380004883 6.085356712341309 16.55537033081055 L 13.14928531646729 23.82152366638184 C 13.76309299468994 24.49933624267578 14.75030612945557 24.49933624267578 15.35899829864502 23.82152366638184 C 15.96769428253174 23.14370918273926 15.96769428253174 22.04836463928223 15.35899829864502 21.37055206298828 L 11.11348247528076 17.06508636474609 L 22.05975723266602 17.06508636474609 C 22.92420768737793 17.06508636474609 23.62497329711914 16.2896671295166 23.62497329711914 15.3298864364624 C 23.63008880615234 14.35383224487305 22.9293212890625 13.59468078613281 22.06487274169922 13.59468078613281 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
