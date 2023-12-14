import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './Profile_Settings_Account_ChangeNum.dart';
import 'package:adobe_xd/page_link.dart';
import './Profile_Settings_Account_ChangePW.dart';
import './Profile_Settings.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Profile_Settings_Account extends StatelessWidget {
  Profile_Settings_Account({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 0.0, end: -0.5),
            Pin(size: 356.0, start: 44.0),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment(-0.609, -0.425),
                  child: SizedBox(
                    width: 59.0,
                    height: 17.0,
                    child: Text(
                      '카카오톡',
                      style: TextStyle(
                        fontFamily: 'TmoneyRoundWindRegular',
                        fontSize: 14,
                        color: const Color(0xff000000),
                      ),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 1.0, middle: 0.3507),
                  child: SvgPicture.string(
                    _svg_pg3116,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Align(
                  alignment: Alignment(-0.625, -0.201),
                  child: SizedBox(
                    width: 46.0,
                    height: 17.0,
                    child: Text(
                      '네이버',
                      style: TextStyle(
                        fontFamily: 'TmoneyRoundWindRegular',
                        fontSize: 14,
                        color: const Color(0xff000000),
                      ),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 1.0, middle: 0.4577),
                  child: SvgPicture.string(
                    _svg_tqba4k,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Align(
                  alignment: Alignment(-0.641, 0.024),
                  child: SizedBox(
                    width: 32.0,
                    height: 17.0,
                    child: Text(
                      '구글',
                      style: TextStyle(
                        fontFamily: 'TmoneyRoundWindRegular',
                        fontSize: 14,
                        color: const Color(0xff000000),
                      ),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 1.0, middle: 0.5648),
                  child: SvgPicture.string(
                    _svg_mq1xx4,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 33.0, start: 12.5),
                  Pin(size: 33.5, middle: 0.514),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage(
                            'assets/images/SignIn_Google_Icon.png'),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(17.0),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 33.0, start: 12.5),
                  Pin(size: 32.5, middle: 0.3918),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage(
                            'assets/images/SignIn_Naver_Icon.png'),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(12.5, 88.6),
                  child: Container(
                    width: 33.0,
                    height: 33.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage(
                            'assets/images/SignIn_Kakao_Icon.png'),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 70.0, end: 8.5),
                  Pin(size: 17.0, middle: 0.2876),
                  child: Text(
                    '연결됨 >',
                    style: TextStyle(
                      fontFamily: 'TmoneyRoundWindRegular',
                      fontSize: 14,
                      color: const Color(0xff000000),
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 70.0, end: 8.5),
                  Pin(size: 17.0, middle: 0.41),
                  child: Text(
                    '연결하기 >',
                    style: TextStyle(
                      fontFamily: 'TmoneyRoundWindRegular',
                      fontSize: 14,
                      color: const Color(0xff000000),
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 70.0, end: 8.5),
                  Pin(size: 17.0, middle: 0.5221),
                  child: Text(
                    '연결하기 >',
                    style: TextStyle(
                      fontFamily: 'TmoneyRoundWindRegular',
                      fontSize: 14,
                      color: const Color(0xff000000),
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.5),
                  Pin(size: 40.0, start: 46.0),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        color: const Color(0xffe8e8e8),
                      ),
                      Pinned.fromPins(
                        Pin(size: 65.0, start: 20.0),
                        Pin(size: 18.0, middle: 0.5),
                        child: Text(
                          'SNS 연동',
                          style: TextStyle(
                            fontFamily: 'TmoneyRoundWindRegular',
                            fontSize: 15,
                            color: const Color(0xff000000),
                          ),
                          softWrap: false,
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.5),
                  Pin(size: 40.0, middle: 0.6329),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        color: const Color(0xffe8e8e8),
                      ),
                      Pinned.fromPins(
                        Pin(size: 45.0, start: 20.0),
                        Pin(size: 18.0, middle: 0.5),
                        child: Text(
                          '연락처',
                          style: TextStyle(
                            fontFamily: 'TmoneyRoundWindRegular',
                            fontSize: 15,
                            color: const Color(0xff000000),
                          ),
                          softWrap: false,
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.5),
                  Pin(size: 40.0, end: 38.0),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        color: const Color(0xffe8e8e8),
                      ),
                      Pinned.fromPins(
                        Pin(size: 55.0, start: 20.0),
                        Pin(size: 18.0, middle: 0.5),
                        child: Text(
                          '비밀번호',
                          style: TextStyle(
                            fontFamily: 'TmoneyRoundWindRegular',
                            fontSize: 15,
                            color: const Color(0xff000000),
                          ),
                          softWrap: false,
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 86.0, start: 20.0),
                  Pin(size: 17.0, middle: 0.7404),
                  child: Text(
                    '연결된 연락처',
                    style: TextStyle(
                      fontFamily: 'TmoneyRoundWindRegular',
                      fontSize: 14,
                      color: const Color(0xff000000),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 1.0, middle: 0.7831),
                  child: SvgPicture.string(
                    _svg_h7i7k,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 97.0, end: 6.5),
                  Pin(size: 17.0, middle: 0.7404),
                  child: PageLink(
                    links: [
                      PageLinkInfo(
                        ease: Curves.linear,
                        duration: 0.3,
                        pageBuilder: () => Profile_Settings_Account_ChangeNum(),
                      ),
                    ],
                    child: Text(
                      '01099234491 >',
                      style: TextStyle(
                        fontFamily: 'TmoneyRoundWindRegular',
                        fontSize: 14,
                        color: const Color(0xff000000),
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.5),
                  Pin(size: 38.0, end: 0.0),
                  child: Container(
                    decoration: BoxDecoration(),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 88.0, start: 20.0),
                  Pin(size: 17.0, end: 10.0),
                  child: Text(
                    '비밀번호 변경',
                    style: TextStyle(
                      fontFamily: 'TmoneyRoundWindRegular',
                      fontSize: 14,
                      color: const Color(0xff000000),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 1.0, end: -1.0),
                  child: SvgPicture.string(
                    _svg_byi32,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 11.0, end: 8.5),
                  Pin(size: 17.0, end: 10.0),
                  child: PageLink(
                    links: [
                      PageLinkInfo(
                        ease: Curves.linear,
                        duration: 0.3,
                        pageBuilder: () => Profile_Settings_Account_ChangePW(),
                      ),
                    ],
                    child: Text(
                      '>',
                      style: TextStyle(
                        fontFamily: 'TmoneyRoundWindRegular',
                        fontSize: 14,
                        color: const Color(0xff000000),
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 88.0, start: 41.0),
                  Pin(size: 24.0, start: 0.0),
                  child: Text(
                    '계정설정',
                    style: TextStyle(
                      fontFamily: 'TmoneyRoundWindRegular',
                      fontSize: 20,
                      color: const Color(0xff000000),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 18.0, start: 16.0),
                  Pin(size: 18.0, start: 5.0),
                  child: PageLink(
                    links: [
                      PageLinkInfo(
                        ease: Curves.linear,
                        duration: 0.3,
                        pageBuilder: () => Profile_Settings(),
                      ),
                    ],
                    child: SvgPicture.string(
                      _svg_tfy061,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
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

const String _svg_pg3116 =
    '<svg viewBox="0.0 168.5 360.5 1.0" ><path transform="translate(0.0, 168.5)" d="M 0 0 L 360.5 0" fill="none" stroke="#bcbcbc" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_tqba4k =
    '<svg viewBox="0.0 206.5 360.5 1.0" ><path transform="translate(0.0, 206.5)" d="M 0 0 L 360.5 0" fill="none" stroke="#bcbcbc" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_mq1xx4 =
    '<svg viewBox="0.0 244.5 360.5 1.0" ><path transform="translate(0.0, 244.5)" d="M 0 0 L 360.5 0" fill="none" stroke="#bcbcbc" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_h7i7k =
    '<svg viewBox="0.0 322.0 360.5 1.0" ><path transform="translate(0.0, 322.0)" d="M 0 0 L 360.5 0" fill="none" stroke="#bcbcbc" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_byi32 =
    '<svg viewBox="0.0 400.0 360.5 1.0" ><path transform="translate(0.0, 400.0)" d="M 0 0 L 360.5 0" fill="none" stroke="#bcbcbc" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_tfy061 =
    '<svg viewBox="16.0 49.0 18.0 18.0" ><path transform="translate(10.38, 42.67)" d="M 22.06487274169922 13.59468078613281 L 11.11859798431396 13.59468078613281 L 15.36411571502686 9.289215087890625 C 15.97280979156494 8.611400604248047 15.97280979156494 7.516055583953857 15.36411571502686 6.838243007659912 C 14.75541973114014 6.160430431365967 13.76821041107178 6.160430431365967 13.15440082550049 6.838243007659912 L 6.085356712341309 14.10439682006836 C 5.778451919555664 14.41890239715576 5.624999523162842 14.84728050231934 5.624999523162842 15.31903839111328 L 5.624999523162842 15.34072875976562 C 5.624999523162842 15.81248664855957 5.778451919555664 16.24086380004883 6.085356712341309 16.55537033081055 L 13.14928531646729 23.82152366638184 C 13.76309299468994 24.49933624267578 14.75030612945557 24.49933624267578 15.35899829864502 23.82152366638184 C 15.96769428253174 23.14370918273926 15.96769428253174 22.04836463928223 15.35899829864502 21.37055206298828 L 11.11348247528076 17.06508636474609 L 22.05975723266602 17.06508636474609 C 22.92420768737793 17.06508636474609 23.62497329711914 16.2896671295166 23.62497329711914 15.3298864364624 C 23.63008880615234 14.35383224487305 22.9293212890625 13.59468078613281 22.06487274169922 13.59468078613281 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
