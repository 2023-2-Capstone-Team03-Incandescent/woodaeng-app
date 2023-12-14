import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:dio/dio.dart' as dio;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import './Game.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io' as io;
import 'package:http_parser/http_parser.dart';
import 'game_data.dart';

// Future<int> postProfile(int id, String nickname, MultipartFile image,
//     String dog_name, int dog_age, String dog_breed, int dog_sex) async {
//   var response = await post(
//     Uri.parse('https://www.woodaeng.kro.kr/users/profile'),
//     headers: <String, String>{
//       'Content-Type': 'application/json',
//     },
//     body: jsonEncode({
//       "id": id,
//       "nickname": nickname,
//       "dog_name": dog_name,
//       "dog_age": dog_age,
//       "dog_breed": dog_breed,
//       "dog_sex": dog_sex
//     }),
//   );
//
//   print(response.statusCode);
//   return response.statusCode;
// }

/////////////////////

var status;

void SignUpToast() {
  Fluttertoast.showToast(
    msg: '프로필 설정 성공',
    fontSize: 15,
    backgroundColor: Colors.grey,
    textColor: Colors.white,
  );
}

Future<void> updateProfile(String nickname, io.File image,
 String dog_name, int dog_age, String dog_breed, int dog_sex) async {
  final url = 'https://www.woodaeng.kro.kr/users/profile/$email';

  dio.MultipartFile dioFile = await dio.MultipartFile.fromFile(
    image.path,
    contentType: MediaType("image", "jpg"),
  );

  Map<String, dynamic> profileData = {
    "nickname": nickname,
    "dog_name": dog_name,
    "dog_age": dog_age,
    "dog_breed": dog_breed,
    "dog_sex":dog_sex
  };

  FormData formData = FormData.fromMap({
    'profile': jsonEncode(profileData), // Encode profile data as JSON
    'image': dioFile, // Include the MultipartFile for the image
  });


  dio.Dio dioClient = dio.Dio();


  try {
    // final dioResponse = await dioClient.post(url, data: jsonEncode(jsonData),
    // options: Options(headers: {"Content-Type": "application/json"}));
    Response dioResponse = await dioClient.post(
      url,
      data: formData,
      options: Options(
      headers: {
        'Content-Type': 'multipart/form-data',
      }
      ),
    );


    // Get.back();

    print("Dio Response: ${dioResponse.data}");
    status = dioResponse.statusCode;
  } catch (error) {
    print("Error updating profile: $error");
    // Handle error as needed
  }


}

io.File? _image;

class SignIn_RegisterProfile extends StatefulWidget {
  SignIn_RegisterProfile({Key? key}) : super(key: key);

  @override
  _SignIn_RegisterProfileState createState() => _SignIn_RegisterProfileState();
}

@override
class _SignIn_RegisterProfileState extends State<SignIn_RegisterProfile> {
  String selectedGender = '성별';
  String selectedBreed = '견종';

  final _dog_nameTextEditController = TextEditingController();
  final _dog_ageTextEditController = TextEditingController();
  final _nicknameTextEditController = TextEditingController();


  void dispose() {
    _dog_nameTextEditController.dispose();
    _dog_ageTextEditController.dispose();
    _nicknameTextEditController.dispose();
  }

  Future getImage() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = io.File(pickedFile.path);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment(-0.45, 0.059),
            child: Container(
              width: 91.0,
              height: 35.0,
              child: TextField(
                controller: _dog_nameTextEditController,
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
                  hintText: '댕댕이 이름',
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
              ),
            ),
          ),

          Pinned.fromPins(
            Pin(size: 26.0, start: 23.0),
            Pin(size: 15.0, middle: 0.5246),
            child: Text(
              '이름',
              style: TextStyle(
                fontFamily: 'TmoneyRoundWindRegular',
                fontSize: 13,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 142.0, end: 22.0),
            Pin(size: 30.0, middle: 0.5295),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 142.0, end: 22.0),
                  Pin(size: 30.0, middle: 0.4255),
                  child: Stack(
                    children: <Widget>[
                      // 댕댕이 나이 입력
                      Pinned.fromPins(
                        Pin(size: 91.0, end: 0.0),
                        Pin(start: 0.0, end: 0.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xfff1f1f5),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                              child: TextField(
                                controller: _dog_ageTextEditController,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  hintText: '댕댕이 나이',
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
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment(-1.0, 0.067),
                  child: SizedBox(
                    width: 26.0,
                    height: 20.0,
                    child: Text(
                      '나이',
                      style: TextStyle(
                        fontFamily: 'TmoneyRoundWindRegular',
                        fontSize: 13,
                        color: const Color(0xff000000),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment(-0.247, -0.211),
            child: SizedBox(
              width: 182.0,
              height: 34.0,
              child: Stack(
                children: <Widget>[
                  // 닉네임 입력
                  Pinned.fromPins(
                    Pin(start: 6.0, end: -30.0),
                    Pin(size: 37.0, middle: 0.5),
                    child: TextField(
                      controller: _nicknameTextEditController,
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
                        hintText: '다른 사용자에게 보일 이름입니다.',
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
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 41.0, start: 16.0),
            Pin(size: 15.0, middle: 0.3934),
            child: Text(
              '닉네임',
              style: TextStyle(
                fontFamily: 'TmoneyRoundWindRegular',
                fontSize: 13,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 210.0, start: 16.0),
            Pin(size: 17.0, middle: 0.4672),
            child: Text(
              '우리 댕댕이의 정보를 입력해 주세요!',
              style: TextStyle(
                fontFamily: 'TmoneyRoundWindRegular',
                fontSize: 13,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 2.0, end: 2.0),
            Pin(size: 60.0, start: 65.0),
            child: Text(
              '첫 방문을 환영해요!\n우리 댕댕이의 정보를 입력해 주세요.',
              style: TextStyle(
                fontFamily: 'TmoneyRoundWindRegular',
                fontSize: 23,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Align(
            alignment: Alignment(0.0, -0.507),
            child: SizedBox(
              width: 80.0,
              height: 80.0,
              child: Stack(
                children: <Widget>[
                  GestureDetector(
                    onTap: getImage,
                    child: Container(
                      decoration: BoxDecoration(
                        image: _image != null
                            ? DecorationImage(
                          image: FileImage(_image! as io.File),
                          fit: BoxFit.fill,
                        )
                            : DecorationImage(
                          image: const AssetImage('assets/images/Profile_Image_Sample2.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: 25.0,
                      height: 25.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage('assets/images/Camera_Icon.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 136.0, start: 23.0),
            Pin(size: 22.0, middle: 0.6036),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment(-1.0, -0.143),
                  child: SizedBox(
                    width: 26.0,
                    height: 18.0,
                    child: Text(
                      '견종',
                      style: TextStyle(
                        fontFamily: 'TmoneyRoundWindRegular',
                        fontSize: 13,
                        color: const Color(0xff000000),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 80.0, end: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        right: 0,
                        child: SizedBox(
                          width: 81.0,
                          height: 22.0,
                          child: DropdownButton<String>(
                            value: selectedBreed,
                            icon: const Icon(Icons.arrow_drop_down),
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(
                              color: Colors.black,
                              fontFamily: 'TmoneyRoundWindRegular',
                              fontSize: 12,
                            ),
                            underline: Container(
                              height: 3,
                              color: Colors.transparent,
                            ),
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                setState(() {
                                  selectedBreed = newValue;
                                });
                              }
                            },
                            items: <String>[
                              '견종',
                              '닥스훈트',
                              '도베르만',
                              '리트리버',
                              '말티즈',
                              '미니핀',
                              '믹스견',
                              '불독',
                              '비숑',
                              '사모예드',
                              '스피츠',
                              '시바',
                              '웰시코기',
                              '치와와',
                              '포메라니안',
                              '퍼그',
                              '푸들'].map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              },
                            ).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 136.0, end: 28.0),
            Pin(size: 22.0, middle: 0.6036),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment(-1.0, -0.143),
                  child: SizedBox(
                    width: 26.0,
                    height: 18.0,
                    child: Text(
                      '성별',
                      style: TextStyle(
                        fontFamily: 'TmoneyRoundWindRegular',
                        fontSize: 13,
                        color: const Color(0xff000000),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 80.0, end: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child: GestureDetector(
                  onTap: () {
                    // updateProfile(1, '감자아빠', _image as MultipartFile,
                    //     '감자', 10, '말티즈', 1);
                  },
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        right: 0,
                        child: SizedBox(
                          width: 80.0,
                          height: 22.0,
                          child: DropdownButton<String>(
                            value: selectedGender,
                            icon: const Icon(Icons.arrow_drop_down),
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(
                              color: Colors.black,
                              fontFamily: 'TmoneyRoundWindRegular',
                              fontSize: 12,
                            ),
                            underline: Container(
                              height: 2,
                              color: Colors.transparent,
                            ),
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                setState(() {
                                  selectedGender = newValue;
                                });
                              }
                            },
                            items: <String>['성별', '남자', '여자'].map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              },
                            ).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                )],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 10.0, end: 10.0),
            Pin(size: 50.0, middle: 0.7627),
            child: PageLink(
              links: [
                PageLinkInfo(
                  ease: Curves.linear,
                  duration: 0.3,
                  pageBuilder: () => Game(),
                ),
              ],
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffffa149),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.004, 0.0),
                    child: GestureDetector(
                      onTap: () {
                        // Add your onTap logic here
                        updateProfile(_nicknameTextEditController.text, _image!,
                            _dog_nameTextEditController.text, int.parse(_dog_ageTextEditController.text), selectedBreed, selectedGender == '남자' ? 0 : 1);
                        print('check!!');
                        print(status);

                        if(status == 200) {
                          SignUpToast();
                           Navigator.pushNamed(context, '/Game');
                        }
                      },
                      child: SizedBox(
                        width: 75.0,
                        height: 24.0,
                        child: Text(
                          '가입하기',
                          style: TextStyle(
                            fontFamily: 'TmoneyRoundWindRegular',
                            fontSize: 20,
                            color: const Color(0xffffffff),
                          ),
                          softWrap: false,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_wx2a5d =
    '<svg viewBox="143.0 374.0 12.0 11.0" ><path transform="matrix(-1.0, 0.0, 0.0, -1.0, 155.0, 385.0)" d="M 6 0 L 12 11.00000095367432 L 0 11.00000095367432 Z" fill="#2e2e2e" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
