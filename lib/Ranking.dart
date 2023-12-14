import 'dart:convert';

import 'package:adobe_xd/page_link.dart';
import 'package:did_u_c_my_dog/Game.dart';
import 'package:did_u_c_my_dog/Point.dart';
import 'package:did_u_c_my_dog/Profile.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'Point_MapOverlay.dart';
import 'game_data.dart';
import 'package:did_u_c_my_dog/Game.dart';

int ?myRank;
String ?myImage;

class UserRanking {
  int id;
  int rank;
  String? image; // Make 'image' nullable
  String nickname;
  int win_cnt;

  UserRanking({
    required this.id,
    required this.rank,
    required this.image, // 'image' is now nullable
    required this.nickname,
    required this.win_cnt,
  });

  UserRanking.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        rank = json['rank'] ?? 0,
        image = json['image'],
        nickname = json['nickname'] ?? '',
        win_cnt = json['win_cnt'] ?? 0;

  Map<String, dynamic> toJson() => {
    'id': id,
    'rank': rank,
    'image': image,
    'nickname': nickname,
    'win_cnt': win_cnt,
  };
}

List<dynamic> userRankings = [];

void getUserRanking() async {
  String url = "https://www.woodaeng.kro.kr/users/ranking";
  var response = await http.get(Uri.parse(url));
  var statusCode = response.statusCode;

  if (statusCode == 200) {
    List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));

    // Assuming 'userRankings' is the key that holds the list of user rankings
    List<dynamic>? userRankingsData = data;

    if (userRankingsData != null) {
      userRankings = userRankingsData
          .map((userData) => UserRanking.fromJson(userData))
          .toList();

    } else {
      // Handle the case where 'userRankings' is null in the response
      print('Error: User rankings data is null');
    }
  } else {
    // Handle error or unexpected response
    print('Error: $statusCode');
  }
}


void getMyRank() async {
  String url = "https://www.woodaeng.kro.kr/users/myRank";
  var response = await http.get(Uri.parse(url),
      headers: {'accessToken': accessToken});
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String responseBody = utf8.decode(response.bodyBytes);

  myRank = json.decode(response.body);
  print('check2');
}

void getMyImage() async {
  String url = "https://www.woodaeng.kro.kr/users/image";
  var response = await http.get(Uri.parse(url),
      headers: {'accessToken': accessToken});
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  String responseBody = utf8.decode(response.bodyBytes);

  myImage = responseBody;
  print('이미지불러옴');
}





class Ranking extends StatefulWidget {
  Ranking({
    Key? key,
  }) : super(key: key);

  @override
  State<Ranking> createState() => _RankingState();
}

class _RankingState extends State<Ranking> {
  @override
  Widget build(BuildContext context) {
    if(overlayEntryPointMap != null) {
      overlayEntryPointMap!.remove();
      overlayEntryPointMap = null;
    }

      setState(() {
        getUserRanking();
        getMyRank();
        getMyImage();

      });


    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Stack(
          children: <Widget>[
            Pinned.fromPins(
              Pin(start: 0.0, end: -0.5),
              Pin(size: 64.0, end: 0.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    color: const Color(0xffffffff),
                    margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.5, 0.0),
                  ),
                  Pinned.fromPins(
                    Pin(start: 0.5, end: 0.0),
                    Pin(size: 1.0, start: 0.5),
                    child: SvgPicture.string(
                      _svg_rpaipl,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Align(
                    alignment: Alignment(-0.272, 1.0),
                    child: SizedBox(
                      width: 28.0,
                      height: 13.0,
                      child: Text(
                        '포인트',
                        style: TextStyle(
                          fontFamily: 'TmoneyRoundWindRegular',
                          fontSize: 10,
                          color: const Color(0xffc9c9c9),
                        ),
                        textAlign: TextAlign.center,
                        softWrap: false,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.261, 1.0),
                    child: SizedBox(
                      width: 18.0,
                      height: 13.0,
                      child: Text(
                        '게임',
                        style: TextStyle(
                          fontFamily: 'TmoneyRoundWindRegular',
                          fontSize: 10,
                          color: const Color(0xffc9c9c9),
                        ),
                        textAlign: TextAlign.center,
                        softWrap: false,
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 28.0, end: 31.5),
                    Pin(size: 13.0, end: 0.0),
                    child: Text(
                      '프로필',
                      style: TextStyle(
                        fontFamily: 'TmoneyRoundWindRegular',
                        fontSize: 10.5,
                        color: const Color(0xffc9c9c9),
                      ),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 20.0, start: 35.0),
                    Pin(size: 13.0, end: 0.0),
                    child: Text(
                      '랭킹',
                      style: TextStyle(
                        fontFamily: 'TmoneyRoundWindRegular',
                        fontSize: 10,
                        color: const Color(0xffffa149),
                      ),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 40.0, middle: 0.6396),
                    Pin(size: 40.0, start: 6.0),
                    child: PageLink(
                      links: [
                        PageLinkInfo(
                          ease: Curves.linear,
                          duration: 0.3,
                          pageBuilder: () => Game(),
                        ),
                      ],
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: const AssetImage(
                                'assets/images/Game_Unselected_Icon.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 40.0, middle: 0.3588),
                    Pin(size: 40.0, start: 6.0),
                    child: PageLink(
                      links: [
                        PageLinkInfo(
                          ease: Curves.linear,
                          duration: 0.3,
                          pageBuilder: () => Point(),
                        ),
                      ],
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: const AssetImage(
                                'assets/images/Point_Unselected_Icon.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 40.0, end: 25.5),
                    Pin(size: 40.0, start: 6.0),
                    child: PageLink(
                      links: [
                        PageLinkInfo(
                          ease: Curves.linear,
                          duration: 0.3,
                          pageBuilder: () => Profile(),
                        ),
                      ],
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: const AssetImage(
                                'assets/images/Profile_Unselected_Icon.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 40.0, start: 25.0),
                    Pin(size: 40.0, start: 6.0),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage(
                              'assets/images/Rank_Selected_Icon.png'),
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
              Pin(size: 170.0, start: 42.0),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      width: 108.0,
                      height: 123.0,
                      child: Stack(
                        children: <Widget>[
                          Pinned.fromPins(
                            Pin(start: 4.0, end: 4.0),
                            Pin(size: 100.0, start: 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage('$myImage'),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.circular(179.0),
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(start: 0.0, end: 0.0),
                            Pin(size: 18.0, end: 0.0),
                            child: Text(
                              '내 순위 : $myRank위',
                              style: TextStyle(
                                fontFamily: 'TmoneyRoundWindRegular',
                                fontSize: 15,
                                color: const Color(0xff000000),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(size: 34.0, end: 0.0),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffffa450),
                            borderRadius: BorderRadius.circular(25.0),
                            border: Border.all(
                                width: 1.0, color: const Color(0xffffffff)),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xffffa551),
                                offset: Offset(0, 0),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 35.0, start: 30.0),
                          Pin(size: 18.0, middle: 0.5),
                          child: Text(
                            '순위',
                            style: TextStyle(
                              fontFamily: 'TmoneyRoundWindRegular',
                              fontSize: 15,
                              color: const Color(0xffffffff),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Center(
                          child: SizedBox(
                            width: 70.0,
                            height: 18.0,
                            child: Text(
                              '     닉네임',
                              style: TextStyle(
                                fontFamily: 'TmoneyRoundWindRegular',
                                fontSize: 15,
                                color: const Color(0xffffffff),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 72.0, end: 22.0),
                          Pin(size: 18.0, middle: 0.5),
                          child: Text(
                            '승리횟수',
                            style: TextStyle(
                              fontFamily: 'TmoneyRoundWindRegular',
                              fontSize: 15,
                              color: const Color(0xffffffff),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 43.0 + 170.0,
              bottom: 65.0,
              left: 0.0,
              right: 0.0,
              child: ListView.builder(
                itemCount: userRankings.length,
                itemBuilder: (BuildContext context, int index) {
                  return buildRankingItem(userRankings[index]);
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}


Widget buildRankingItem(UserRanking userRanking) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
    padding: EdgeInsets.all(2.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment(-1.0, -0.043),
          child: SizedBox(
            width: 40.0,
            height: 20.0,
            child: Text(
              '${userRanking.rank}등',
              style: TextStyle(
                fontFamily: 'TmoneyRoundWindRegular',
                fontSize: 16.0,
              ),
            ),
          ),
        ),
        SizedBox(width: 45.0),
        Transform.translate(
          offset: Offset(0.0, -7.0),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage('${userRanking.image}'),
              ),
            ),
          ),
        ),
        SizedBox(width: 40.0),
        Expanded(
          child: Text(
            '${userRanking.nickname}',
            style: TextStyle(
              fontFamily: 'TmoneyRoundWindRegular',
              fontSize: 16.0,
            ),
          ),
        ),
        Text(
          '${userRanking.win_cnt}승',
          style: TextStyle(
            fontFamily: 'TmoneyRoundWindRegular',
            fontSize: 12.0,
          ),
        ),
      ],
    ),
  );
}



const String _svg_rpaipl =
    '<svg viewBox="0.5 576.5 360.0 1.0" ><path transform="translate(0.5, 576.55)" d="M 0 0 L 360 0" fill="none" stroke="#bcbcbc" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
