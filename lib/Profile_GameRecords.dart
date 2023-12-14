import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './Profile.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'game_data.dart';
import 'package:http/http.dart'as http;
import 'Profile.dart';

class Profile_GameRecords extends StatelessWidget {
  Profile_GameRecords({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
            Pin(size: 104.0, middle: 0.5625),
            Pin(size: 30.0, start: 73.0),
            child: Text(
              '대전 기록',
              style: TextStyle(
                fontFamily: 'TmoneyRoundWindRegular',
                fontSize: 25,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 35.0, middle: 0.3446),
            Pin(size: 35.0, start: 71.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                  const AssetImage('assets/images/Game_Records_Icon.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 1.0, middle: 0.3521),
            child: SvgPicture.string(
              _svg_nz6udm,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 1.0, middle: 0.4085),
            child: SvgPicture.string(
              _svg_vkn0wq,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 1.0, middle: 0.4648),
            child: SvgPicture.string(
              _svg_f884s,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 1.0, middle: 0.5211),
            child: SvgPicture.string(
              _svg_qf17hu,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 1.0, middle: 0.5775),
            child: SvgPicture.string(
              _svg_m7lfs,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 1.0, middle: 0.6338),
            child: SvgPicture.string(
              _svg_ddldxa,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 1.0, middle: 0.6901),
            child: SvgPicture.string(
              _svg_s57e6,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 1.0, middle: 0.7465),
            child: SvgPicture.string(
              _svg_r93ljg,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 1.0, middle: 0.2973),
            child: SvgPicture.string(
              _svg_u8pgk,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 1.0, middle: 0.2426),
            child: SvgPicture.string(
              _svg_mg5yy6,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 65.0, end: 27.0),
            Pin(size: 11.0, middle: 0.2146),
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
            Pin(size: 11.0, middle: 0.2146),
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
            alignment: Alignment(0.253, -0.571),
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
            alignment: Alignment(-0.296, -0.571),
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
          Positioned(
            top: 43.0 + 130.0,
            bottom: 65.0,
            left: 0.0,
            right: 0.0,
            child: ListView.builder(
              itemCount: gameRecords.length,
              itemBuilder: (BuildContext context, int index) {
                return buildgameRecordItem(gameRecords[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildgameRecordItem(GameRecords gameRecords) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
    padding: EdgeInsets.all(2.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment(-1.0, -0.043),
          child: SizedBox(
            width: 20.0,
            height: 20.0,
            child: gameRecords.mvp == 1 ? Image.asset('assets/images/MVP_Icon.png') : Container(),
          ),
        ),
        SizedBox(width: 10.0),
        Expanded(
          child: Text(
            gameRecords.win == 1 ? '승리' : '패배',
            style: TextStyle(
                fontFamily: 'TmoneyRoundWindRegular',
                fontSize: 10.0,
                color: gameRecords.win == 1 ? const Color(0xff002bff) : const Color(0xffff0000)
            ),
          ),
        ),
        SizedBox(width: 40.0),
        Text(
          '${gameRecords.location}',
          style: TextStyle(
            fontFamily: 'TmoneyRoundWindRegular',
            fontSize: 10.0,
            color: const Color(0xff000000),
          ),
        ),
        SizedBox(width: 80.0),
        Text(
          '${gameRecords.ball_cnt}',
          style: TextStyle(
            fontFamily: 'TmoneyRoundWindRegular',
            fontSize: 10.0,
            color: const Color(0xff000000),
          ),
        ),
        SizedBox(width: 30.0),
        Text(
          '${gameRecords.time}',
          style: TextStyle(
            fontFamily: 'TmoneyRoundWindRegular',
            fontSize: 10.0,
          ),
        ),
      ],
    ),
  );
}

const String _svg_em7ua =
    '<svg viewBox="16.0 30.0 18.0 18.0" ><path transform="translate(10.38, 23.67)" d="M 22.06487274169922 13.59468078613281 L 11.11859798431396 13.59468078613281 L 15.36411571502686 9.289215087890625 C 15.97280979156494 8.611400604248047 15.97280979156494 7.516055583953857 15.36411571502686 6.838243007659912 C 14.75541973114014 6.160430431365967 13.76821041107178 6.160430431365967 13.15440082550049 6.838243007659912 L 6.085356712341309 14.10439682006836 C 5.778451919555664 14.41890239715576 5.624999523162842 14.84728050231934 5.624999523162842 15.31903839111328 L 5.624999523162842 15.34072875976562 C 5.624999523162842 15.81248664855957 5.778451919555664 16.24086380004883 6.085356712341309 16.55537033081055 L 13.14928531646729 23.82152366638184 C 13.76309299468994 24.49933624267578 14.75030612945557 24.49933624267578 15.35899829864502 23.82152366638184 C 15.96769428253174 23.14370918273926 15.96769428253174 22.04836463928223 15.35899829864502 21.37055206298828 L 11.11348247528076 17.06508636474609 L 22.05975723266602 17.06508636474609 C 22.92420768737793 17.06508636474609 23.62497329711914 16.2896671295166 23.62497329711914 15.3298864364624 C 23.63008880615234 14.35383224487305 22.9293212890625 13.59468078613281 22.06487274169922 13.59468078613281 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_nz6udm =
    '<svg viewBox="0.0 225.0 360.0 1.0" ><path transform="translate(0.0, 225.0)" d="M 0 0 L 360 0" fill="none" stroke="#bcbcbc" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_vkn0wq =
    '<svg viewBox="0.0 261.0 360.0 1.0" ><path transform="translate(0.0, 261.0)" d="M 0 0 L 360 0" fill="none" stroke="#bcbcbc" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_f884s =
    '<svg viewBox="0.0 297.0 360.0 1.0" ><path transform="translate(0.0, 297.0)" d="M 0 0 L 360 0" fill="none" stroke="#bcbcbc" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_qf17hu =
    '<svg viewBox="0.0 333.0 360.0 1.0" ><path transform="translate(0.0, 333.0)" d="M 0 0 L 360 0" fill="none" stroke="#bcbcbc" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_m7lfs =
    '<svg viewBox="0.0 369.0 360.0 1.0" ><path transform="translate(0.0, 369.0)" d="M 0 0 L 360 0" fill="none" stroke="#bcbcbc" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ddldxa =
    '<svg viewBox="0.0 405.0 360.0 1.0" ><path transform="translate(0.0, 405.0)" d="M 0 0 L 360 0" fill="none" stroke="#bcbcbc" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_s57e6 =
    '<svg viewBox="0.0 441.0 360.0 1.0" ><path transform="translate(0.0, 441.0)" d="M 0 0 L 360 0" fill="none" stroke="#bcbcbc" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_r93ljg =
    '<svg viewBox="0.0 477.0 360.0 1.0" ><path transform="translate(0.0, 477.0)" d="M 0 0 L 360 0" fill="none" stroke="#bcbcbc" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_u8pgk =
    '<svg viewBox="0.0 190.0 360.0 1.0" ><path transform="translate(0.0, 190.0)" d="M 0 0 L 360 0" fill="none" stroke="#bcbcbc" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_mg5yy6 =
    '<svg viewBox="0.0 155.0 360.0 1.0" ><path transform="translate(0.0, 155.0)" d="M 0 0 L 360 0" fill="none" stroke="#bcbcbc" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
