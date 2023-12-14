import 'dart:async';

import 'package:did_u_c_my_dog/Game_Matching.dart';
import 'package:did_u_c_my_dog/game_data.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'Game_In.dart';

import 'dart:convert';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_frame.dart';


// BallLocation type 생성
class BallLocation {
  int ballId;
  double latitude;
  double longitude;

  BallLocation(this.ballId, this.latitude, this.longitude);

  BallLocation.fromJson(Map<String,dynamic> json)
  : ballId = json['ballId'],
    latitude = json['latitude'],
    longitude = json['longitude'];

  Map<String, dynamic> toJson() =>
      {
        'ballId': ballId,
        'latitude': latitude,
        'longitude': longitude
      };
}


class Game_Matching extends StatefulWidget {
  Game_Matching({Key? key}) : super(key: key);


  @override
  _Splash1State createState() => _Splash1State();

}

class _Splash1State extends State<Game_Matching> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _spinKitController;
  final WebSocketChannel channel = IOWebSocketChannel.connect('ws://www.woodaeng.kro.kr/ws');
  StompClient? stompClient;

  var longitude;
  var latitude;


  @override
  void initState() {
    super.initState();

    getLocation();

    // 로딩 이미지 관련
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );

    _spinKitController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    Future.delayed(Duration(seconds: 2), () {
      _spinKitController.forward();
    });

    Future.delayed(Duration(seconds: 4), () {
      _animationController.forward();
    });



    // STOMP 클라이언트 초기화
    stompClient = StompClient(

      config: StompConfig.sockJS(
        url: 'https://www.woodaeng.kro.kr/ws',
        onConnect: (StompFrame frame) {
          setState(() {});
          print("matching 연결시도");

          // 매칭 수신 구독
          stompClient?.subscribe(
            destination: '/topic/game/matching',
            headers: {},
            callback: (frame) {
              Map<String, dynamic> decodedJson = jsonDecode(frame.body!);
              String gameCode = decodedJson['gameCode'];
              teamRed = decodedJson['teamRed'];
              teamBlue = decodedJson['teamBlue'];
              List<dynamic> rawList = decodedJson['balls'];
              List<BallLocation> balls = rawList.map((dynamic item) => BallLocation.fromJson(item)).toList();

              print('gameCode: $gameCode');
              print('teamRed: $teamRed');
              print('teamBlue: $teamBlue');

              sendGameCode = gameCode;
              sendBalls = balls;

              for(int i=0;i<20;i++){
                print('balls: ${balls[i].ballId}');
                print('latitude: ${balls[i].latitude}');
                print('longitude: ${balls[i].longitude}');
              }

              // 플레이어 팀 설정
              if(teamRed!.contains(id)) {
                team = 0;
                player = teamRed!.indexOf(id);
              }
              else if(teamBlue!.contains(id)) {
                team = 1;
                player = teamBlue!.indexOf(id);
              }
            },
          );

          // 매칭 완료 시 페이지 이동
          Future.delayed(Duration(seconds: 20), () {
            if(teamRed?.length == 3 && teamBlue?.length == 3)
            Navigator.pushNamed(context, '/Game_In');
          });


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

    // 매칭
    Future.delayed(Duration(seconds: 5), () {
      postUserData(25, latitude, longitude);
    });


  }

  void onWebSocketError(dynamic error) {
    print('WebSocket Error: $error');
  }

  void onDisconnect(StompFrame frame) {
    print('Disconnected from STOMP');
  }

  // 매칭 송신
  void postUserData(int id, double latitude, double longitude) {
    stompClient?.send(
      destination: '/app/game/matching',
      body: json.encode(
          {
            "id": id,
            "latitude": latitude,
            "longitude": longitude,
          }
      ),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
    print('전송완료 $latitude $longitude');
  }

  Future<void> getLocation() async {
    Position? position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    this.longitude = position!.longitude;
    this.latitude = position!.latitude;
  }



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // 뒤로가기를 금지하고자 할 때 true를 반환
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.0, -1.0),
                      end: Alignment(0.0, 1.0),
                      colors: [const Color(0xffffdee9), const Color(0xffc5f4ff)],
                      stops: [0.0, 1.0],
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 65.0, end: 65.0),
                  Pin(size: 44.0, middle: 0.6577),
                  child: Text(
                    '주변 댕댕이들을 찾고 있습니다...\n잠시만 기다려주세요.',
                    style: TextStyle(
                      fontFamily: 'TmoneyRoundWindRegular',
                      fontSize: 14,
                      color: const Color(0xff000000),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Center(
                  child: Container(
                    width: 130.0,
                    height: 128.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage('assets/images/WooDaeng_Icon.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned.fill(
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Opacity(
                    opacity: 1.0 - _animationController.value,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage('assets/images/Black.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              left: 50.0,
              right: 58.0,
              top: 365, // test code (원래 285)
              child: AnimatedBuilder(
                animation: _spinKitController,
                builder: (context, child) {
                  return Opacity(
                    opacity: _spinKitController.value,
                    child: SpinKitRing(
                      color: const Color(0xffffa149),
                      size: 180.0,
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _spinKitController.dispose();
    super.dispose();
  }
}

