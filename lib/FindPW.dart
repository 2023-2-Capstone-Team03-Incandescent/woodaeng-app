import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FindPW extends StatelessWidget {
  FindPW({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[

          // 이전 버튼
          Pinned.fromPins(
            Pin(size: 18.0, start: 15.0),
            Pin(size: 18.0, start: 35.0),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.string(
                _svg_um2ve0,
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
            ),
          ),

          // 비밀번호 찾기 글자
          Pinned.fromPins(
            Pin(size: 105.0, middle: 0.5),
            Pin(size: 23.0, start: 78.0),
            child: Text(
              '비밀번호 찾기',
              style: TextStyle(
                fontFamily: 'TmoneyRoundWindRegular',
                fontSize: 19,
                color: const Color(0xff191919),
              ),
              softWrap: false,
            ),
          ),

          // 아이디 입력
          Pinned.fromPins(
            Pin(start: 9.0, end: 11.0),
            Pin(size: 41.0, middle: 0.2732),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                hintText: '아이디 입력',
                fillColor: const Color(0xfff1f1f5),
                filled: true,
              ),
              style: TextStyle(
                fontFamily: 'TmoneyRoundWindRegular',
                fontSize: 12,
                color: const Color(0xff999999),
              ),
            ),
          ),


          // 아이디 글자(위)
          Pinned.fromPins(
            Pin(size: 35.0, start: 19.0),
            Pin(size: 15.0, middle: 0.2192),
            child: Text(
              '아이디',
              style: TextStyle(
                fontFamily: 'TmoneyRoundWindRegular',
                fontSize: 13,
                color: const Color(0xff000000),
              ),
              softWrap: false,
            ),
          ),

          // 이메일 입력
          Pinned.fromPins(
            Pin(size: 240.0, start: 10.0),
            Pin(size: 41.0, middle: 0.407),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                hintText: '이메일 입력',
                fillColor: const Color(0xfff1f1f5),
                filled: true,
              ),
              style: TextStyle(
                fontFamily: 'TmoneyRoundWindRegular',
                fontSize: 12,
                color: const Color(0xff999999),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),

          // 인증번호 전송 버튼
          Pinned.fromPins(
            Pin(size: 114.0, end: 9.0),
            Pin(size: 34.0, middle: 0.401),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffffa149),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
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
          ),

          // // 인증번호 전송 버튼 음영
          // Pinned.fromPins(
          //   Pin(size:114.0, end: 9.0),
          //   Pin(size: 34.0, middle: 0.4076),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: const Color(0x1affa149),
          //       borderRadius: BorderRadius.circular(50.0),
          //     ),
          //   ),
          // ),



          // 이메일(위)
          Pinned.fromPins(
            Pin(size: 61.0, start: 20.0),
            Pin(size: 16.0, middle: 0.344),
            child: Text(
              '이메일',
              style: TextStyle(
                fontFamily: 'TmoneyRoundWindRegular',
                fontSize: 13,
                color: const Color(0xff000000),
              ),
              softWrap: false,
            ),
          ),

          Pinned.fromPins(
            Pin(size: 240.0, start: 9.0),
            Pin(size: 41.0, middle: 0.476),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                hintText: '인증번호 입력',
                fillColor: const Color(0xfff1f1f5),
                filled: true,
              ),
              style: TextStyle(
                fontFamily: 'TmoneyRoundWindRegular',
                fontSize: 12,
                color: const Color(0xff999999),
              ),
            ),
          ),
          

          // 확인 버튼
          Pinned.fromPins(
            Pin(size: 114.0, end: 9.0),
            Pin(size: 34.0, middle: 0.476),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffffa149),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                '확인',
                style: TextStyle(
                  fontFamily: 'TmoneyRoundWindRegular',
                  fontSize: 12,
                  color: const Color(0xffffffff),
                ),
                softWrap: false,
              ),
            ),
          ),


          // // 확인 버튼 음영
          // Pinned.fromPins(
          //   Pin(size: 114.0, end: 9.0),
          //   Pin(size: 34.0, middle: 0.486),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: const Color(0x1affa149),
          //       borderRadius: BorderRadius.circular(50.0),
          //     ),
          //   ),
          // ),

          Pinned.fromPins(
            Pin(start: 10.0, end: 10.0),
            Pin(size: 50.0, middle: 0.5814),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffffa149),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                '비밀번호 찾기',
                style: TextStyle(
                  fontFamily: 'TmoneyRoundWindRegular',
                  fontSize: 16,
                  color: const Color(0xffffffff),
                ),
                softWrap: false,
              ),
            ),
          ),

          // // 비밀번호 찾기 버튼 음영
          // Pinned.fromPins(
          //   Pin(start: 13.0, end: 13.0),
          //   Pin(size: 31.0, middle: 0.6059),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: const Color(0x1affa149),
          //       borderRadius: BorderRadius.circular(50.0),
          //     ),
          //   ),
          // ),


        ],
      ),
    );
  }
}

const String _svg_um2ve0 =
    '<svg viewBox="20.0 20.0 22.0 22.0" ><path transform="translate(14.37, 13.67)" d="M 25.71817779541016 15.20908069610596 L 12.33939838409424 15.20908069610596 L 17.52836418151855 9.946844100952148 C 18.27232360839844 9.118405342102051 18.27232360839844 7.779649257659912 17.52836418151855 6.951211929321289 C 16.78440284729004 6.122774124145508 15.57781314849854 6.122774124145508 14.82760143280029 6.951211929321289 L 6.187658786773682 15.83206748962402 C 5.812552928924561 16.21646308898926 5.624999523162842 16.74003601074219 5.624999523162842 17.31662940979004 L 5.624999523162842 17.3431396484375 C 5.624999523162842 17.91973304748535 5.812552928924561 18.44330596923828 6.187658786773682 18.82770156860352 L 14.82134914398193 27.70855712890625 C 15.57155895233154 28.53699493408203 16.77815246582031 28.53699493408203 17.52210998535156 27.70855712890625 C 18.26607131958008 26.88011741638184 18.26607131958008 25.54136276245117 17.52210998535156 24.71292304992676 L 12.33314609527588 19.45068740844727 L 25.7119255065918 19.45068740844727 C 26.76847457885742 19.45068740844727 27.62496566772461 18.50295448303223 27.62496566772461 17.32988739013672 C 27.63121795654297 16.13693237304688 26.77472496032715 15.20908069610596 25.71817779541016 15.20908069610596 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_j36hl =
    '<svg viewBox="20.0 20.0 22.0 22.0" ><path transform="translate(14.38, 13.67)" d="M 25.71817779541016 15.20908069610596 L 12.33939838409424 15.20908069610596 L 17.52836418151855 9.946844100952148 C 18.27232360839844 9.118405342102051 18.27232360839844 7.779649257659912 17.52836418151855 6.951211929321289 C 16.78440284729004 6.122774124145508 15.57781314849854 6.122774124145508 14.82760143280029 6.951211929321289 L 6.187658786773682 15.83206748962402 C 5.812552928924561 16.21646308898926 5.624999523162842 16.74003601074219 5.624999523162842 17.31662940979004 L 5.624999523162842 17.3431396484375 C 5.624999523162842 17.91973304748535 5.812552928924561 18.44330596923828 6.187658786773682 18.82770156860352 L 14.82134914398193 27.70855712890625 C 15.57155895233154 28.53699493408203 16.77815246582031 28.53699493408203 17.52210998535156 27.70855712890625 C 18.26607131958008 26.88011741638184 18.26607131958008 25.54136276245117 17.52210998535156 24.71292304992676 L 12.33314609527588 19.45068740844727 L 25.7119255065918 19.45068740844727 C 26.76847457885742 19.45068740844727 27.62496566772461 18.50295448303223 27.62496566772461 17.32988739013672 C 27.63121795654297 16.13693237304688 26.77472496032715 15.20908069610596 25.71817779541016 15.20908069610596 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
