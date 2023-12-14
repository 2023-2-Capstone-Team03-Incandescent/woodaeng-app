import 'dart:convert';

import 'package:did_u_c_my_dog/GameIn_GameResultOverlay.dart';
import 'package:did_u_c_my_dog/GameIn_MiniGameIntroOverlay.dart';
import 'package:did_u_c_my_dog/NaverMapTest.dart';
import 'package:did_u_c_my_dog/game_data.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import './Game.dart';
import 'package:http/http.dart'as http;

// PlayerResults type 생성
class PlayerResults {
  int id;
  int team;
  String nickname;
  String image;
  int ball_cnt;
  int gold_cnt;
  int box_cnt;
  int mini_cnt;


  PlayerResults(this.id, this.team, this.nickname, this.image, this.ball_cnt, this.gold_cnt, this.box_cnt, this.mini_cnt);

  PlayerResults.fromJson(Map<String,dynamic> json)
      : id = json['id'],
        team = json['team'],
        nickname = json['nickname'],
        image = json['image'],
        ball_cnt = json['ball_cnt'],
        gold_cnt = json['gold_cnt'],
        box_cnt = json['box_cnt'],
        mini_cnt = json['mini_cnt'];


  Map<String, dynamic> toJson() =>
      {
        'id':id,
        'team':team,
        'ball_cnt':ball_cnt,
        'gold_cnt':gold_cnt,
        'box_cnt':box_cnt,
        'mini_cnt':mini_cnt
      };
}


class Game_In extends StatefulWidget {
  Game_In({Key? key}) : super(key: key);

  @override
  Game_InState createState() => Game_InState();
}

class Game_InState extends State<Game_In> {
  OverlayEntry? overlayEntry;

  StompClient? stompClient;
  final WebSocketChannel channel = IOWebSocketChannel.connect('ws://www.woodaeng.kro.kr/ws');

  // 타이머
  late Timer timer;
  // var minutes = 15;
  // var seconds = 0;

  // 게임 시작 카운트다운
  late int countdown;
  late Timer countdownTimer;
  late int Gseconds;



  void initState() {
    super.initState();
    String? startTime;
    print('check : ${sendBalls[0].ballId}');

    stompClient = StompClient(
      config: StompConfig.sockJS(
        url: 'https://www.woodaeng.kro.kr/ws',
        onConnect: (StompFrame frame) {
          print("연결시도");

          // 게임 준비 수신 구독
          stompClient?.subscribe(
            destination: '/topic/game/ready/${sendGameCode}',
            headers: {},
            callback: (frame) {
              Map<String, dynamic> decodedJson = jsonDecode(frame.body!);
              startTime = decodedJson['startTime'];
              print('(callback)startTime: $startTime');
            },
          );

          // 게임 플레이 수신 구독
          stompClient?.subscribe(
            destination: '/topic/game/play/${sendGameCode}',
            headers: {},
            callback: (frame) {
              Map<String, dynamic> decodedJson = jsonDecode(frame.body!);
              int id = decodedJson['id'];
              int ballId = decodedJson['ballId'];
              int team = decodedJson['team'];
              print('id: $id');
              print('ballId: $ballId');
              print('team: $team');
            },
          );

          // 게임 종료 구독
          stompClient?.subscribe(
            destination: '/topic/game/end/${sendGameCode}',
            headers: {},
            callback: (frame) {
              Map<String, dynamic> decodedJson = jsonDecode(frame.body!);
              int team = decodedJson['team'];
              int teamRScore = decodedJson['teamRScore'];
              List<dynamic> rawList = decodedJson['playerResults'];
              playerResults = rawList.map((dynamic item) => PlayerResults.fromJson(item)).toList();

              print('team: $team');
              print('teamRScore: $teamRScore\n');
              print('id : ${playerResults[0].id} team : ${playerResults[0].team}'
                  'ball_cnt: ${playerResults[0].ball_cnt} gold_cnt : ${playerResults[0].gold_cnt}'
                  'box_cnt : ${playerResults[0].box_cnt} mini_cnt : ${playerResults[0].mini_cnt}\n');

              print('id : ${playerResults[1].id} team : ${playerResults[1].team}'
                  'ball_cnt: ${playerResults[1].ball_cnt} gold_cnt : ${playerResults[1].gold_cnt}'
                  'box_cnt : ${playerResults[1].box_cnt} mini_cnt : ${playerResults[1].mini_cnt}\n');

              print('id : ${playerResults[2].id} team : ${playerResults[2].team}'
                  'ball_cnt: ${playerResults[2].ball_cnt} gold_cnt : ${playerResults[2].gold_cnt}'
                  'box_cnt : ${playerResults[2].box_cnt} mini_cnt : ${playerResults[2].mini_cnt}\n');

              print('id : ${playerResults[3].id} team : ${playerResults[3].team}'
                  'ball_cnt: ${playerResults[3].ball_cnt} gold_cnt : ${playerResults[3].gold_cnt}'
                  'box_cnt : ${playerResults[3].box_cnt} mini_cnt : ${playerResults[3].mini_cnt}\n');

              print('id : ${playerResults[4].id} team : ${playerResults[4].team}'
                  'ball_cnt: ${playerResults[4].ball_cnt} gold_cnt : ${playerResults[4].gold_cnt}'
                  'box_cnt : ${playerResults[4].box_cnt} mini_cnt : ${playerResults[4].mini_cnt}\n');

              print('id : ${playerResults[5].id} team : ${playerResults[5].team}'
                  'ball_cnt: ${playerResults[5].ball_cnt} gold_cnt : ${playerResults[5].gold_cnt}'
                  'box_cnt : ${playerResults[5].box_cnt} mini_cnt : ${playerResults[5].mini_cnt}\n');

              // ball_cnt
              red_player0_ballScore = playerResults[0].ball_cnt;
              red_player1_ballScore = playerResults[1].ball_cnt;
              red_player2_ballScore = playerResults[2].ball_cnt;
              blue_player0_ballScore = playerResults[3].ball_cnt;
              blue_player1_ballScore = playerResults[4].ball_cnt;
              blue_player2_ballScore = playerResults[5].ball_cnt;

              // gold_cnt
              red_player0_goldScore = playerResults[0].gold_cnt;
              red_player1_goldScore = playerResults[1].gold_cnt;
              red_player2_goldScore = playerResults[2].gold_cnt;
              blue_player0_goldScore = playerResults[3].gold_cnt;
              blue_player1_goldScore = playerResults[4].gold_cnt;
              blue_player2_goldScore = playerResults[5].gold_cnt;

              // box_cnt
              red_player0_randomBoxScore = playerResults[0].box_cnt;
              red_player1_randomBoxScore = playerResults[1].box_cnt;
              red_player2_randomBoxScore = playerResults[2].box_cnt;
              blue_player0_randomBoxScore = playerResults[3].box_cnt;
              blue_player1_randomBoxScore = playerResults[4].box_cnt;
              blue_player2_randomBoxScore = playerResults[5].box_cnt;

              // mini_cnt
              red_player0_miniGameScore = playerResults[0].mini_cnt;
              red_player1_miniGameScore = playerResults[1].mini_cnt;
              red_player2_miniGameScore = playerResults[2].mini_cnt;
              blue_player0_miniGameScore = playerResults[3].mini_cnt;
              blue_player1_miniGameScore = playerResults[4].mini_cnt;
              blue_player2_miniGameScore = playerResults[5].mini_cnt;

            },
          );


        },
        beforeConnect: () async {
          print('waiting to connect...');
          await Future.delayed(const Duration(milliseconds: 200));
          print('connecting...');
        },
        onWebSocketError: (dynamic error) => print(error.toString()),
      ),
    );
    stompClient?.activate();

    print(stompClient?.isActive);

    Future.delayed(Duration(seconds: 5), () {
       postTeamData(id, team);
      Future.delayed(Duration(seconds: 1), () {
        print('(outside)startTime: $startTime');
        DateTime receivedTime = DateTime.parse(startTime!);
        Duration difference = receivedTime.difference(DateTime.now());
        Gseconds = difference.inSeconds;
        print('second: $Gseconds');
        countdown = Gseconds;
        startCountdown();
      });
    });


  }

  // 게임 준비 송신
  void postTeamData(int id, int team) {
    stompClient?.send(
      destination: '/app/game/ready/${sendGameCode}',
      body: json.encode({
        "id": id,
        "team": team,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
    print("게임 준비 데이터 송신완료");
  }



// 타이머
  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          if (minutes > 0) {
            minutes--;
            seconds = 59;
          } else {
            Future.delayed(Duration(seconds: 1), () {
              GameResultOverlay(context);
            });
            timer.cancel(); // Stop the timer
          }
        }

      });
    });
  }

// 게임 시작 카운트다운 5초 오버레이
  void startCountdown() {
    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      CountdownOverlay();
      if (countdown == 0) {
        timer.cancel();
        overlayEntry!.remove();
        startTimer(); // 카운트다운 끝나면 오버레이 끄고 원래 타이머 돌아가게 호출한당
      } else {
        setState(() {
          countdown--;
          overlayEntry?.markNeedsBuild(); // 이건 오버레이 계속 덮어 그리는 거
        });
      }
    });
  }

  //게임 시작 카운트다운 오버레이 화면 구성 (크기 조절 해도 돼)
  void CountdownOverlay() {
    if (overlayEntry == null) {
      double centerX = MediaQuery.of(context).size.width / 2;
      double centerY = MediaQuery.of(context).size.height / 2;

      overlayEntry = OverlayEntry(
          builder: (context) =>
              Stack(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      // 배경 선형 그라디언트 빨<->파 배경 해놨던 거
                      // Container(
                      //   decoration: BoxDecoration(
                      //     gradient: LinearGradient(
                      //       begin: Alignment(0.0, -1.0),
                      //       end: Alignment(0.0, 1.0),
                      //       colors: [
                      //         const Color(0xffffdee9),
                      //         const Color(0xffc5f4ff)
                      //       ],
                      //       stops: [0.0, 1.0],
                      //     ),
                      //   ),
                      // ),
                      Pinned.fromPins(
                        Pin(start: 26.0, end: 26.0),
                        Pin(size: 212.0, middle: 0.5),
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
                                    blurRadius: 30,
                                  ),
                                ],
                              ),
                              margin: EdgeInsets.fromLTRB(6.0, 0.0, 3.0, 0.0),
                            ),
                            Pinned.fromPins(
                              Pin(start: 0.0, end: 0.0),
                              Pin(size: 37.0, start: 9.0),
                              child: Text(
                                '곧 게임이 시작돼요!',
                                style: TextStyle(
                                    decoration: TextDecoration.none, // 노란밑줄 제거
                                  fontFamily: 'TmoneyRoundWindRegular',
                                  fontSize: 30,
                                  color: const Color(0xffffffff)
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 60.0, middle: 0.5),
                              Pin(size: 120.0, end: 27.0),
                              child: Text(
                                '$countdown',
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontFamily: 'TmoneyRoundWindRegular',
                                  fontSize: 100,
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
                ],
              )
      );
      Overlay.of(context)?.insert(overlayEntry!);
    }
  }


  // 시간 색깔
  Color getTimeTextColor() {
    if (minutes <= 2 && minutes >= 1) {
      return Colors.blue;
    }
    else if (minutes <= 0) {
      return Colors.red;
    }
    else {
      // 기본 색상
      return Colors.white; // 기본 색상으로 변경하십시오.
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
           NaverMapTest(),
          Pinned.fromPins(
            Pin(size: 71.0, end: 9.0),
            Pin(size: 38.0, start: 38.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff86d5f8),
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 71.0, start: 9.0),
            Pin(size: 38.0, start: 39.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffff9595),
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 20.0, start: 47.0),
            Pin(size: 20.0, start: 49.0),
            child: Text(
              '$Ball_red',
              style: TextStyle(
                fontFamily: 'TmoneyRoundWindRegular',
                fontSize: 15,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 20.0, end: 21.0),
            Pin(size: 20.0, start: 49.0),
            child: Text(
              '$Ball_blue',
              style: TextStyle(
                fontFamily: 'TmoneyRoundWindRegular',
                fontSize: 15,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 164.0, middle: 0.5),
            Pin(size: 60.0, start: 26.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffffa149),
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 109.0, middle: 0.494),
            Pin(size: 18.0, start: 34.0),
            child: Text(
              '게임종료까지',
              style: TextStyle(
                fontFamily: 'TmoneyRoundWindRegular',
                fontSize: 15,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 120.0, middle: 0.4961),
            Pin(size: 30.0, start: 52.0),
            child: Text(
              '$minutes분 $seconds초',
              style: TextStyle(
                fontFamily: 'TmoneyRoundWindRegular',
                fontSize: 25,
                color: getTimeTextColor(),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 25.0, start: 16.5),
            Pin(size: 25.8, start: 44.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/Ball_Red.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 25.0, end: 44.5),
            Pin(size: 25.5, start: 44.2),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/Ball_Blue.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void dispose() {
    channel.sink.close();
  }

}
const String _svg_kyldcq =
    '<svg viewBox="180.0 248.0 1.0 203.0" ><path transform="translate(180.0, 248.0)" d="M 0 0 L 0 203" fill="none" stroke="#b2b1b1" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_kyv0ak =
    '<svg viewBox="0.0 0.0 360.0 640.0" ><path  d="M 0 0 L 360 0 L 360 640 L 0 640 L 0 0 Z" fill="#000000" fill-opacity="0.25" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
