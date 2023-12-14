import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'game_data.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_web_auth/flutter_web_auth.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SignIn extends StatefulWidget {
  SignIn({
    Key? key,
  }) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  //flutter_secure_storage 사용을 위한 초기화 작업
  @override
  void initState() {
    super.initState();

    // 비동기로 flutter secure storage 정보를 불러오는 작업
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadStoredTokens();
    });
  }


  // 일반 로그인
  final _emailTextEditController = TextEditingController();
  final _passwordTextEditController = TextEditingController();

  // secure storage
  final storage = new FlutterSecureStorage();


  var email;
  var password;

  void dispose() {
    _emailTextEditController.dispose();
    _passwordTextEditController.dispose();
    super.dispose();
  }

  // 이메일, 비번 JSON 값 전송Future<int> postSignInRequest(String email, String password) async {
  //     var response = await http.post(
  //       Uri.parse('http://www.woodaeng.kro.kr:8080/auth/signin'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json',
  //       },
  //       body: jsonEncode({
  //         "email": email,
  //         "password": password,
  //       }),
  //     );
  //
  //     return response.statusCode;
  //   }
  Future<String> postSignInRequest(String email, String password) async {
    var response = await http.post(
      Uri.parse('https://www.woodaeng.kro.kr/auth/signin'),
      headers: <String, String>{
        'Content-Type': 'application/json'
      },
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );
    String responseBody = utf8.decode(response.bodyBytes);

    Map<String, dynamic> token = jsonDecode(responseBody);

    accessToken = token['accessToken'];
    refreshToken = token['refreshToken'];

    return accessToken;
  }

  // token 값 받기
  Future<void> signIn() async {

    // 고유한 redirect uri
    const APP_REDIRECT_URI = "com.example.didyouseemydog";

    // 백엔드에서 미리 작성된 API 호출
    final url = Uri.parse('https://www.woodaeng.kro.kr/auth/signin=$APP_REDIRECT_URI');

    // 백엔드가 제공한 로그인 페이지에서 로그인 후 callback 데이터 반환
    final result = await FlutterWebAuth.authenticate(
        url: url.toString(), callbackUrlScheme: APP_REDIRECT_URI);

    // 백엔드에서 redirect한 callback 데이터 파싱
    final accessToken = Uri.parse(result).queryParameters['accessToken'];
    final refreshToken = Uri.parse(result).queryParameters['refreshToken'];

    // secure storage 저장
    await storage.write(key: "accessToken", value: accessToken);
    await storage.write(key: "refreshToken", value: refreshToken);

  }


  // 소셜 로그인
  // 카카오
  Future<void> kakaoSignIn() async {
    // 고유한 redirect uri

    // 백엔드에서 미리 작성된 API 호출
    final url = Uri.parse('https://www.woodaeng.kro.kr/oauth2/authorization/kakao');

    // 백엔드가 제공한 로그인 페이지에서 로그인 후 callback 데이터 반환
    final result = await FlutterWebAuth.authenticate(
        url: url.toString(), callbackUrlScheme: 'didyouseemydog://success');

    // 백엔드에서 redirect한 callback 데이터 파싱
    final accessToken = Uri.parse(result).queryParameters['accessToken'];
    final refreshToken = Uri.parse(result).queryParameters['refreshToken'];

    // secure storage 저장
    await storage.write(key: "accessToken", value: accessToken);
    await storage.write(key: "refreshToken", value: refreshToken);

  }

  // 네이버
  Future<void> naverSignIn() async {

    final url = Uri.parse('https://www.woodaeng.kro.kr/oauth2/authorization/naver');

    final result = await FlutterWebAuth.authenticate(
        url: url.toString(), callbackUrlScheme: 'didyouseemydog://success');

    final accessToken = Uri.parse(result).queryParameters['accessToken'];
    final refreshToken = Uri.parse(result).queryParameters['refreshToken'];

    // secure storage 저장
    await storage.write(key: "accessToken", value: accessToken);
    await storage.write(key: "refreshToken", value: refreshToken);

    print(result);

  }

  // 구글
  Future<void> googleSignIn() async {
    final url = Uri.parse('https://www.woodaeng.kro.kr/oauth2/authorization/google');

    final result = await FlutterWebAuth.authenticate(
        url: url.toString(), callbackUrlScheme: 'didyouseemydog://success');

    final accessToken = Uri
        .parse(result)
        .queryParameters['accessToken'];
    final refreshToken = Uri
        .parse(result)
        .queryParameters['refreshToken'];

    // secure storage 저장
    await storage.write(key: "accessToken", value: accessToken);
    await storage.write(key: "refreshToken", value: refreshToken);
  }

// 토큰 검사
  void _loadStoredTokens() async {
    accessToken = (await storage.read(key: "accessToken"))!;
    refreshToken = (await storage.read(key: "refreshToken"))!;

    // access 토큰이 있다면 로그인 시도
    if (accessToken != null) {
      _attemptAutoLogin();
    }
  }

  // 자동 로그인 시도
  void _attemptAutoLogin() async {
    try {
      var response = await http.post(
        Uri.parse('https://www.woodaeng.kro.kr/auth/signin/auto'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "accessToken": accessToken,
        }),
      );

      // 로그인 성공
      if (response.statusCode == 200) {
        Navigator.pushNamed(context, '/Game');
        // 플레이어 데이터 get
        LoginToast(); // 로그인 성공 토스트
      }
      // 로그인 실패(액세스 토큰이 만료되었을 때, 리프레시 토큰을 사용하여 토큰을 갱신)
      else if (response.statusCode == 401) {
        final response = await http.post(
          Uri.parse('https://www.woodaeng.kro.kr/auth/newtk'),
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            "accessToken": accessToken,
            "refreshToken": refreshToken,
          }),
        );
        // refresh 토큰이 유효하다면
          if (response.statusCode == 200) {
            const APP_REDIRECT_URI = "com.example.didyouseemydog";

            // 백엔드에서 미리 작성된 API 호출
            final url = Uri.parse('https://www.woodaeng.kro.kr/auth/newtk=$APP_REDIRECT_URI');

            // 백엔드가 제공한 로그인 페이지에서 로그인 후 callback 데이터 반환
            final result = await FlutterWebAuth.authenticate(
                url: url.toString(), callbackUrlScheme: APP_REDIRECT_URI);

            // 백엔드에서 redirect한 callback 데이터 파싱
            final accessToken = Uri.parse(result).queryParameters['accessToken'];

            // secure storage 저장
            await storage.write(key: "accessToken", value: accessToken);

            // 이제 새 액세스 토큰으로 다시 자동 로그인 시도 가능
            _attemptAutoLogin();
          }
          // refresh 토큰이 유효하지 않다면
          else if (response.statusCode == 401)
          {
            await storage.delete(key: "refreshToken");
          }
      }
    } catch (e) {
      // 오류 처리
      // TODO: 오류 처리
    }
  }

  // 로그인 시 토스트 출력
  void LoginToast() {
    Fluttertoast.showToast(
      msg: '로그인 완료',
      fontSize: 15,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
    );
  }


  @override
  Widget build(BuildContext context) {
    _attemptAutoLogin();
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Stack(
          children: <Widget>[
            // 로그인 글자
            Pinned.fromPins(
              Pin(size: 60.0, middle: 0.5),
              Pin(size: 30.0, start: 78.0),
              child: Text(
                '로그인',
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
              Pin(start: 10.0, end: 10.0),
              Pin(size: 41.0, middle: 0.2287),
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
            Pinned.fromPins(
              Pin(size: 200.0, start: 20),
              Pin(size: 130.0, end: 420),
              child: Text(
                '이메일 입력이 잘못되었습니다.',
                style: TextStyle(
                  fontFamily: 'TmoneyRoundWindRegular',
                  fontSize: 15,
                  color: Colors.white,
                ),
                softWrap: false,
              ),
            ),
            // 로그인 버튼
            Pinned.fromPins(
              Pin(start: 10.0, end: 10.0),
              Pin(size: 50.0, middle: 0.5373),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffffa149),
                ),
                onPressed: () async {
                  email = _emailTextEditController.text;
                  password = _passwordTextEditController.text;
                  // if(email.text == 'test' && password.text == '1234')
                  // {
                  //   flutterToast();
                  //   Navigator.pushNamed(context, '/Game');
                  // }

                 response = await postSignInRequest(email, password);

                  // 로그인 성공
                  if (response != null) {
                    accessToken = response;
                    LoginToast();
                    print("check!!");
                    print(accessToken);
                    Navigator.pushNamed(context, '/Game');
                    // 플레이어 데이터 get
                  }
                  // 로그인 실패
                  else if(response == null)
                  {
                    const APP_REDIRECT_URI = "com.example.didyouseemydog";

                    // 백엔드에서 미리 작성된 API 호출
                    final url = Uri.parse('https://www.woodaeng.kro.kr/auth/signin=$APP_REDIRECT_URI');

                    // 백엔드가 제공한 로그인 페이지에서 로그인 후 callback 데이터 반환
                    final result = await FlutterWebAuth.authenticate(
                        url: url.toString(), callbackUrlScheme: APP_REDIRECT_URI);

                    // 백엔드에서 redirect한 callback 데이터 파싱
                    final error = Uri.parse(result).queryParameters['error'];
                    final errorType = Uri.parse(result).queryParameters['errorType'];

                    if (error == "Authentication failed")
                      {
                        if (errorType == "username")
                          {

                          }
                        else if(errorType == "password")
                          {

                          }
                      }
                  }
                },
                child: Text(
                  '로그인',
                  style: TextStyle(
                    fontFamily: 'TmoneyRoundWindRegular',
                    fontSize: 16,
                    color: const Color(0xffffffff),
                  ),
                  softWrap: false,
                ),
              ),
            ),

            // 로그인 버튼 음영
            // Pinned.fromPins(
            //   Pin(start: 13.0, end: 13.0),
            //   Pin(size: 31.0, middle: 0.5583),
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: const Color(0x1affa149),
            //       borderRadius: BorderRadius.circular(16.0),
            //     ),
            //   ),
            // ),


            // 간편 로그인 - 구글
            Pinned.fromPins(
              Pin(size: 33.0, middle: 0.7613),
              Pin(size: 33.0, end: 26.5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: GestureDetector(
                  onTap: () {
                    googleSignIn();
                    _loadStoredTokens();
                  },
                  child: Image.asset('assets/images/SignIn_Google_Icon.png',
                    width: 33.0,
                    height: 33.0,
                  ),
                ),
              ),
            ),

            // 간편 로그인 - 네이버
            Pinned.fromPins(
              Pin(size: 33.0, middle: 0.6318),
              Pin(size: 33.0, end: 26.5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: GestureDetector(
                  onTap: () {
                    naverSignIn();
                    _loadStoredTokens();
                    //Navigator.pushNamed(context, '/Game');
                  },
                  child: Image.asset('assets/images/SignIn_Naver_Icon.png',
                    width: 33.0,
                    height: 33.0,
                  ),
                ),
              ),
            ),

            // 간편 로그인 - 카카오
            Pinned.fromPins(
              Pin(size: 33.0, middle: 0.5053),
              Pin(size: 33.0, end: 26.5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/Game');
                    kakaoSignIn();
                    // 플레이어 데이터 get
                    _loadStoredTokens();
                  },
                  child: Image.asset('assets/images/SignIn_Kakao_Icon.png',
                  ),
                ),
              ),
            ),

            // 간편로그인 글자
            Pinned.fromPins(
              Pin(size: 60.0, middle: 0.2476),
              Pin(size: 16.0, end: 38.0),
              child: Text(
                '간편로그인',
                style: TextStyle(
                  fontFamily: 'TmoneyRoundWindRegular',
                  fontSize: 12,
                  color: const Color(0xFF000000),
                ),
                softWrap: false,
              ),
            ),

            // 아이디 찾기 글자
            Align(
              alignment: Alignment(-0.584, 0.33),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/FindID');
                },
                child: Text(
                  '아이디 찾기',
                  style: TextStyle(
                    fontFamily: 'TmoneyRoundWindRegular',
                    fontSize: 12,
                    color: const Color(0xff191919),
                  ),
                  softWrap: false,
                ),
              ),
            ),

            // 비밀번호 찾기 글자
            Align(
              alignment: Alignment(0.0, 0.33),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/FindPW');
                },
                child: Text(
                  '비밀번호 찾기',
                  style: TextStyle(
                    fontFamily: 'TmoneyRoundWindRegular',
                    fontSize: 12,
                    color: const Color(0xff191919),
                  ),
                  softWrap: false,
                ),
              ),
            ),

            // 회원가입 글자
            Align(
              alignment: Alignment(0.514, 0.33),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/SignUp');
                },
                child: Text(
                  '회원가입',
                  style: TextStyle(
                    fontFamily: 'TmoneyRoundWindRegular',
                    fontSize: 12,
                    color: const Color(0xff191919),
                  ),
                  softWrap: false,
                ),
              ),
            ),

            // 구분바 1
            Align(
              alignment: Alignment(-0.256, 0.323),
              child: SizedBox(
                width: 1.0,
                height: 20.0,
                child: SvgPicture.string(
                  _svg_qpnuzu,
                  allowDrawingOutsideViewBox: true,
                ),
              ),
            ),

            // 구분바 2
            Align(
              alignment: Alignment(0.262, 0.326),
              child: SizedBox(
                width: 1.0,
                height: 20.0,
                child: SvgPicture.string(
                  _svg_lcnog,
                  allowDrawingOutsideViewBox: true,
                ),
              ),
            ),

            // 정체불명 1
            Pinned.fromPins(
              Pin(start: 10.5, end: 9.5),
              Pin(size: 1.0, end: 75.0),
              child: SvgPicture.string(
                _svg_vmvgkc,
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
            ),

            // 정체불명 2
            Pinned.fromPins(
              Pin(start: 10.0, end: 10.0),
              Pin(size: 41.0, middle: 0.3356),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xfff1f1f5),
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),

            // 비밀번호 입력
            Pinned.fromPins(
              Pin(start: 10.0, end: 10.0),
              Pin(size: 41.0, middle: 0.3435),
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
                  hintText: '비밀번호 입력',
                  fillColor: const Color(0xfff1f1f5),
                  filled: true,
                ),
                obscureText: true,
                style: TextStyle(
                  fontFamily: 'TmoneyRoundWindRegular',
                  fontSize: 12,
                  color: const Color(0xff999999),
                ),
                onChanged: (text) {
                  print(text);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const String _svg_um2ve0 =
    '<svg viewBox="20.0 20.0 22.0 22.0" ><path transform="translate(14.37, 13.67)" d="M 25.71817779541016 15.20908069610596 L 12.33939838409424 15.20908069610596 L 17.52836418151855 9.946844100952148 C 18.27232360839844 9.118405342102051 18.27232360839844 7.779649257659912 17.52836418151855 6.951211929321289 C 16.78440284729004 6.122774124145508 15.57781314849854 6.122774124145508 14.82760143280029 6.951211929321289 L 6.187658786773682 15.83206748962402 C 5.812552928924561 16.21646308898926 5.624999523162842 16.74003601074219 5.624999523162842 17.31662940979004 L 5.624999523162842 17.3431396484375 C 5.624999523162842 17.91973304748535 5.812552928924561 18.44330596923828 6.187658786773682 18.82770156860352 L 14.82134914398193 27.70855712890625 C 15.57155895233154 28.53699493408203 16.77815246582031 28.53699493408203 17.52210998535156 27.70855712890625 C 18.26607131958008 26.88011741638184 18.26607131958008 25.54136276245117 17.52210998535156 24.71292304992676 L 12.33314609527588 19.45068740844727 L 25.7119255065918 19.45068740844727 C 26.76847457885742 19.45068740844727 27.62496566772461 18.50295448303223 27.62496566772461 17.32988739013672 C 27.63121795654297 16.13693237304688 26.77472496032715 15.20908069610596 25.71817779541016 15.20908069610596 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_eea =
    '<svg viewBox="13.0 265.0 18.0 18.0" ><path transform="translate(9.63, 261.63)" d="M 12.375 3.375000238418579 C 7.403364658355713 3.375000238418579 3.375000238418579 7.403364658355713 3.375000238418579 12.375 C 3.375000238418579 17.34663391113281 7.403364658355713 21.375 12.375 21.375 C 17.34663391113281 21.375 21.375 17.34663391113281 21.375 12.375 C 21.375 7.403363704681396 17.34663391113281 3.375000238418579 12.375 3.375000238418579 Z M 16.98317337036133 9.887018203735352 L 11.19807624816895 15.69807624816895 C 11.19807624816895 15.69807624816895 11.19807624816895 15.69807624816895 11.19374942779541 15.69807624816895 C 11.12019157409668 15.77163505554199 10.9211540222168 15.93605709075928 10.69182682037354 15.93605709075928 C 10.52740383148193 15.93605709075928 10.34134578704834 15.84519195556641 10.18557643890381 15.68942356109619 L 7.76249885559082 13.26634502410889 C 7.693267822265625 13.19711589813232 7.693267822265625 13.088942527771 7.76249885559082 13.0197114944458 L 8.53269100189209 12.2495174407959 C 8.567306518554688 12.21490287780762 8.610575675964355 12.19759464263916 8.65384578704834 12.19759464263916 C 8.697113990783691 12.19759464263916 8.740384101867676 12.21490287780762 8.774998664855957 12.2495174407959 L 10.69615268707275 14.17067432403564 L 15.97499942779541 8.852883338928223 C 16.00961494445801 8.818268775939941 16.05288314819336 8.800960540771484 16.09615325927734 8.800960540771484 C 16.09615325927734 8.800960540771484 16.09615325927734 8.800960540771484 16.09615325927734 8.800960540771484 C 16.14374732971191 8.800960540771484 16.1870174407959 8.818267822265625 16.21730422973633 8.852883338928223 L 16.97451591491699 9.63605785369873 C 17.05240249633789 9.709614753723145 17.05240249633789 9.817788124084473 16.98317337036133 9.887018203735352 Z" fill="#ffa149" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_qpnuzu =
    '<svg viewBox="133.5 410.0 1.0 20.0" ><path transform="translate(133.5, 410.0)" d="M 0 0 L 0 20" fill="none" stroke="#bcbcbc" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_lcnog =
    '<svg viewBox="226.5 411.0 1.0 20.0" ><path transform="translate(226.5, 411.0)" d="M 0 0 L 0 20" fill="none" stroke="#bcbcbc" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_vmvgkc =
    '<svg viewBox="10.5 564.0 340.0 1.0" ><path transform="translate(10.5, 564.0)" d="M 0 0 L 340 0" fill="none" stroke="#bcbcbc" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';