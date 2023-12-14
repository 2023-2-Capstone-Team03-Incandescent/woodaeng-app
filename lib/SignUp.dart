import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'game_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

var emailCheck;

void getEmailCheck(String email) async {
  String url = "https://www.woodaeng.kro.kr/auth/checkEmail/$email ";
  var response = await http.get(Uri.parse(url),);
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String responseBody = response.body;

  emailCheck = responseBody;
}


void SignUpToast() {
  Fluttertoast.showToast(
    msg: '회원가입 성공',
    fontSize: 15,
    backgroundColor: Colors.grey,
    textColor: Colors.white,
  );
}

void SignUpFailToast() {
  Fluttertoast.showToast(
    msg: '회원가입 실패',
    fontSize: 15,
    backgroundColor: Colors.grey,
    textColor: Colors.white,
  );
}

class SignUp extends StatefulWidget {
  SignUp({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // 데이터 전송 관련
  final _emailTextEditController = TextEditingController();
  final _passwordTextEditController = TextEditingController();
  final _passwordCheckTextEditController = TextEditingController();
  final _nicknameTextEditController = TextEditingController();

  var password;
  var passwordCheck;
  var nickname;
  var confirmPassword = '';
  int check = 0;



  void dispose() {
    _emailTextEditController.dispose();
    _passwordTextEditController.dispose();
    _nicknameTextEditController.dispose();
  }

    Future<int> postSignUpRequest(String email, String password,
        String nickname) async {
      var response = await http.post(
        Uri.parse('https://www.woodaeng.kro.kr/auth/signup'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "email": email,
          "password": password,
          "nickname": nickname,
        }),
      );

      return response.statusCode;
    }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[

          // 회원가입 글자
          Pinned.fromPins(
            Pin(size: 73.0, middle: 0.5),
            Pin(size: 23.0, start: 78.0),
            child: Text(
              '회원가입',
              style: TextStyle(
                fontFamily: 'TmoneyRoundWindRegular',
                fontSize: 19,
                color: const Color(0xff191919),
              ),
              softWrap: false,
            ),
          ),

          // 이메일 입력
          Pinned.fromPins(
            Pin(size: 250.0, start: 10.0),
            Pin(size: 41.0, middle: 0.2521),
            child: TextField(
              controller: _emailTextEditController,
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
              onChanged: (text) {
                print(text);
              },
            ),
          ),


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

          // 비밀번호 입력
          Pinned.fromPins(
            Pin(start: 10.0, end: 10.0),
            Pin(size: 45.0, middle: 0.3853),
            child: TextField(
              controller: _passwordTextEditController,
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
                hintText: '비밀번호',
                fillColor: const Color(0xfff1f1f5),
                filled: true,
              ),
              style: TextStyle(
                fontFamily: 'TmoneyRoundWindRegular',
                fontSize: 12,
                color: const Color(0xff999999),
              ),
              onChanged: (text) {
                print(text);
              },
              obscureText: true,
            ),
          ),


          // 비밀번호 확인 입력
          Pinned.fromPins(
            Pin(start: 10.0, end: 10.0),
            Pin(size: 41.0, middle: 0.4671),
            child: TextField(
              controller: _passwordCheckTextEditController,
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
                hintText: '비밀번호 확인',
                fillColor: const Color(0xfff1f1f5),
                filled: true,
              ),
              style: TextStyle(
                fontFamily: 'TmoneyRoundWindRegular',
                fontSize: 12,
                color: const Color(0xff999999),
              ),
              obscureText: true,
            ),
          ),


          // 이메일 글자(위)
          Pinned.fromPins(
            Pin(size: 37.0, start: 20.0),
            Pin(size: 15.0, middle: 0.2096),
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
          // 비밀번호 일치 x
          Pinned.fromPins(
            Pin(start: 10.0, end: 10.0),
            Pin(size: 15.0, middle: 0.5076),
            child: Text(
              check == 0
                  ? '' // Display nothing if passwords match or are empty
                  : '비밀번호가 일치하지 않습니다',
              style: TextStyle(
                fontFamily: 'TmoneyRoundWindRegular',
                fontSize: 11,
                color: const Color(0xffff0000), // Red color for error message
              ),
              softWrap: false,
            ),
          ),
          // 비밀번호 글자(위)
          Pinned.fromPins(
            Pin(size: 50.0, start: 20.0),
            Pin(size: 15.0, middle: 0.3344),
            child: Text(
              '비밀번호',
              style: TextStyle(
                fontFamily: 'TmoneyRoundWindRegular',
                fontSize: 13,
                color: const Color(0xff000000),
              ),
              softWrap: false,
            ),
          ),
          // 이메일 중복 확인
          Pinned.fromPins(
            Pin(start: 15.0, end: 16.0),
            Pin(size: 15.0, middle: 0.3006),
            child: Text(
              emailCheck == '1'
                  ? '중복된 이메일입니다.' // Display nothing if passwords match or are empty
                  : emailCheck == '0'
                      ? '사용가능한 이메일입니다.'
                      : '',
              style: TextStyle(
                fontFamily: 'TmoneyRoundWindRegular',
                fontSize: 11,
                color: emailCheck == '1'
                    ? const Color(0xffff0000) // Display nothing if passwords match or are empty
                    : emailCheck == '0'
                    ? Colors.blue
                    : Colors.white,  // Red color for error message
              ),
              softWrap: false,
            ),
          ),


          // 중복확인 버튼
          Pinned.fromPins(
            Pin(size: 112.0, end: 8.0),
            Pin(size: 34.0, middle: 0.2508),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffffa149),
              ),
              onPressed: () {
                setState(() {
                  getEmailCheck(_emailTextEditController.text);
                });
                print(emailCheck);
              },
              child: Text(
                '중복확인',
                style: TextStyle(
                  fontFamily: 'TmoneyRoundWindRegular',
                  fontSize: 12,
                  color: const Color(0xffffffff),
                ),
                softWrap: false,
              ),
            ),
          ),


          // 다음 버튼
          Pinned.fromPins(
            Pin(start: 10.0, end: 10.0),
            Pin(size: 50.0, end: 230.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffffa149),
              ),
              onPressed: () async {
                email = _emailTextEditController.text;
                nickname = _nicknameTextEditController.text;
                password = _passwordTextEditController.text;
                passwordCheck = _passwordCheckTextEditController.text;

                if (password != passwordCheck)
                  {
                    setState(() {
                      check = 1;
                    });

                    print(check);
      }
                else if (password == passwordCheck && emailCheck != '1')
                  {
                    setState(() {
                      check = 0;
                    });

                    int response = await postSignUpRequest(email, password, nickname);


                    if (response == 200)
                    {
                      SignUpToast();
                      Navigator.pushNamed(context, '/SignIn_RegisterProfile');
                    }
                    else if(response == 409)
                    {
                      print(response);
                    }
                  }

              },
              child: Text(
                '다음',
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
    );
  }
}

const String _svg_um2ve0 =
    '<svg viewBox="20.0 20.0 22.0 22.0" ><path transform="translate(14.37, 13.67)" d="M 25.71817779541016 15.20908069610596 L 12.33939838409424 15.20908069610596 L 17.52836418151855 9.946844100952148 C 18.27232360839844 9.118405342102051 18.27232360839844 7.779649257659912 17.52836418151855 6.951211929321289 C 16.78440284729004 6.122774124145508 15.57781314849854 6.122774124145508 14.82760143280029 6.951211929321289 L 6.187658786773682 15.83206748962402 C 5.812552928924561 16.21646308898926 5.624999523162842 16.74003601074219 5.624999523162842 17.31662940979004 L 5.624999523162842 17.3431396484375 C 5.624999523162842 17.91973304748535 5.812552928924561 18.44330596923828 6.187658786773682 18.82770156860352 L 14.82134914398193 27.70855712890625 C 15.57155895233154 28.53699493408203 16.77815246582031 28.53699493408203 17.52210998535156 27.70855712890625 C 18.26607131958008 26.88011741638184 18.26607131958008 25.54136276245117 17.52210998535156 24.71292304992676 L 12.33314609527588 19.45068740844727 L 25.7119255065918 19.45068740844727 C 26.76847457885742 19.45068740844727 27.62496566772461 18.50295448303223 27.62496566772461 17.32988739013672 C 27.63121795654297 16.13693237304688 26.77472496032715 15.20908069610596 25.71817779541016 15.20908069610596 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
