import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './Profile_Settings_Account.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Profile_Settings_Account_ChangeNum extends StatelessWidget {
  Profile_Settings_Account_ChangeNum({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 88.0, middle: 0.4963),
            Pin(size: 23.0, start: 83.0),
            child: Text(
              '연락처 변경',
              style: TextStyle(
                fontFamily: 'TmoneyRoundWindRegular',
                fontSize: 19,
                color: const Color(0xff191919),
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 91.0, end: 8.0),
            Pin(size: 34.0, middle: 0.2706),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffffa149),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 13.0, end: 13.0),
                  Pin(size: 14.0, middle: 0.5),
                  child: Text(
                    '인증번호 전송',
                    style: TextStyle(
                      fontFamily: 'TmoneyRoundWindRegular',
                      fontSize: 12,
                      color: const Color(0xffffffff),
                    ),
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 60.0, start: 21.0),
            Pin(size: 15.0, middle: 0.2192),
            child: Text(
              '휴대폰 번호',
              style: TextStyle(
                fontFamily: 'TmoneyRoundWindRegular',
                fontSize: 13,
                color: const Color(0xff000000),
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 10.0, end: 10.0),
            Pin(size: 41.0, middle: 0.3523),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xfff1f1f5),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 204.0, start: 11.0),
                  Pin(size: 14.0, middle: 0.5185),
                  child: Text(
                    '인증번호 입력',
                    style: TextStyle(
                      fontFamily: 'TmoneyRoundWindRegular',
                      fontSize: 12,
                      color: const Color(0xff999999),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 240.0, start: 11.0),
            Pin(size: 41.0, middle: 0.2705),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xfff1f1f5),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 11.0, end: 26.0),
                  Pin(size: 14.0, middle: 0.5185),
                  child: Text(
                    '휴대폰 번호 입력',
                    style: TextStyle(
                      fontFamily: 'TmoneyRoundWindRegular',
                      fontSize: 12,
                      color: const Color(0xff999999),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 10.0, end: 10.0),
            Pin(size: 50.0, middle: 0.4492),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffffa149),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                Align(
                  alignment: Alignment(-0.07, 0.032),
                  child: SizedBox(
                    width: 56.0,
                    height: 19.0,
                    child: Text(
                      '변경하기',
                      style: TextStyle(
                        fontFamily: 'TmoneyRoundWindRegular',
                        fontSize: 16,
                        color: const Color(0xffffffff),
                      ),
                      softWrap: false,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 18.0, start: 16.0),
            Pin(size: 18.0, start: 49.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  ease: Curves.linear,
                  duration: 0.3,
                  pageBuilder: () => Profile_Settings_Account(),
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
    );
  }
}

const String _svg_tfy061 =
    '<svg viewBox="16.0 49.0 18.0 18.0" ><path transform="translate(10.38, 42.67)" d="M 22.06487274169922 13.59468078613281 L 11.11859798431396 13.59468078613281 L 15.36411571502686 9.289215087890625 C 15.97280979156494 8.611400604248047 15.97280979156494 7.516055583953857 15.36411571502686 6.838243007659912 C 14.75541973114014 6.160430431365967 13.76821041107178 6.160430431365967 13.15440082550049 6.838243007659912 L 6.085356712341309 14.10439682006836 C 5.778451919555664 14.41890239715576 5.624999523162842 14.84728050231934 5.624999523162842 15.31903839111328 L 5.624999523162842 15.34072875976562 C 5.624999523162842 15.81248664855957 5.778451919555664 16.24086380004883 6.085356712341309 16.55537033081055 L 13.14928531646729 23.82152366638184 C 13.76309299468994 24.49933624267578 14.75030612945557 24.49933624267578 15.35899829864502 23.82152366638184 C 15.96769428253174 23.14370918273926 15.96769428253174 22.04836463928223 15.35899829864502 21.37055206298828 L 11.11348247528076 17.06508636474609 L 22.05975723266602 17.06508636474609 C 22.92420768737793 17.06508636474609 23.62497329711914 16.2896671295166 23.62497329711914 15.3298864364624 C 23.63008880615234 14.35383224487305 22.9293212890625 13.59468078613281 22.06487274169922 13.59468078613281 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
