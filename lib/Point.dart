import 'package:did_u_c_my_dog/Game.dart';
import 'package:did_u_c_my_dog/Point_MapOverlay.dart';
import 'package:did_u_c_my_dog/Point_Naver.dart';
import 'package:did_u_c_my_dog/Profile.dart';
import 'package:did_u_c_my_dog/Profile_Achievements.dart';
import 'package:did_u_c_my_dog/Ranking.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './Point_Usage.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'game_data.dart';

int? point;

class gamePoint {
  int user_id;
  int point;
  String detail;
  DateTime time;

  gamePoint({
    required this.user_id,
    required this.point,
    required this.detail,
    required this.time});

  gamePoint.fromJson(Map<String,dynamic> json)
      : user_id = json['user_id'],
        point = json['point'],
        detail = json['detail'],
        time = json['time'];

  Map<String, dynamic> toJson() =>
      {
        'user_id':user_id,
        'point':point,
        'detail':detail,
        'time':time,
      };
}

List<Map<String, dynamic>> pointList = [];

// 프로필 리스트 불러오기
void getPointInfo() async {
  String url = "https://www.woodaeng.kro.kr/users/point/list";
  var response = await http.get(Uri.parse(url),
      headers: {'accessToken': accessToken});
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String responseBody = utf8.decode(response.bodyBytes);

  List<dynamic> data = json.decode(response.body);
  pointList = List<Map<String, dynamic>>.from(data);

}



// 보유 포인트
void getHavePoint() async {
  String url = "https://www.woodaeng.kro.kr/users/point";
  var response = await http.get(Uri.parse(url),
      headers: {'accessToken': accessToken});
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String responseBody = utf8.decode(response.bodyBytes);

  point = json.decode(response.body);
}




class Point extends StatefulWidget {
  Point({
    Key? key,
  }) : super(key: key);

  @override
  State<Point> createState() => _PointState();
}

class _PointState extends State<Point> {
  @override
  Widget build(BuildContext context) {
    setState(() {
      getHavePoint();
    });
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Stack(
          children: <Widget>[
            Point_Naver(),
            Pinned.fromPins(
              Pin(start: -0.5, end: 0.0),
              Pin(size: 1.0, middle: 0.2254),
              child: SvgPicture.string(
                _svg_mu86bw,
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
            ),
            Pinned.fromPins(
              Pin(start: -0.5, end: 0.0),
              Pin(size: 170.5, middle: 0.0),
              child: Container(
                color: Colors.white,
              ),
            ),
            Pinned.fromPins(
              Pin(size: 40.0, middle: 0.3594),
              Pin(size: 40.0, end: 18.0),
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
                          color: const Color(0xffffa149),
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
                    Pin(size: 40.0, middle: 0.3588),
                    Pin(size: 40.0, start: 6.0),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage(
                              'assets/images/Point_Selected_Icon.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Pinned.fromPins(
              Pin(size: 86.0, middle: 0.2044),
              Pin(size: 86.0, start: 56.0),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('$image_id'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(43.0),
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(size: 115.0, end: 50.0),
              Pin(size: 69.2, start: 62.0),
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(size: 22.0, start: 0.0),
                    child: Text(
                      '$nickname의 포인트',
                      style: TextStyle(
                        fontFamily: 'TmoneyRoundWindRegular',
                        fontSize: 18,
                        color: const Color(0xff000000),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 55.0, end: 16.0),
                    Pin(size: 18.0, middle: 0.5855),
                    child: Text(
                      '${point}P',
                      style: TextStyle(
                        fontFamily: 'TmoneyRoundWindRegular',
                        fontSize: 15,
                        color: const Color(0xffffca18),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 50.0, start: 7.5),
                    Pin(size: 41.7, end: 9.5),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage('assets/images/Point.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(start: 20.5, end: 20.5),
                    Pin(size: 11.0, end: 0.0),
                    child: PageLink(
                      links: [
                        PageLinkInfo(
                          ease: Curves.linear,
                          duration: 0.3,
                          pageBuilder: () => Point_Usage(),
                        ),
                      ],
                      child: Text(
                        '포인트 내역 보기 >',
                        style: TextStyle(
                          fontFamily: 'TmoneyRoundWindRegular',
                          fontSize: 9,
                          color: const Color(0xff5d5a5a),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Pinned.fromPins(
              Pin(size: 59.0, end: 20.0),
              Pin(size: 59.0, end: 89.0),
              child: GestureDetector(
                onTap: () {
                  PointMapOverlay(context);
                },
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, -1.0),
                        end: Alignment(0.0, 1.0),
                        colors: [
                          const Color(0xffdbdbdb),
                          const Color(0xffeeeeee),
                          const Color(0xffececec),
                          const Color(0xffd5d5d5)
                        ],
                        stops: [0.0, 0.318, 0.703, 1.0],
                      ),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff6e6e6e),
                          offset: Offset(0, 0),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage('assets/images/List_Icon.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    margin: EdgeInsets.all(13.0),
                  ),
                ],
              ),
            ),
            )
          ],
        ),
      ),
    );
  }
}

const String _svg_mu86bw =
    '<svg viewBox="-0.5 144.0 360.5 1.0" ><path transform="translate(-0.5, 144.0)" d="M 0 0 L 360.5 0" fill="none" stroke="#bcbcbc" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_rpaipl =
    '<svg viewBox="0.5 576.5 360.0 1.0" ><path transform="translate(0.5, 576.55)" d="M 0 0 L 360 0" fill="none" stroke="#bcbcbc" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
