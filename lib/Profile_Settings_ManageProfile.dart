import 'package:did_u_c_my_dog/Profile_Settings.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:image_picker/image_picker.dart';
import './Game.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';


class Profile_Settings_ManageProfile extends StatefulWidget {
  Profile_Settings_ManageProfile({Key? key}) : super(key: key);

  @override
  _Profile_Settings_ManageProfile createState() => _Profile_Settings_ManageProfile();
}

@override
class _Profile_Settings_ManageProfile extends State<Profile_Settings_ManageProfile> {

  String selectedGender = '성별';
  String selectedBreed = '견종';
  File? _image;

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
        _image = File(pickedFile.path);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 279.0, middle: 0.7313),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 40.0, start: 0.0),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        color: const Color(0xffe8e8e8),
                      ),
                      Pinned.fromPins(
                        Pin(size: 75.0, start: 20.0),
                        Pin(size: 18.0, middle: 0.5),
                        child: Text(
                          '댕댕이 정보',
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
                  Pin(size: 217.0, start: 47.0),
                  Pin(size: 30.0, middle: 0.3976),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        child: Pinned.fromPins(
                          Pin(size: 170.0, end: 0.0),
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
                                  controller: _dog_nameTextEditController,
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
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(-1.0, 0.067),
                        child: SizedBox(
                          width: 22.0,
                          height: 15.0,
                          child: Text(
                            '이름',
                            style: TextStyle(
                              fontFamily: 'TmoneyRoundWindRegular',
                              fontSize: 13,
                              color: const Color(0xff000000),
                            ),
                            softWrap: false,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 205.0, start: 24.0),
                  Pin(size: 15.0, middle: 0.2424),
                  child: Text(
                    '우리 댕댕이의 정보를 입력해주세요!',
                    style: TextStyle(
                      fontFamily: 'TmoneyRoundWindRegular',
                      fontSize: 13,
                      color: const Color(0xff000000),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 217.0, start: 47.0),
                  Pin(size: 30.0, middle: 0.5984),
                  child: Stack(
                    children: <Widget>[
                      Container(
                          child:Pinned.fromPins(
                            Pin(size: 170.0, end: 0.0),
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
                      ),
                      Align(
                        alignment: Alignment(-1.0, 0.067),
                        child: SizedBox(
                          width: 24.0,
                          height: 15.0,
                          child: Text(
                            '나이',
                            style: TextStyle(
                              fontFamily: 'TmoneyRoundWindRegular',
                              fontSize: 13,
                              color: const Color(0xff000000),
                            ),
                            softWrap: false,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 136.0, start: 45.0),
                  Pin(size: 22.0, middle: 0.8036),
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
                  Pin(size: 22.0, middle: 0.8),
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
                    ],
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 61.0, end: 16.0),
            Pin(size: 18.0, start: 50.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  ease: Curves.linear,
                  duration: 0.3,
                  pageBuilder: () => Profile_Settings(),
                ),
              ],
              child: Text(
                '저장하기',
                style: TextStyle(
                  fontFamily: 'TmoneyRoundWindRegular',
                  fontSize: 15,
                  color: const Color(0xff000000),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 238.0, start: 10.0),
            Pin(size: 61.0, middle: 0.3731),
            child: Stack(
              children: <Widget>[
                Container(
                  child : Pinned.fromPins(
                    Pin(start: 11.0, end: 25.0),
                    Pin(size: 15.0, middle: 0.7234),
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
                  decoration: BoxDecoration(
                    color: const Color(0xfff1f1f5),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                ),
                Pinned.fromPins(
                  Pin(size: 40.0, start: 10.0),
                  Pin(size: 15.0, start: 0.0),
                  child: Text(
                    '닉네임',
                    style: TextStyle(
                      fontFamily: 'TmoneyRoundWindRegular',
                      fontSize: 13,
                      color: const Color(0xff000000),
                    ),
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 40.0, start: 94.0),
            child: Stack(
              children: <Widget>[
                Container(
                  color: const Color(0xffe8e8e8),
                ),
                Pinned.fromPins(
                  Pin(size: 45.0, start: 20.0),
                  Pin(size: 18.0, middle: 0.5),
                  child: Text(
                    '프로필',
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
          Align(
            alignment: Alignment(0.004, -0.503),
            child: SizedBox(
              width: 81.0,
              height: 85.0,
              child: Stack(
                children: <Widget>[
                  GestureDetector(
                    onTap: getImage,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: _image != null
                            ? DecorationImage(
                          image: FileImage(_image!),
                          fit: BoxFit.fill,
                        )
                            : DecorationImage(
                          image: const AssetImage('assets/images/Profile_Image_Sample1.png'),
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
                          image:
                          const AssetImage('assets/images/Camera_Icon.png'),
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
            Pin(size: 72.0, end: 30.0),
            Pin(size: 34.0, middle: 0.396),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffffa149),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                Align(
                  alignment: Alignment(0.04, 0.053),
                  child: SizedBox(
                    width: 50.0,
                    height: 15.0,
                    child: Text(
                      '중복검사',
                      style: TextStyle(
                        fontFamily: 'TmoneyRoundWindRegular',
                        fontSize: 13,
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
            Pin(size: 110.0, start: 45.0),
            Pin(size: 24.0, start: 44.0),
            child: Text(
              '프로필 관리',
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
            Pin(size: 18.0, start: 49.0),
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
    );
  }
}

const String _svg_tfy061 =
    '<svg viewBox="16.0 49.0 18.0 18.0" ><path transform="translate(10.38, 42.67)" d="M 22.06487274169922 13.59468078613281 L 11.11859798431396 13.59468078613281 L 15.36411571502686 9.289215087890625 C 15.97280979156494 8.611400604248047 15.97280979156494 7.516055583953857 15.36411571502686 6.838243007659912 C 14.75541973114014 6.160430431365967 13.76821041107178 6.160430431365967 13.15440082550049 6.838243007659912 L 6.085356712341309 14.10439682006836 C 5.778451919555664 14.41890239715576 5.624999523162842 14.84728050231934 5.624999523162842 15.31903839111328 L 5.624999523162842 15.34072875976562 C 5.624999523162842 15.81248664855957 5.778451919555664 16.24086380004883 6.085356712341309 16.55537033081055 L 13.14928531646729 23.82152366638184 C 13.76309299468994 24.49933624267578 14.75030612945557 24.49933624267578 15.35899829864502 23.82152366638184 C 15.96769428253174 23.14370918273926 15.96769428253174 22.04836463928223 15.35899829864502 21.37055206298828 L 11.11348247528076 17.06508636474609 L 22.05975723266602 17.06508636474609 C 22.92420768737793 17.06508636474609 23.62497329711914 16.2896671295166 23.62497329711914 15.3298864364624 C 23.63008880615234 14.35383224487305 22.9293212890625 13.59468078613281 22.06487274169922 13.59468078613281 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
