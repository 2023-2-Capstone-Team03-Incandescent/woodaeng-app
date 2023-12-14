import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './Point.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Point_Missions extends StatelessWidget {
  Point_Missions({
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
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => Point(),
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
            Pin(size: 92.0, middle: 0.5),
            Pin(size: 24.0, start: 78.0),
            child: Text(
              '오늘의 미션',
              style: TextStyle(
                fontFamily: 'TmoneyRoundWindRegular',
                fontSize: 20,
                color: const Color(0xff000000),
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 39.0, middle: 0.271),
            Pin(size: 39.0, start: 71.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/Missions_Icon.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_em7ua =
    '<svg viewBox="16.0 30.0 18.0 18.0" ><path transform="translate(10.38, 23.67)" d="M 22.06487274169922 13.59468078613281 L 11.11859798431396 13.59468078613281 L 15.36411571502686 9.289215087890625 C 15.97280979156494 8.611400604248047 15.97280979156494 7.516055583953857 15.36411571502686 6.838243007659912 C 14.75541973114014 6.160430431365967 13.76821041107178 6.160430431365967 13.15440082550049 6.838243007659912 L 6.085356712341309 14.10439682006836 C 5.778451919555664 14.41890239715576 5.624999523162842 14.84728050231934 5.624999523162842 15.31903839111328 L 5.624999523162842 15.34072875976562 C 5.624999523162842 15.81248664855957 5.778451919555664 16.24086380004883 6.085356712341309 16.55537033081055 L 13.14928531646729 23.82152366638184 C 13.76309299468994 24.49933624267578 14.75030612945557 24.49933624267578 15.35899829864502 23.82152366638184 C 15.96769428253174 23.14370918273926 15.96769428253174 22.04836463928223 15.35899829864502 21.37055206298828 L 11.11348247528076 17.06508636474609 L 22.05975723266602 17.06508636474609 C 22.92420768737793 17.06508636474609 23.62497329711914 16.2896671295166 23.62497329711914 15.3298864364624 C 23.63008880615234 14.35383224487305 22.9293212890625 13.59468078613281 22.06487274169922 13.59468078613281 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
