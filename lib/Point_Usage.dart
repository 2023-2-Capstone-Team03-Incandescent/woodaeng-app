import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'game_data.dart';
import 'package:did_u_c_my_dog/Point.dart';

class gamePoint {
  int user_id;
  int point;
  String detail;
  String time;

  gamePoint({
    required this.user_id,
    required this.point,
    required this.detail,
    required this.time,
  });

  gamePoint.fromJson(Map<String, dynamic> json)
      : user_id = json['user_id'],
        point = json['point'],
        detail = json['detail'],
        time = DateFormat('yyyy년 MM월 dd일').format(DateTime.parse(json['time']));

  Map<String, dynamic> toJson() => {
    'user_id': user_id,
    'point': point,
    'detail': detail,
    'time': time
  };

}

List<gamePoint> pointList = [];

// 프로필 리스트 불러오기
void getPointInfo() async {
  String url = "https://www.woodaeng.kro.kr/users/point/list";
  var response = await http.get(Uri.parse(url), headers: {'accessToken': accessToken});
  var statusCode = response.statusCode;

  if (statusCode == 200) {
    List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));
    print('Response body: $data'); // Add this line to see the response body

    // Assuming the response is a list of gamePoint objects
    pointList = data.map((item) => gamePoint.fromJson(item)).toList();
    print('완료되었습니다');
  } else {
    // Handle error or unexpected response
    print('Error: $statusCode');
  }
}


class Point_Usage extends StatelessWidget {
  Point_Usage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    getPointInfo();
    print(pointList);
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 18.0, start: 16.0),
            Pin(size: 18.0, start: 49.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  ease: Curves.linear,
                  duration: 0.3,
                  pageBuilder: () => Point(),
                ),
              ],
              child: SvgPicture.string(
                _svg_tfy061,
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 164.0, middle: 0.5),
            Pin(size: 40.0, start: 68.0),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 128.0,
                    height: 30.0,
                    child: Text(
                      '포인트 내역',
                      style: TextStyle(
                        fontFamily: 'TmoneyRoundWindRegular',
                        fontSize: 25,
                        color: const Color(0xff000000),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 40.0, start: 0.0),
                  Pin(start: 0.0, end: 0.0),
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
            Pin(start: 0.0, end: 0.0),
            Pin(size: 1.0, middle: 0.3662),
            child: SvgPicture.string(
              _svg_n04z6,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 1.0, middle: 0.421),
            child: SvgPicture.string(
              _svg_uxww52,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 1.0, middle: 0.4757),
            child: SvgPicture.string(
              _svg_y8rdmi,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 1.0, middle: 0.5305),
            child: SvgPicture.string(
              _svg_fhfx6q,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 1.0, middle: 0.5853),
            child: SvgPicture.string(
              _svg_v99gdo,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 1.0, middle: 0.6385),
            child: SvgPicture.string(
              _svg_kn6f0,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 1.0, middle: 0.6933),
            child: SvgPicture.string(
              _svg_vv1utq,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 1.0, middle: 0.7496),
            child: SvgPicture.string(
              _svg_te7s,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 1.0, middle: 0.3114),
            child: SvgPicture.string(
              _svg_c5nhq,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 1.0, middle: 0.2567),
            child: SvgPicture.string(
              _svg_eyr3o6,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 30.0, end: 44.0),
            Pin(size: 11.0, middle: 0.2289),
            child: Text(
              '날짜',
              style: TextStyle(
                fontFamily: 'TmoneyRoundWindRegular',
                fontSize: 9,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 30.0, start: 50.0),
            Pin(size: 11.0, middle: 0.2289),
            child: Text(
              '구분',
              style: TextStyle(
                fontFamily: 'TmoneyRoundWindRegular',
                fontSize: 9,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Align(
            alignment: Alignment(0.23, -0.542),
            child: SizedBox(
              width: 20.0,
              height: 11.0,
              child: Text(
                '유형',
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
            alignment: Alignment(-0.255, -0.542),
            child: SizedBox(
              width: 30.0,
              height: 11.0,
              child: Text(
                '금액',
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
            alignment: Alignment(0.004, -0.637),
            child: SizedBox(
              width: 150.0,
              height: 18.0,
              child: Text(
                '내 포인트 : ${point}P',
                style: TextStyle(
                  fontFamily: 'TmoneyRoundWindRegular',
                  fontSize: 15,
                  color: const Color(0xffffca18),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            top: 43.0 + 130.0,
            bottom: 65.0,
            left: 0.0,
            right: 0.0,
            child: ListView.builder(
              itemCount: pointList.length,
              itemBuilder: (BuildContext context, int index) {
                return buildPointItem(pointList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
Widget buildPointItem(gamePoint pointList) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
    padding: EdgeInsets.all(8.0), // Increased padding for better spacing
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 80.0, // Adjusted width for the "획득" text container
          child: Align(
            alignment: Alignment(-1.0, -0.043),
            child: Text(
              '획득',
              style: TextStyle(
                fontFamily: 'TmoneyRoundWindRegular',
                fontSize: 10.0,
                color: const Color(0xff12d3fe),
              ),
            ),
          ),
        ),
        SizedBox(width: 20.0), // Reduced width for better spacing
        Expanded(
          child: Text(
            '+${pointList.point}P',
            style: TextStyle(
              fontFamily: 'TmoneyRoundWindRegular',
              fontSize: 10.0,
              color: const Color(0xff000000),
            ),
          ),
        ),
        Expanded(
          child: Text(
            '${pointList.detail}',
            style: TextStyle(
              fontFamily: 'TmoneyRoundWindRegular',
              fontSize: 10.0,
              color: const Color(0xff000000),
            ),
          ),
        ),
        SizedBox(width: 20.0), // Reduced width for better spacing
        Text(
          '${pointList.time}',
          style: TextStyle(
            fontFamily: 'TmoneyRoundWindRegular',
            fontSize: 10.0,
          ),
        ),
      ],
    ),
  );
}

const String _svg_tfy061 =
    '<svg viewBox="16.0 49.0 18.0 18.0" ><path transform="translate(10.38, 42.67)" d="M 22.06487274169922 13.59468078613281 L 11.11859798431396 13.59468078613281 L 15.36411571502686 9.289215087890625 C 15.97280979156494 8.611400604248047 15.97280979156494 7.516055583953857 15.36411571502686 6.838243007659912 C 14.75541973114014 6.160430431365967 13.76821041107178 6.160430431365967 13.15440082550049 6.838243007659912 L 6.085356712341309 14.10439682006836 C 5.778451919555664 14.41890239715576 5.624999523162842 14.84728050231934 5.624999523162842 15.31903839111328 L 5.624999523162842 15.34072875976562 C 5.624999523162842 15.81248664855957 5.778451919555664 16.24086380004883 6.085356712341309 16.55537033081055 L 13.14928531646729 23.82152366638184 C 13.76309299468994 24.49933624267578 14.75030612945557 24.49933624267578 15.35899829864502 23.82152366638184 C 15.96769428253174 23.14370918273926 15.96769428253174 22.04836463928223 15.35899829864502 21.37055206298828 L 11.11348247528076 17.06508636474609 L 22.05975723266602 17.06508636474609 C 22.92420768737793 17.06508636474609 23.62497329711914 16.2896671295166 23.62497329711914 15.3298864364624 C 23.63008880615234 14.35383224487305 22.9293212890625 13.59468078613281 22.06487274169922 13.59468078613281 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_n04z6 =
    '<svg viewBox="0.0 234.0 360.0 1.0" ><path transform="translate(0.0, 234.0)" d="M 0 0 L 360 0" fill="none" stroke="#bcbcbc" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_uxww52 =
    '<svg viewBox="0.0 269.0 360.0 1.0" ><path transform="translate(0.0, 269.0)" d="M 0 0 L 360 0" fill="none" stroke="#bcbcbc" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_y8rdmi =
    '<svg viewBox="0.0 304.0 360.0 1.0" ><path transform="translate(0.0, 304.0)" d="M 0 0 L 360 0" fill="none" stroke="#bcbcbc" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_fhfx6q =
    '<svg viewBox="0.0 339.0 360.0 1.0" ><path transform="translate(0.0, 339.0)" d="M 0 0 L 360 0" fill="none" stroke="#bcbcbc" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_v99gdo =
    '<svg viewBox="0.0 374.0 360.0 1.0" ><path transform="translate(0.0, 374.0)" d="M 0 0 L 360 0" fill="none" stroke="#bcbcbc" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_kn6f0 =
    '<svg viewBox="0.0 408.0 360.0 1.0" ><path transform="translate(0.0, 408.0)" d="M 0 0 L 360 0" fill="none" stroke="#bcbcbc" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_vv1utq =
    '<svg viewBox="0.0 443.0 360.0 1.0" ><path transform="translate(0.0, 443.0)" d="M 0 0 L 360 0" fill="none" stroke="#bcbcbc" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_te7s =
    '<svg viewBox="0.0 479.0 360.0 1.0" ><path transform="translate(0.0, 479.0)" d="M 0 0 L 360 0" fill="none" stroke="#bcbcbc" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_c5nhq =
    '<svg viewBox="0.0 199.0 360.0 1.0" ><path transform="translate(0.0, 199.0)" d="M 0 0 L 360 0" fill="none" stroke="#bcbcbc" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_eyr3o6 =
    '<svg viewBox="0.0 164.0 360.0 1.0" ><path transform="translate(0.0, 164.0)" d="M 0 0 L 360 0" fill="none" stroke="#bcbcbc" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
