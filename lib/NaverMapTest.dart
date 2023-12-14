import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:did_u_c_my_dog/GameIn_GetGoldenBall.dart';
import 'package:did_u_c_my_dog/GameIn_ItemSpawnOverlay.dart';
import 'package:did_u_c_my_dog/GameIn_MiniGameIntroOverlay.dart';
import 'package:did_u_c_my_dog/GameIn_RandomBoxRoulette.dart';
import 'package:did_u_c_my_dog/GameIn_Result_Report.dart';
import 'package:did_u_c_my_dog/MiniGame_Intro.dart';
import 'package:did_u_c_my_dog/MiniGame_Quiz_Game.dart';
import 'package:did_u_c_my_dog/MiniGame_Quiz_Intro.dart';
import 'package:did_u_c_my_dog/MiniGame_Quiz_Outro.dart';
import 'package:did_u_c_my_dog/MiniGame_Result.dart';
import 'package:did_u_c_my_dog/MiniGame_Skill_Game.dart';
import 'package:did_u_c_my_dog/MiniGame_Skill_Intro.dart';
import 'package:did_u_c_my_dog/MiniGame_Skill_Outro.dart';
import 'package:did_u_c_my_dog/game_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'Game_In.dart';
import 'package:vibration/vibration.dart';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

File ?imageFile;

StompClient? stompClient;
final WebSocketChannel channel = IOWebSocketChannel.connect('ws://www.woodaeng.kro.kr/ws');

// 미니게임 결과 송신
void minigameResult(int win)
{
  stompClient?.send(
    destination: '/app/game/mini/$sendGameCode',
    body: json.encode({
      "id": id,
      "win": win,
    }),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
  );
  print("win : $win");
}


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initialize();
  runApp(const NaverMapTest());
}

Future<File> urlToFile(String imageUrl) async {
  Directory tempDir = await getTemporaryDirectory();
  String tempPath = tempDir.path;
  File file = new File('$tempPath'+'MarkerImage.png');
  http.Response response = await http.get(Uri.parse('$image_id'));
  await file.writeAsBytes(response.bodyBytes);
  return file;
}

Future<void> _initialize() async {
  await NaverMapSdk.instance.initialize(
    clientId: 'a1z8xa1rz9',
    onAuthFailed: (e) => log("네이버맵 인증오류 : $e", name: "onAuthFailed"),
  );
  imageFile = await urlToFile('$image_id');
}

class NaverMapTest extends StatefulWidget {
  const NaverMapTest({Key? key});

  @override
  State<NaverMapTest> createState() => _NaverMapTestState();
}
class _NaverMapTestState extends State<NaverMapTest> {
  late NaverMapController _mapController;
  OverlayEntry? overlayEntry; // Declare overlayEntry as a field


  void RedTeamGetScore1() {
    if (overlayEntry == null) {
      double centerX = MediaQuery.of(context).size.width / 2;
      double centerY = MediaQuery.of(context).size.height / 2;

      // Display the first image
      OverlayEntry overlayEntry1 = OverlayEntry(
        builder: (context) => Positioned(
          top: centerY - 130,
          left: centerX - 100,
          child: Image.asset('assets/images/RedTeam_GetScore.gif', width: 200, height: 200),
        ),
      );
      Overlay.of(context)?.insert(overlayEntry1);

      // Display the second image on the top-left corner
      OverlayEntry overlayEntry2 = OverlayEntry(
        builder: (context) => Positioned(
          top: 60,
          left: 5,
          child: Image.asset('assets/images/RedTeam_GetScore1OnTop.gif', width: 80, height: 80),
        ),
      );
      Overlay.of(context)?.insert(overlayEntry2);

      // Display the third image on the top-right corner
      OverlayEntry overlayEntry3 = OverlayEntry(
        builder: (context) => Positioned(
          top: 60,
          right: 8,
          child: Image.asset('assets/images/BlueTeam_LoseScore1OnTop.gif', width: 80, height: 80),
        ),
      );
      Overlay.of(context)?.insert(overlayEntry3);

      Future.delayed(Duration(seconds: 5), () {
        overlayEntry1?.remove();
        overlayEntry2?.remove();
        overlayEntry3?.remove();
        overlayEntry = null;
      });
    }
  }

  void BlueTeamGetScore1() {
    if (overlayEntry == null) {
      double centerX = MediaQuery.of(context).size.width / 2;
      double centerY = MediaQuery.of(context).size.height / 2;

      // Display the first image
      OverlayEntry overlayEntry1 = OverlayEntry(
        builder: (context) => Positioned(
          top: centerY - 130,
          left: centerX - 100,
          child: Image.asset('assets/images/BlueTeam_GetScore.gif', width: 200, height: 200),
        ),
      );
      Overlay.of(context)?.insert(overlayEntry1);

      // Display the second image on the top-left corner
      OverlayEntry overlayEntry2 = OverlayEntry(
        builder: (context) => Positioned(
          top: 60,
          left: 5,
          child: Image.asset('assets/images/RedTeam_LoseScore1OnTop.gif', width: 80, height: 80),
        ),
      );
      Overlay.of(context)?.insert(overlayEntry2);

      // Display the third image on the top-right corner
      OverlayEntry overlayEntry3 = OverlayEntry(
        builder: (context) => Positioned(
          top: 60,
          right: 8,
          child: Image.asset('assets/images/BlueTeam_GetScore1OnTop.gif', width: 80, height: 80),
        ),
      );
      Overlay.of(context)?.insert(overlayEntry3);

      Future.delayed(Duration(seconds: 5), () {
        overlayEntry1?.remove();
        overlayEntry2?.remove();
        overlayEntry3?.remove();
        overlayEntry = null;
      });
    }
  }




  // 원판 상태(B0~B19)
  List<String> stateBall = ['Red', 'Red', 'Red', 'Red', 'Red', 'Red', 'Red', 'Red', 'Red', 'Red',
    'Blue','Blue','Blue','Blue','Blue','Blue','Blue','Blue','Blue','Blue'];

  // 시야차단 on(1)/off(0)
  int block = 0;

  // 일반 원판(B0~B19)
  var B0 = NMarker(
    id: 'B0',
    position: NLatLng(sendBalls[0].latitude, sendBalls[0].longitude),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Ball_Red_Shaded.png'),
  );

  var B1 = NMarker(
    id: 'B1',
    position: NLatLng(sendBalls[1].latitude, sendBalls[1].longitude),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Ball_Red_Shaded.png'),
  );


  var B2 = NMarker(
    id: 'B2',
    position: NLatLng(sendBalls[2].latitude, sendBalls[2].longitude),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Ball_Red_Shaded.png'),
  );

  var B3 = NMarker(
    id: 'B3',
    position: NLatLng(sendBalls[3].latitude, sendBalls[3].longitude),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Ball_Red_Shaded.png'),
  );

  var B4 = NMarker(
    id: 'B4',
    position: NLatLng(sendBalls[4].latitude, sendBalls[4].longitude),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Ball_Red_Shaded.png'),
  );

  var B5 = NMarker(
    id: 'B5',
    position: NLatLng(sendBalls[5].latitude, sendBalls[5].longitude),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Ball_Red_Shaded.png'),
  );

  var B6 = NMarker(
    id: 'B6',
    position: NLatLng(sendBalls[6].latitude, sendBalls[6].longitude),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Ball_Red_Shaded.png'),
  );

  var B7 = NMarker(
    id: 'B7',
    position: NLatLng(sendBalls[7].latitude, sendBalls[7].longitude),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Ball_Red_Shaded.png'),
  );

  var B8 = NMarker(
    id: 'B8',
    position: NLatLng(sendBalls[8].latitude, sendBalls[8].longitude),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Ball_Red_Shaded.png'),
  );

  var B9 = NMarker(
    id: 'B9',
    position: NLatLng(sendBalls[9].latitude, sendBalls[9].longitude),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Ball_Red_Shaded.png'),
  );


  // Blue Markers

  var B10 = NMarker(
    id: 'B10',
    position: NLatLng(sendBalls[10].latitude, sendBalls[10].longitude),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Ball_Blue_Shaded.png'),
  );

  var B11 = NMarker(
    id: 'B11',
    position: NLatLng(sendBalls[11].latitude, sendBalls[11].longitude),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Ball_Blue_Shaded.png'),
  );

  var B12 = NMarker(
    id: 'B12',
    position: NLatLng(sendBalls[12].latitude, sendBalls[12].longitude),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Ball_Blue_Shaded.png'),
  );

  var B13 = NMarker(
    id: 'B13',
    position: NLatLng(sendBalls[13].latitude, sendBalls[13].longitude),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Ball_Blue_Shaded.png'),
  );

  var B14 = NMarker(
    id: 'B14',
    position: NLatLng(sendBalls[14].latitude, sendBalls[14].longitude),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Ball_Blue_Shaded.png'),
  );

  var B15 = NMarker(
    id: 'B15',
    position: NLatLng(sendBalls[15].latitude, sendBalls[15].longitude),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Ball_Blue_Shaded.png'),
  );

  var B16 = NMarker(
    id: 'B16',
    position: NLatLng(sendBalls[16].latitude, sendBalls[16].longitude),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Ball_Blue_Shaded.png'),
  );

  var B17 = NMarker(
    id: 'B17',
    position: NLatLng(sendBalls[17].latitude, sendBalls[17].longitude),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Ball_Blue_Shaded.png'),
  );

  var B18 = NMarker(
    id: 'B18',
    position: NLatLng(sendBalls[18].latitude, sendBalls[18].longitude),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Ball_Blue_Shaded.png'),
  );

  var B19 = NMarker(
    id: 'B19',
    position: NLatLng(sendBalls[19].latitude, sendBalls[19].longitude),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Ball_Blue_Shaded.png'),
  );



  // 특수원판(황금 원판)
  var Gold0 = NMarker(
    id: 'Gold0',
    position: NLatLng(0,0),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Ball_Gold_Shaded.png'),
  );

  var Gold1 = NMarker(
    id: 'Gold1',
    position: NLatLng(0, 0),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Ball_Gold_Shaded.png'),
  );

  var Gold2 = NMarker(
    id: 'Gold2',
    position: NLatLng(0, 0),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Ball_Gold_Shaded.png'),
  );

  var Gold3 = NMarker(
    id: 'Gold3',
    position: NLatLng(0, 0),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Ball_Gold_Shaded.png'),
  );

  var Gold4 = NMarker(
    id: 'Gold4',
    position: NLatLng(0, 0),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Ball_Gold_Shaded.png'),
  );

  var Gold5 = NMarker(
    id: 'Gold5',
    position: NLatLng(0, 0),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Ball_Gold_Shaded.png'),
  );

  var Gold6 = NMarker(
    id: 'Gold6',
    position: NLatLng(0, 0),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Ball_Gold_Shaded.png'),
  );

  var Gold7 = NMarker(
    id: 'Gold7',
    position: NLatLng(0, 0),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Ball_Gold_Shaded.png'),
  );

  var Gold8 = NMarker(
    id: 'Gold8',
    position: NLatLng(0, 0),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Ball_Gold_Shaded.png'),
  );

  var Gold9 = NMarker(
    id: 'Gold9',
    position: NLatLng(0, 0),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Ball_Gold_Shaded.png'),
  );



  // 특수원판(랜덤박스)
  var Random0 = NMarker(
    id: 'Random0',
    position: NLatLng(0,0),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Random_Box_Filled_Shaded.png'),
  );

  var Random1 = NMarker(
    id: 'Random1',
    position: NLatLng(0, 0),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Random_Box_Filled_Shaded.png'),
  );


  var Random2 = NMarker(
    id: 'Random2',
    position: NLatLng(0, 0),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Random_Box_Filled_Shaded.png'),
  );


  var Random3 = NMarker(
    id: 'Random3',
    position: NLatLng(0, 0),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Random_Box_Filled_Shaded.png'),
  );


  var Random4 = NMarker(
    id: 'Random4',
    position: NLatLng(0, 0),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Random_Box_Filled_Shaded.png'),
  );


  var Random5 = NMarker(
    id: 'Random5',
    position: NLatLng(0, 0),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Random_Box_Filled_Shaded.png'),
  );


  var Random6 = NMarker(
    id: 'Random6',
    position: NLatLng(0, 0),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Random_Box_Filled_Shaded.png'),
  );


  var Random7 = NMarker(
    id: 'Random7',
    position: NLatLng(0, 0),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Random_Box_Filled_Shaded.png'),
  );


  var Random8 = NMarker(
    id: 'Random8',
    position: NLatLng(0, 0),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Random_Box_Filled_Shaded.png'),
  );

  var Random9 = NMarker(
    id: 'Random9',
    position: NLatLng(0, 0),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Random_Box_Filled_Shaded.png'),
  );




  // 시야 차단용 원판
  var blockB0 = NMarker(
    id: 'blockB0',
    position: NLatLng(sendBalls[0].latitude, sendBalls[0].longitude),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Game_Unselected_Icon.png'),
  );

  var blockB1 = NMarker(
    id: 'blockB1',
    position: NLatLng(sendBalls[1].latitude, sendBalls[1].longitude),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Game_Unselected_Icon.png'),
  );

  var blockB2 = NMarker(
    id: 'blockB2',
    position: NLatLng(sendBalls[2].latitude, sendBalls[2].longitude),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Game_Unselected_Icon.png'),
  );

  var blockB3 = NMarker(
    id: 'blockB3',
    position: NLatLng(sendBalls[3].latitude, sendBalls[3].longitude),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Game_Unselected_Icon.png'),
  );

  var blockB4 = NMarker(
    id: 'blockB4',
    position: NLatLng(sendBalls[4].latitude, sendBalls[4].longitude),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Game_Unselected_Icon.png'),
  );

  var blockB5 = NMarker(
    id: 'blockB5',
    position: NLatLng(sendBalls[5].latitude, sendBalls[5].longitude),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Game_Unselected_Icon.png'),
  );

  var blockB6 = NMarker(
    id: 'blockB6',
    position: NLatLng(sendBalls[6].latitude, sendBalls[6].longitude),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Game_Unselected_Icon.png'),
  );

  var blockB7 = NMarker(
    id: 'blockB7',
    position: NLatLng(sendBalls[7].latitude, sendBalls[7].longitude),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Game_Unselected_Icon.png'),
  );

  var blockB8 = NMarker(
    id: 'blockB8',
    position: NLatLng(sendBalls[8].latitude, sendBalls[8].longitude),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Game_Unselected_Icon.png'),
  );

  var blockB9 = NMarker(
    id: 'blockB9',
    position: NLatLng(sendBalls[9].latitude, sendBalls[9].longitude),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Game_Unselected_Icon.png'),
  );

// Blue Markers

  var blockB10 = NMarker(
    id: 'blockB10',
    position: NLatLng(sendBalls[10].latitude, sendBalls[10].longitude),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Game_Unselected_Icon.png'),
  );

  var blockB11 = NMarker(
    id: 'blockB11',
    position: NLatLng(sendBalls[11].latitude, sendBalls[11].longitude),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Game_Unselected_Icon.png'),
  );

  var blockB12 = NMarker(
    id: 'blockB12',
    position: NLatLng(sendBalls[12].latitude, sendBalls[12].longitude),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Game_Unselected_Icon.png'),
  );

  var blockB13 = NMarker(
    id: 'blockB13',
    position: NLatLng(sendBalls[13].latitude, sendBalls[13].longitude),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Game_Unselected_Icon.png'),
  );

  var blockB14 = NMarker(
    id: 'blockB14',
    position: NLatLng(sendBalls[14].latitude, sendBalls[14].longitude),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Game_Unselected_Icon.png'),
  );

  var blockB15 = NMarker(
    id: 'blockB15',
    position: NLatLng(sendBalls[15].latitude, sendBalls[15].longitude),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Game_Unselected_Icon.png'),
  );

  var blockB16 = NMarker(
    id: 'blockB16',
    position: NLatLng(sendBalls[16].latitude, sendBalls[16].longitude),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Game_Unselected_Icon.png'),
  );

  var blockB17 = NMarker(
    id: 'blockB17',
    position: NLatLng(sendBalls[17].latitude, sendBalls[17].longitude),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Game_Unselected_Icon.png'),
  );

  var blockB18 = NMarker(
    id: 'blockB18',
    position: NLatLng(sendBalls[18].latitude, sendBalls[18].longitude),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Game_Unselected_Icon.png'),
  );

  var blockB19 = NMarker(
    id: 'blockB19',
    position: NLatLng(sendBalls[19].latitude, sendBalls[19].longitude),
    size: Size(25, 25),
    icon: NOverlayImage.fromAssetImage('assets/images/Game_Unselected_Icon.png'),
  );



  @override
  void initState() {
    super.initState();
    _initialize();

    stompClient = StompClient(
      config: StompConfig.sockJS(
        url: 'https://www.woodaeng.kro.kr/ws',
        onConnect: (StompFrame frame) {
          print("연결시도");

          // 원판 상태 수신
          stompClient?.subscribe(
            destination: '/topic/game/play/$sendGameCode',
            headers: {},
            callback: (frame) {
              Map<String, dynamic> decodedJson = jsonDecode(frame.body!);
              int receivedId = decodedJson['id'];
              int receivedTeam = decodedJson['team'];
              int ballId1 = decodedJson['ballId1'];
              int ballId2 = decodedJson['ballId2'];
              int teamRScore = decodedJson['teamRScore'];
              int teamBScore = decodedJson['teamBScore'];
              random = decodedJson['random'];

              print('id: $receivedId');
              print('team: $receivedTeam');
              print('ballId1: $ballId1');
              print('ballId2: $ballId2');
              print('teamRScore: $teamRScore');
              print('teamBScore: $teamBScore');
              print('random: $random');

              // 랜덤박스 먹었을때 오버레이 출력
              if(random >= 2 && random <= 6) GetRandomBox(context);

              // 스코어 갱신(랜덤박스는 13초 딜레이)
              if(random == 3 || random == 5)
                {
                  Future.delayed(Duration(seconds: 13), () {
                    Ball_red = teamRScore;
                    Ball_blue = teamBScore;
                  });
                }
              else
                {
                  Ball_red = teamRScore;
                  Ball_blue = teamBScore;
                }


                // 일반 원판
                if (random == 0) {
                  if (ballId1 == 0) {
                    if (stateBall[ballId1] == "Red") {
                      B0.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId1] = "Blue";
                    } else if (stateBall[ballId1] == "Blue") {
                      B0.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId1] = "Red";
                    }
                  } else if (ballId1 == 1) {
                    if (stateBall[ballId1] == "Red") {
                      B1.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId1] = "Blue";
                    } else if (stateBall[ballId1] == "Blue") {
                      B1.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId1] = "Red";
                    }
                  } else if (ballId1 == 2) {
                    if (stateBall[ballId1] == "Red") {
                      B2.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId1] = "Blue";
                    } else if (stateBall[ballId1] == "Blue") {
                      B2.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId1] = "Red";
                    }
                  } else if (ballId1 == 3) {
                    if (stateBall[ballId1] == "Red") {
                      B3.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId1] = "Blue";
                    } else if (stateBall[ballId1] == "Blue") {
                      B3.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId1] = "Red";
                    }
                  } else if (ballId1 == 4) {
                    if (stateBall[ballId1] == "Red") {
                      B4.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId1] = "Blue";
                    } else if (stateBall[ballId1] == "Blue") {
                      B4.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId1] = "Red";
                    }
                  } else if (ballId1 == 5) {
                    if (stateBall[ballId1] == "Red") {
                      B5.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId1] = "Blue";
                    } else if (stateBall[ballId1] == "Blue") {
                      B5.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId1] = "Red";
                    }
                  } else if (ballId1 == 6) {
                    if (stateBall[ballId1] == "Red") {
                      B6.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId1] = "Blue";
                    } else if (stateBall[ballId1] == "Blue") {
                      B6.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId1] = "Red";
                    }
                  } else if (ballId1 == 7) {
                    if (stateBall[ballId1] == "Red") {
                      B7.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId1] = "Blue";
                    } else if (stateBall[ballId1] == "Blue") {
                      B7.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId1] = "Red";
                    }
                  } else if (ballId1 == 8) {
                    if (stateBall[ballId1] == "Red") {
                      B8.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId1] = "Blue";
                    } else if (stateBall[ballId1] == "Blue") {
                      B8.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId1] = "Red";
                    }
                  } else if (ballId1 == 9) {
                    if (stateBall[ballId1] == "Red") {
                      B9.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId1] = "Blue";
                    } else if (stateBall[ballId1] == "Blue") {
                      B9.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId1] = "Red";
                    }
                  } else if (ballId1 == 10) {
                    if (stateBall[ballId1] == "Red") {
                      B10.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId1] = "Blue";
                    } else if (stateBall[ballId1] == "Blue") {
                      B10.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId1] = "Red";
                    }
                  } else if (ballId1 == 11) {
                    if (stateBall[ballId1] == "Red") {
                      B11.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId1] = "Blue";
                    } else if (stateBall[ballId1] == "Blue") {
                      B11.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId1] = "Red";
                    }
                  } else if (ballId1 == 12) {
                    if (stateBall[ballId1] == "Red") {
                      B12.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId1] = "Blue";
                    } else if (stateBall[ballId1] == "Blue") {
                      B12.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId1] = "Red";
                    }
                  } else if (ballId1 == 13) {
                    if (stateBall[ballId1] == "Red") {
                      B13.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId1] = "Blue";
                    } else if (stateBall[ballId1] == "Blue") {
                      B13.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId1] = "Red";
                    }
                  } else if (ballId1 == 14) {
                    if (stateBall[ballId1] == "Red") {
                      B14.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId1] = "Blue";
                    } else if (stateBall[ballId1] == "Blue") {
                      B14.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId1] = "Red";
                    }
                  } else if (ballId1 == 15) {
                    if (stateBall[ballId1] == "Red") {
                      B15.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId1] = "Blue";
                    } else if (stateBall[ballId1] == "Blue") {
                      B15.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId1] = "Red";
                    }
                  } else if (ballId1 == 16) {
                    if (stateBall[ballId1] == "Red") {
                      B16.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId1] = "Blue";
                    } else if (stateBall[ballId1] == "Blue") {
                      B16.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId1] = "Red";
                    }
                  } else if (ballId1 == 17) {
                    if (stateBall[ballId1] == "Red") {
                      B17.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId1] = "Blue";
                    } else if (stateBall[ballId1] == "Blue") {
                      B17.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId1] = "Red";
                    }
                  } else if (ballId1 == 18) {
                    if (stateBall[ballId1] == "Red") {
                      B18.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId1] = "Blue";
                    } else if (stateBall[ballId1] == "Blue") {
                      B18.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId1] = "Red";
                    }
                  } else if (ballId1 == 19) {
                    if (stateBall[ballId1] == "Red") {
                      B19.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId1] = "Blue";
                    } else if (stateBall[ballId1] == "Blue") {
                      B19.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId1] = "Red";
                    }
                  }
                }
                // 랜덤박스 원판 뒤집기
                else if (random == 3 || random == 5) {
                  Future.delayed(Duration(seconds: 13), () {
                  if (random == 0) {
                    if (ballId1 == 0) {
                      if (stateBall[ballId1] == "Red") {
                        B0.setIcon(NOverlayImage.fromAssetImage(
                            "assets/images/Ball_Blue_Shaded.png"));
                        stateBall[ballId1] = "Blue";
                      } else if (stateBall[ballId1] == "Blue") {
                        B0.setIcon(NOverlayImage.fromAssetImage(
                            "assets/images/Ball_Red_Shaded.png"));
                        stateBall[ballId1] = "Red";
                      }
                    } else if (ballId1 == 1) {
                      if (stateBall[ballId1] == "Red") {
                        B1.setIcon(NOverlayImage.fromAssetImage(
                            "assets/images/Ball_Blue_Shaded.png"));
                        stateBall[ballId1] = "Blue";
                      } else if (stateBall[ballId1] == "Blue") {
                        B1.setIcon(NOverlayImage.fromAssetImage(
                            "assets/images/Ball_Red_Shaded.png"));
                        stateBall[ballId1] = "Red";
                      }
                    } else if (ballId1 == 2) {
                      if (stateBall[ballId1] == "Red") {
                        B2.setIcon(NOverlayImage.fromAssetImage(
                            "assets/images/Ball_Blue_Shaded.png"));
                        stateBall[ballId1] = "Blue";
                      } else if (stateBall[ballId1] == "Blue") {
                        B2.setIcon(NOverlayImage.fromAssetImage(
                            "assets/images/Ball_Red_Shaded.png"));
                        stateBall[ballId1] = "Red";
                      }
                    } else if (ballId1 == 3) {
                      if (stateBall[ballId1] == "Red") {
                        B3.setIcon(NOverlayImage.fromAssetImage(
                            "assets/images/Ball_Blue_Shaded.png"));
                        stateBall[ballId1] = "Blue";
                      } else if (stateBall[ballId1] == "Blue") {
                        B3.setIcon(NOverlayImage.fromAssetImage(
                            "assets/images/Ball_Red_Shaded.png"));
                        stateBall[ballId1] = "Red";
                      }
                    } else if (ballId1 == 4) {
                      if (stateBall[ballId1] == "Red") {
                        B4.setIcon(NOverlayImage.fromAssetImage(
                            "assets/images/Ball_Blue_Shaded.png"));
                        stateBall[ballId1] = "Blue";
                      } else if (stateBall[ballId1] == "Blue") {
                        B4.setIcon(NOverlayImage.fromAssetImage(
                            "assets/images/Ball_Red_Shaded.png"));
                        stateBall[ballId1] = "Red";
                      }
                    } else if (ballId1 == 5) {
                      if (stateBall[ballId1] == "Red") {
                        B5.setIcon(NOverlayImage.fromAssetImage(
                            "assets/images/Ball_Blue_Shaded.png"));
                        stateBall[ballId1] = "Blue";
                      } else if (stateBall[ballId1] == "Blue") {
                        B5.setIcon(NOverlayImage.fromAssetImage(
                            "assets/images/Ball_Red_Shaded.png"));
                        stateBall[ballId1] = "Red";
                      }
                    } else if (ballId1 == 6) {
                      if (stateBall[ballId1] == "Red") {
                        B6.setIcon(NOverlayImage.fromAssetImage(
                            "assets/images/Ball_Blue_Shaded.png"));
                        stateBall[ballId1] = "Blue";
                      } else if (stateBall[ballId1] == "Blue") {
                        B6.setIcon(NOverlayImage.fromAssetImage(
                            "assets/images/Ball_Red_Shaded.png"));
                        stateBall[ballId1] = "Red";
                      }
                    } else if (ballId1 == 7) {
                      if (stateBall[ballId1] == "Red") {
                        B7.setIcon(NOverlayImage.fromAssetImage(
                            "assets/images/Ball_Blue_Shaded.png"));
                        stateBall[ballId1] = "Blue";
                      } else if (stateBall[ballId1] == "Blue") {
                        B7.setIcon(NOverlayImage.fromAssetImage(
                            "assets/images/Ball_Red_Shaded.png"));
                        stateBall[ballId1] = "Red";
                      }
                    } else if (ballId1 == 8) {
                      if (stateBall[ballId1] == "Red") {
                        B8.setIcon(NOverlayImage.fromAssetImage(
                            "assets/images/Ball_Blue_Shaded.png"));
                        stateBall[ballId1] = "Blue";
                      } else if (stateBall[ballId1] == "Blue") {
                        B8.setIcon(NOverlayImage.fromAssetImage(
                            "assets/images/Ball_Red_Shaded.png"));
                        stateBall[ballId1] = "Red";
                      }
                    } else if (ballId1 == 9) {
                      if (stateBall[ballId1] == "Red") {
                        B9.setIcon(NOverlayImage.fromAssetImage(
                            "assets/images/Ball_Blue_Shaded.png"));
                        stateBall[ballId1] = "Blue";
                      } else if (stateBall[ballId1] == "Blue") {
                        B9.setIcon(NOverlayImage.fromAssetImage(
                            "assets/images/Ball_Red_Shaded.png"));
                        stateBall[ballId1] = "Red";
                      }
                    } else if (ballId1 == 10) {
                      if (stateBall[ballId1] == "Red") {
                        B10.setIcon(NOverlayImage.fromAssetImage(
                            "assets/images/Ball_Blue_Shaded.png"));
                        stateBall[ballId1] = "Blue";
                      } else if (stateBall[ballId1] == "Blue") {
                        B10.setIcon(NOverlayImage.fromAssetImage(
                            "assets/images/Ball_Red_Shaded.png"));
                        stateBall[ballId1] = "Red";
                      }
                    } else if (ballId1 == 11) {
                      if (stateBall[ballId1] == "Red") {
                        B11.setIcon(NOverlayImage.fromAssetImage(
                            "assets/images/Ball_Blue_Shaded.png"));
                        stateBall[ballId1] = "Blue";
                      } else if (stateBall[ballId1] == "Blue") {
                        B11.setIcon(NOverlayImage.fromAssetImage(
                            "assets/images/Ball_Red_Shaded.png"));
                        stateBall[ballId1] = "Red";
                      }
                    } else if (ballId1 == 12) {
                      if (stateBall[ballId1] == "Red") {
                        B12.setIcon(NOverlayImage.fromAssetImage(
                            "assets/images/Ball_Blue_Shaded.png"));
                        stateBall[ballId1] = "Blue";
                      } else if (stateBall[ballId1] == "Blue") {
                        B12.setIcon(NOverlayImage.fromAssetImage(
                            "assets/images/Ball_Red_Shaded.png"));
                        stateBall[ballId1] = "Red";
                      }
                    } else if (ballId1 == 13) {
                      if (stateBall[ballId1] == "Red") {
                        B13.setIcon(NOverlayImage.fromAssetImage(
                            "assets/images/Ball_Blue_Shaded.png"));
                        stateBall[ballId1] = "Blue";
                      } else if (stateBall[ballId1] == "Blue") {
                        B13.setIcon(NOverlayImage.fromAssetImage(
                            "assets/images/Ball_Red_Shaded.png"));
                        stateBall[ballId1] = "Red";
                      }
                    } else if (ballId1 == 14) {
                      if (stateBall[ballId1] == "Red") {
                        B14.setIcon(NOverlayImage.fromAssetImage(
                            "assets/images/Ball_Blue_Shaded.png"));
                        stateBall[ballId1] = "Blue";
                      } else if (stateBall[ballId1] == "Blue") {
                        B14.setIcon(NOverlayImage.fromAssetImage(
                            "assets/images/Ball_Red_Shaded.png"));
                        stateBall[ballId1] = "Red";
                      }
                    } else if (ballId1 == 15) {
                      if (stateBall[ballId1] == "Red") {
                        B15.setIcon(NOverlayImage.fromAssetImage(
                            "assets/images/Ball_Blue_Shaded.png"));
                        stateBall[ballId1] = "Blue";
                      } else if (stateBall[ballId1] == "Blue") {
                        B15.setIcon(NOverlayImage.fromAssetImage(
                            "assets/images/Ball_Red_Shaded.png"));
                        stateBall[ballId1] = "Red";
                      }
                    } else if (ballId1 == 16) {
                      if (stateBall[ballId1] == "Red") {
                        B16.setIcon(NOverlayImage.fromAssetImage(
                            "assets/images/Ball_Blue_Shaded.png"));
                        stateBall[ballId1] = "Blue";
                      } else if (stateBall[ballId1] == "Blue") {
                        B16.setIcon(NOverlayImage.fromAssetImage(
                            "assets/images/Ball_Red_Shaded.png"));
                        stateBall[ballId1] = "Red";
                      }
                    } else if (ballId1 == 17) {
                      if (stateBall[ballId1] == "Red") {
                        B17.setIcon(NOverlayImage.fromAssetImage(
                            "assets/images/Ball_Blue_Shaded.png"));
                        stateBall[ballId1] = "Blue";
                      } else if (stateBall[ballId1] == "Blue") {
                        B17.setIcon(NOverlayImage.fromAssetImage(
                            "assets/images/Ball_Red_Shaded.png"));
                        stateBall[ballId1] = "Red";
                      }
                    } else if (ballId1 == 18) {
                      if (stateBall[ballId1] == "Red") {
                        B18.setIcon(NOverlayImage.fromAssetImage(
                            "assets/images/Ball_Blue_Shaded.png"));
                        stateBall[ballId1] = "Blue";
                      } else if (stateBall[ballId1] == "Blue") {
                        B18.setIcon(NOverlayImage.fromAssetImage(
                            "assets/images/Ball_Red_Shaded.png"));
                        stateBall[ballId1] = "Red";
                      }
                    } else if (ballId1 == 19) {
                      if (stateBall[ballId1] == "Red") {
                        B19.setIcon(NOverlayImage.fromAssetImage(
                            "assets/images/Ball_Blue_Shaded.png"));
                        stateBall[ballId1] = "Blue";
                      } else if (stateBall[ballId1] == "Blue") {
                        B19.setIcon(NOverlayImage.fromAssetImage(
                            "assets/images/Ball_Red_Shaded.png"));
                        stateBall[ballId1] = "Red";
                      }
                    }
                    }
                  });
                }
                // 황금 원판(백에서 뒤집으라는 2개 뒤집기)
                else if (random == 1) {
                  // 상대팀 원판 랜덤1
                  if (ballId1 == 0) {
                    if (stateBall[ballId1] == "Red") {
                      B0.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId1] = "Blue";
                    } else if (stateBall[ballId1] == "Blue") {
                      B0.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId1] = "Red";
                    }
                  } else if (ballId1 == 1) {
                    if (stateBall[ballId1] == "Red") {
                      B1.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId1] = "Blue";
                    } else if (stateBall[ballId1] == "Blue") {
                      B1.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId1] = "Red";
                    }
                  } else if (ballId1 == 2) {
                    if (stateBall[ballId1] == "Red") {
                      B2.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId1] = "Blue";
                    } else if (stateBall[ballId1] == "Blue") {
                      B2.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId1] = "Red";
                    }
                  } else if (ballId1 == 3) {
                    if (stateBall[ballId1] == "Red") {
                      B3.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId1] = "Blue";
                    } else if (stateBall[ballId1] == "Blue") {
                      B3.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId1] = "Red";
                    }
                  } else if (ballId1 == 4) {
                    if (stateBall[ballId1] == "Red") {
                      B4.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId1] = "Blue";
                    } else if (stateBall[ballId1] == "Blue") {
                      B4.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId1] = "Red";
                    }
                  } else if (ballId1 == 5) {
                    if (stateBall[ballId1] == "Red") {
                      B5.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId1] = "Blue";
                    } else if (stateBall[ballId1] == "Blue") {
                      B5.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId1] = "Red";
                    }
                  } else if (ballId1 == 6) {
                    if (stateBall[ballId1] == "Red") {
                      B6.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId1] = "Blue";
                    } else if (stateBall[ballId1] == "Blue") {
                      B6.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId1] = "Red";
                    }
                  } else if (ballId1 == 7) {
                    if (stateBall[ballId1] == "Red") {
                      B7.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId1] = "Blue";
                    } else if (stateBall[ballId1] == "Blue") {
                      B7.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId1] = "Red";
                    }
                  } else if (ballId1 == 8) {
                    if (stateBall[ballId1] == "Red") {
                      B8.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId1] = "Blue";
                    } else if (stateBall[ballId1] == "Blue") {
                      B8.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId1] = "Red";
                    }
                  } else if (ballId1 == 9) {
                    if (stateBall[ballId1] == "Red") {
                      B9.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId1] = "Blue";
                    } else if (stateBall[ballId1] == "Blue") {
                      B9.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId1] = "Red";
                    }
                  } else if (ballId1 == 10) {
                    if (stateBall[ballId1] == "Red") {
                      B10.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId1] = "Blue";
                    } else if (stateBall[ballId1] == "Blue") {
                      B10.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId1] = "Red";
                    }
                  } else if (ballId1 == 11) {
                    if (stateBall[ballId1] == "Red") {
                      B11.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId1] = "Blue";
                    } else if (stateBall[ballId1] == "Blue") {
                      B11.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId1] = "Red";
                    }
                  } else if (ballId1 == 12) {
                    if (stateBall[ballId1] == "Red") {
                      B12.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId1] = "Blue";
                    } else if (stateBall[ballId1] == "Blue") {
                      B12.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId1] = "Red";
                    }
                  } else if (ballId1 == 13) {
                    if (stateBall[ballId1] == "Red") {
                      B13.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId1] = "Blue";
                    } else if (stateBall[ballId1] == "Blue") {
                      B13.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId1] = "Red";
                    }
                  } else if (ballId1 == 14) {
                    if (stateBall[ballId1] == "Red") {
                      B14.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId1] = "Blue";
                    } else if (stateBall[ballId1] == "Blue") {
                      B14.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId1] = "Red";
                    }
                  } else if (ballId1 == 15) {
                    if (stateBall[ballId1] == "Red") {
                      B15.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId1] = "Blue";
                    } else if (stateBall[ballId1] == "Blue") {
                      B15.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId1] = "Red";
                    }
                  } else if (ballId1 == 16) {
                    if (stateBall[ballId1] == "Red") {
                      B16.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId1] = "Blue";
                    } else if (stateBall[ballId1] == "Blue") {
                      B16.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId1] = "Red";
                    }
                  } else if (ballId1 == 17) {
                    if (stateBall[ballId1] == "Red") {
                      B17.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId1] = "Blue";
                    } else if (stateBall[ballId1] == "Blue") {
                      B17.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId1] = "Red";
                    }
                  } else if (ballId1 == 18) {
                    if (stateBall[ballId1] == "Red") {
                      B18.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId1] = "Blue";
                    } else if (stateBall[ballId1] == "Blue") {
                      B18.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId1] = "Red";
                    }
                  } else if (ballId1 == 19) {
                    if (stateBall[ballId1] == "Red") {
                      B19.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId1] = "Blue";
                    } else if (stateBall[ballId1] == "Blue") {
                      B19.setIcon(NOverlayImage.fromAssetImage(
                          "assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId1] = "Red";
                    }
                  }


                  // 상대팀 원판 랜덤2
                  if (ballId2 == 0) {
                    if (stateBall[ballId2] == "Red") {
                      B0.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId2] = "Blue";
                    } else if (stateBall[ballId2] == "Blue") {
                      B0.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId2] = "Red";
                    }
                  } else if (ballId2 == 1) {
                    if (stateBall[ballId2] == "Red") {
                      B1.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId2] = "Blue";
                    } else if (stateBall[ballId2] == "Blue") {
                      B1.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId2] = "Red";
                    }
                  } else if (ballId2 == 2) {
                    if (stateBall[ballId2] == "Red") {
                      B2.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId2] = "Blue";
                    } else if (stateBall[ballId2] == "Blue") {
                      B2.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId2] = "Red";
                    }
                  } else if (ballId2 == 3) {
                    if (stateBall[ballId2] == "Red") {
                      B3.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId2] = "Blue";
                    } else if (stateBall[ballId2] == "Blue") {
                      B3.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId2] = "Red";
                    }
                  } else if (ballId2 == 4) {
                    if (stateBall[ballId2] == "Red") {
                      B4.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId2] = "Blue";
                    } else if (stateBall[ballId2] == "Blue") {
                      B4.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId2] = "Red";
                    }
                  } else if (ballId2 == 5) {
                    if (stateBall[ballId2] == "Red") {
                      B5.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId2] = "Blue";
                    } else if (stateBall[ballId2] == "Blue") {
                      B5.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId2] = "Red";
                    }
                  } else if (ballId2 == 6) {
                    if (stateBall[ballId2] == "Red") {
                      B6.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId2] = "Blue";
                    } else if (stateBall[ballId2] == "Blue") {
                      B6.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId2] = "Red";
                    }
                  } else if (ballId2 == 7) {
                    if (stateBall[ballId2] == "Red") {
                      B7.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId2] = "Blue";
                    } else if (stateBall[ballId2] == "Blue") {
                      B7.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId2] = "Red";
                    }
                  } else if (ballId2 == 8) {
                    if (stateBall[ballId2] == "Red") {
                      B8.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId2] = "Blue";
                    } else if (stateBall[ballId2] == "Blue") {
                      B8.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId2] = "Red";
                    }
                  } else if (ballId2 == 9) {
                    if (stateBall[ballId2] == "Red") {
                      B9.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId2] = "Blue";
                    } else if (stateBall[ballId2] == "Blue") {
                      B9.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId2] = "Red";
                    }
                  } else if (ballId2 == 10) {
                    if (stateBall[ballId2] == "Red") {
                      B10.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId2] = "Blue";
                    } else if (stateBall[ballId2] == "Blue") {
                      B10.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId2] = "Red";
                    }
                  } else if (ballId2 == 11) {
                    if (stateBall[ballId2] == "Red") {
                      B11.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId2] = "Blue";
                    } else if (stateBall[ballId2] == "Blue") {
                      B11.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId2] = "Red";
                    }
                  } else if (ballId2 == 12) {
                    if (stateBall[ballId2] == "Red") {
                      B12.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId2] = "Blue";
                    } else if (stateBall[ballId2] == "Blue") {
                      B12.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId2] = "Red";
                    }
                  } else if (ballId2 == 13) {
                    if (stateBall[ballId2] == "Red") {
                      B13.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId2] = "Blue";
                    } else if (stateBall[ballId2] == "Blue") {
                      B13.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId2] = "Red";
                    }
                  } else if (ballId2 == 14) {
                    if (stateBall[ballId2] == "Red") {
                      B14.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId2] = "Blue";
                    } else if (stateBall[ballId2] == "Blue") {
                      B14.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId2] = "Red";
                    }
                  } else if (ballId2 == 15) {
                    if (stateBall[ballId2] == "Red") {
                      B15.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId2] = "Blue";
                    } else if (stateBall[ballId2] == "Blue") {
                      B15.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId2] = "Red";
                    }
                  } else if (ballId2 == 16) {
                    if (stateBall[ballId2] == "Red") {
                      B16.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId2] = "Blue";
                    } else if (stateBall[ballId2] == "Blue") {
                      B16.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId2] = "Red";
                    }
                  } else if (ballId2 == 17) {
                    if (stateBall[ballId2] == "Red") {
                      B17.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId2] = "Blue";
                    } else if (stateBall[ballId2] == "Blue") {
                      B17.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId2] = "Red";
                    }
                  } else if (ballId2 == 18) {
                    if (stateBall[ballId2] == "Red") {
                      B18.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId2] = "Blue";
                    } else if (stateBall[ballId2] == "Blue") {
                      B18.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId2] = "Red";
                    }
                  } else if (ballId2 == 19) {
                    if (stateBall[ballId2] == "Red") {
                      B19.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Blue_Shaded.png"));
                      stateBall[ballId2] = "Blue";
                    } else if (stateBall[ballId2] == "Blue") {
                      B19.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Red_Shaded.png"));
                      stateBall[ballId2] = "Red";
                    }
                  }
                }
                // 시야차단
                else if (random == 2) {
                  // 시야 차단 효과(상대팀)
                  if (receivedTeam != team) block = 1;
                }
                else if (random == 4) {
                  // 포인트 지급
                }
            },
          );

          // 황금원판, 랜덤박스 생성 알림 수신
          stompClient?.subscribe(
            destination: '/topic/game/random/$sendGameCode',
            headers: {},
            callback: (frame) {
              Map<String, dynamic> decodedJson = jsonDecode(frame.body!);
              int ballId = decodedJson['ballId'];
              double latitude = decodedJson['latitude'];
              double longitude = decodedJson['longitude'];

              // print('latitude: $latitude');
              // print('longitude: $longitude');

              // 황금원판 생성
              if(ballId >= 20 && ballId <= 29) {
                print('황금원판 생성!');
                GoldenBallSpawnOverlay(context);
                goldId = ballId;
                if(ballId == 20) Gold0.setPosition(NLatLng(latitude, longitude));
                else if(ballId == 21) Gold1.setPosition(NLatLng(latitude, longitude));
                else if(ballId == 22) Gold2.setPosition(NLatLng(latitude, longitude));
                else if(ballId == 23) Gold3.setPosition(NLatLng(latitude, longitude));
                else if(ballId == 24) Gold4.setPosition(NLatLng(latitude, longitude));
                else if(ballId == 25) Gold5.setPosition(NLatLng(latitude, longitude));
                else if(ballId == 26) Gold6.setPosition(NLatLng(latitude, longitude));
                else if(ballId == 27) Gold7.setPosition(NLatLng(latitude, longitude));
                else if(ballId == 28) Gold8.setPosition(NLatLng(latitude, longitude));
                else if(ballId == 29) Gold9.setPosition(NLatLng(latitude, longitude));
              }
              else if(ballId >=30 && ballId <=39) {
                print('랜덤박스 생성!');
                RandomBoxSpawnOverlay(context);
                randomId = ballId;
                if(ballId == 30) Random0.setPosition(NLatLng(latitude, longitude));
                else if(ballId == 31) Random1.setPosition(NLatLng(latitude, longitude));
                else if(ballId == 32) Random2.setPosition(NLatLng(latitude, longitude));
                else if(ballId == 33) Random3.setPosition(NLatLng(latitude, longitude));
                else if(ballId == 34) Random4.setPosition(NLatLng(latitude, longitude));
                else if(ballId == 35) Random5.setPosition(NLatLng(latitude, longitude));
                else if(ballId == 36) Random6.setPosition(NLatLng(latitude, longitude));
                else if(ballId == 37) Random7.setPosition(NLatLng(latitude, longitude));
                else if(ballId == 38) Random8.setPosition(NLatLng(latitude, longitude));
                else if(ballId == 39) Random9.setPosition(NLatLng(latitude, longitude));
              }

            },
          );

          // 미니게임 수신
          stompClient?.subscribe(
            destination: '/topic/game/location/$sendGameCode',
            headers: {},
            callback: (frame) {
              print('미니게임 수신');
              Map<String, dynamic> decodedJson = jsonDecode(frame.body!);
              String startTime = decodedJson['startTime'];
              int id = decodedJson['id'];
              String myImage = decodedJson['myImage'];
              gameType = decodedJson['gameType'];
              opponentId = decodedJson['opponentId'];
              opponentImage = decodedJson['opponentImage'];
              opponentNick = decodedJson['opponentNick'];
              question = decodedJson['question'];
              option = decodedJson['options'];
              answer = decodedJson['answer'];

              print('startTime: $startTime');
              print('id: $id');
              print('gameType: $gameType');
              print('opponentId: $opponentId');
              print('question: $question');
              print('option: $option');
              print('answer: $answer');

              // 진동 2번
              Vibration.vibrate(duration: 1000);
              Vibration.vibrate(duration: 1000);

              // 미니게임 실행
              MiniGameIntroOverlay(context);

            },
          );

          // 미니게임 결과 수신
          stompClient?.subscribe(
            destination: '/topic/game/mini/$sendGameCode',
            headers: {},
            callback: (frame) {
              Map<String, dynamic> decodedJson = jsonDecode(frame.body!);
              int winnerId = decodedJson['winnerId'];
              String winnerDog = decodedJson['winnerDog'];
              int ballId1 = decodedJson['ballId1'];
              int ballId2 = decodedJson['ballId2'];
              Ball_red = decodedJson['teamRScore'];
              Ball_blue = decodedJson['teamBScore'];

              print('winnerId: $winnerId');
              print('winnerDog: $winnerDog');
              print('ballId1: $ballId1');
              print('ballId2: $ballId2');

              if (ballId1 == 0) {
                if (stateBall[ballId1] == "Red") {
                  B0.setIcon(NOverlayImage.fromAssetImage(
                      "assets/images/Ball_Blue_Shaded.png"));
                  stateBall[ballId1] = "Blue";
                } else if (stateBall[ballId1] == "Blue") {
                  B0.setIcon(NOverlayImage.fromAssetImage(
                      "assets/images/Ball_Red_Shaded.png"));
                  stateBall[ballId1] = "Red";
                }
              } else if (ballId1 == 1) {
                if (stateBall[ballId1] == "Red") {
                  B1.setIcon(NOverlayImage.fromAssetImage(
                      "assets/images/Ball_Blue_Shaded.png"));
                  stateBall[ballId1] = "Blue";
                } else if (stateBall[ballId1] == "Blue") {
                  B1.setIcon(NOverlayImage.fromAssetImage(
                      "assets/images/Ball_Red_Shaded.png"));
                  stateBall[ballId1] = "Red";
                }
              } else if (ballId1 == 2) {
                if (stateBall[ballId1] == "Red") {
                  B2.setIcon(NOverlayImage.fromAssetImage(
                      "assets/images/Ball_Blue_Shaded.png"));
                  stateBall[ballId1] = "Blue";
                } else if (stateBall[ballId1] == "Blue") {
                  B2.setIcon(NOverlayImage.fromAssetImage(
                      "assets/images/Ball_Red_Shaded.png"));
                  stateBall[ballId1] = "Red";
                }
              } else if (ballId1 == 3) {
                if (stateBall[ballId1] == "Red") {
                  B3.setIcon(NOverlayImage.fromAssetImage(
                      "assets/images/Ball_Blue_Shaded.png"));
                  stateBall[ballId1] = "Blue";
                } else if (stateBall[ballId1] == "Blue") {
                  B3.setIcon(NOverlayImage.fromAssetImage(
                      "assets/images/Ball_Red_Shaded.png"));
                  stateBall[ballId1] = "Red";
                }
              } else if (ballId1 == 4) {
                if (stateBall[ballId1] == "Red") {
                  B4.setIcon(NOverlayImage.fromAssetImage(
                      "assets/images/Ball_Blue_Shaded.png"));
                  stateBall[ballId1] = "Blue";
                } else if (stateBall[ballId1] == "Blue") {
                  B4.setIcon(NOverlayImage.fromAssetImage(
                      "assets/images/Ball_Red_Shaded.png"));
                  stateBall[ballId1] = "Red";
                }
              } else if (ballId1 == 5) {
                if (stateBall[ballId1] == "Red") {
                  B5.setIcon(NOverlayImage.fromAssetImage(
                      "assets/images/Ball_Blue_Shaded.png"));
                  stateBall[ballId1] = "Blue";
                } else if (stateBall[ballId1] == "Blue") {
                  B5.setIcon(NOverlayImage.fromAssetImage(
                      "assets/images/Ball_Red_Shaded.png"));
                  stateBall[ballId1] = "Red";
                }
              } else if (ballId1 == 6) {
                if (stateBall[ballId1] == "Red") {
                  B6.setIcon(NOverlayImage.fromAssetImage(
                      "assets/images/Ball_Blue_Shaded.png"));
                  stateBall[ballId1] = "Blue";
                } else if (stateBall[ballId1] == "Blue") {
                  B6.setIcon(NOverlayImage.fromAssetImage(
                      "assets/images/Ball_Red_Shaded.png"));
                  stateBall[ballId1] = "Red";
                }
              } else if (ballId1 == 7) {
                if (stateBall[ballId1] == "Red") {
                  B7.setIcon(NOverlayImage.fromAssetImage(
                      "assets/images/Ball_Blue_Shaded.png"));
                  stateBall[ballId1] = "Blue";
                } else if (stateBall[ballId1] == "Blue") {
                  B7.setIcon(NOverlayImage.fromAssetImage(
                      "assets/images/Ball_Red_Shaded.png"));
                  stateBall[ballId1] = "Red";
                }
              } else if (ballId1 == 8) {
                if (stateBall[ballId1] == "Red") {
                  B8.setIcon(NOverlayImage.fromAssetImage(
                      "assets/images/Ball_Blue_Shaded.png"));
                  stateBall[ballId1] = "Blue";
                } else if (stateBall[ballId1] == "Blue") {
                  B8.setIcon(NOverlayImage.fromAssetImage(
                      "assets/images/Ball_Red_Shaded.png"));
                  stateBall[ballId1] = "Red";
                }
              } else if (ballId1 == 9) {
                if (stateBall[ballId1] == "Red") {
                  B9.setIcon(NOverlayImage.fromAssetImage(
                      "assets/images/Ball_Blue_Shaded.png"));
                  stateBall[ballId1] = "Blue";
                } else if (stateBall[ballId1] == "Blue") {
                  B9.setIcon(NOverlayImage.fromAssetImage(
                      "assets/images/Ball_Red_Shaded.png"));
                  stateBall[ballId1] = "Red";
                }
              } else if (ballId1 == 10) {
                if (stateBall[ballId1] == "Red") {
                  B10.setIcon(NOverlayImage.fromAssetImage(
                      "assets/images/Ball_Blue_Shaded.png"));
                  stateBall[ballId1] = "Blue";
                } else if (stateBall[ballId1] == "Blue") {
                  B10.setIcon(NOverlayImage.fromAssetImage(
                      "assets/images/Ball_Red_Shaded.png"));
                  stateBall[ballId1] = "Red";
                }
              } else if (ballId1 == 11) {
                if (stateBall[ballId1] == "Red") {
                  B11.setIcon(NOverlayImage.fromAssetImage(
                      "assets/images/Ball_Blue_Shaded.png"));
                  stateBall[ballId1] = "Blue";
                } else if (stateBall[ballId1] == "Blue") {
                  B11.setIcon(NOverlayImage.fromAssetImage(
                      "assets/images/Ball_Red_Shaded.png"));
                  stateBall[ballId1] = "Red";
                }
              } else if (ballId1 == 12) {
                if (stateBall[ballId1] == "Red") {
                  B12.setIcon(NOverlayImage.fromAssetImage(
                      "assets/images/Ball_Blue_Shaded.png"));
                  stateBall[ballId1] = "Blue";
                } else if (stateBall[ballId1] == "Blue") {
                  B12.setIcon(NOverlayImage.fromAssetImage(
                      "assets/images/Ball_Red_Shaded.png"));
                  stateBall[ballId1] = "Red";
                }
              } else if (ballId1 == 13) {
                if (stateBall[ballId1] == "Red") {
                  B13.setIcon(NOverlayImage.fromAssetImage(
                      "assets/images/Ball_Blue_Shaded.png"));
                  stateBall[ballId1] = "Blue";
                } else if (stateBall[ballId1] == "Blue") {
                  B13.setIcon(NOverlayImage.fromAssetImage(
                      "assets/images/Ball_Red_Shaded.png"));
                  stateBall[ballId1] = "Red";
                }
              } else if (ballId1 == 14) {
                if (stateBall[ballId1] == "Red") {
                  B14.setIcon(NOverlayImage.fromAssetImage(
                      "assets/images/Ball_Blue_Shaded.png"));
                  stateBall[ballId1] = "Blue";
                } else if (stateBall[ballId1] == "Blue") {
                  B14.setIcon(NOverlayImage.fromAssetImage(
                      "assets/images/Ball_Red_Shaded.png"));
                  stateBall[ballId1] = "Red";
                }
              } else if (ballId1 == 15) {
                if (stateBall[ballId1] == "Red") {
                  B15.setIcon(NOverlayImage.fromAssetImage(
                      "assets/images/Ball_Blue_Shaded.png"));
                  stateBall[ballId1] = "Blue";
                } else if (stateBall[ballId1] == "Blue") {
                  B15.setIcon(NOverlayImage.fromAssetImage(
                      "assets/images/Ball_Red_Shaded.png"));
                  stateBall[ballId1] = "Red";
                }
              } else if (ballId1 == 16) {
                if (stateBall[ballId1] == "Red") {
                  B16.setIcon(NOverlayImage.fromAssetImage(
                      "assets/images/Ball_Blue_Shaded.png"));
                  stateBall[ballId1] = "Blue";
                } else if (stateBall[ballId1] == "Blue") {
                  B16.setIcon(NOverlayImage.fromAssetImage(
                      "assets/images/Ball_Red_Shaded.png"));
                  stateBall[ballId1] = "Red";
                }
              } else if (ballId1 == 17) {
                if (stateBall[ballId1] == "Red") {
                  B17.setIcon(NOverlayImage.fromAssetImage(
                      "assets/images/Ball_Blue_Shaded.png"));
                  stateBall[ballId1] = "Blue";
                } else if (stateBall[ballId1] == "Blue") {
                  B17.setIcon(NOverlayImage.fromAssetImage(
                      "assets/images/Ball_Red_Shaded.png"));
                  stateBall[ballId1] = "Red";
                }
              } else if (ballId1 == 18) {
                if (stateBall[ballId1] == "Red") {
                  B18.setIcon(NOverlayImage.fromAssetImage(
                      "assets/images/Ball_Blue_Shaded.png"));
                  stateBall[ballId1] = "Blue";
                } else if (stateBall[ballId1] == "Blue") {
                  B18.setIcon(NOverlayImage.fromAssetImage(
                      "assets/images/Ball_Red_Shaded.png"));
                  stateBall[ballId1] = "Red";
                }
              } else if (ballId1 == 19) {
                if (stateBall[ballId1] == "Red") {
                  B19.setIcon(NOverlayImage.fromAssetImage(
                      "assets/images/Ball_Blue_Shaded.png"));
                  stateBall[ballId1] = "Blue";
                } else if (stateBall[ballId1] == "Blue") {
                  B19.setIcon(NOverlayImage.fromAssetImage(
                      "assets/images/Ball_Red_Shaded.png"));
                  stateBall[ballId1] = "Red";
                }
              }

              if (ballId2 == 0) {
                if (stateBall[ballId2] == "Red") {
                  B0.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Blue_Shaded.png"));
                  stateBall[ballId2] = "Blue";
                } else if (stateBall[ballId2] == "Blue") {
                  B0.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Red_Shaded.png"));
                  stateBall[ballId2] = "Red";
                }
              } else if (ballId2 == 1) {
                if (stateBall[ballId2] == "Red") {
                  B1.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Blue_Shaded.png"));
                  stateBall[ballId2] = "Blue";
                } else if (stateBall[ballId2] == "Blue") {
                  B1.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Red_Shaded.png"));
                  stateBall[ballId2] = "Red";
                }
              } else if (ballId2 == 2) {
                if (stateBall[ballId2] == "Red") {
                  B2.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Blue_Shaded.png"));
                  stateBall[ballId2] = "Blue";
                } else if (stateBall[ballId2] == "Blue") {
                  B2.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Red_Shaded.png"));
                  stateBall[ballId2] = "Red";
                }
              } else if (ballId2 == 3) {
                if (stateBall[ballId2] == "Red") {
                  B3.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Blue_Shaded.png"));
                  stateBall[ballId2] = "Blue";
                } else if (stateBall[ballId2] == "Blue") {
                  B3.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Red_Shaded.png"));
                  stateBall[ballId2] = "Red";
                }
              } else if (ballId2 == 4) {
                if (stateBall[ballId2] == "Red") {
                  B4.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Blue_Shaded.png"));
                  stateBall[ballId2] = "Blue";
                } else if (stateBall[ballId2] == "Blue") {
                  B4.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Red_Shaded.png"));
                  stateBall[ballId2] = "Red";
                }
              } else if (ballId2 == 5) {
                if (stateBall[ballId2] == "Red") {
                  B5.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Blue_Shaded.png"));
                  stateBall[ballId2] = "Blue";
                } else if (stateBall[ballId2] == "Blue") {
                  B5.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Red_Shaded.png"));
                  stateBall[ballId2] = "Red";
                }
              } else if (ballId2 == 6) {
                if (stateBall[ballId2] == "Red") {
                  B6.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Blue_Shaded.png"));
                  stateBall[ballId2] = "Blue";
                } else if (stateBall[ballId2] == "Blue") {
                  B6.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Red_Shaded.png"));
                  stateBall[ballId2] = "Red";
                }
              } else if (ballId2 == 7) {
                if (stateBall[ballId2] == "Red") {
                  B7.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Blue_Shaded.png"));
                  stateBall[ballId2] = "Blue";
                } else if (stateBall[ballId2] == "Blue") {
                  B7.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Red_Shaded.png"));
                  stateBall[ballId2] = "Red";
                }
              } else if (ballId2 == 8) {
                if (stateBall[ballId2] == "Red") {
                  B8.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Blue_Shaded.png"));
                  stateBall[ballId2] = "Blue";
                } else if (stateBall[ballId2] == "Blue") {
                  B8.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Red_Shaded.png"));
                  stateBall[ballId2] = "Red";
                }
              } else if (ballId2 == 9) {
                if (stateBall[ballId2] == "Red") {
                  B9.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Blue_Shaded.png"));
                  stateBall[ballId2] = "Blue";
                } else if (stateBall[ballId2] == "Blue") {
                  B9.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Red_Shaded.png"));
                  stateBall[ballId2] = "Red";
                }
              } else if (ballId2 == 10) {
                if (stateBall[ballId2] == "Red") {
                  B10.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Blue_Shaded.png"));
                  stateBall[ballId2] = "Blue";
                } else if (stateBall[ballId2] == "Blue") {
                  B10.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Red_Shaded.png"));
                  stateBall[ballId2] = "Red";
                }
              } else if (ballId2 == 11) {
                if (stateBall[ballId2] == "Red") {
                  B11.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Blue_Shaded.png"));
                  stateBall[ballId2] = "Blue";
                } else if (stateBall[ballId2] == "Blue") {
                  B11.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Red_Shaded.png"));
                  stateBall[ballId2] = "Red";
                }
              } else if (ballId2 == 12) {
                if (stateBall[ballId2] == "Red") {
                  B12.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Blue_Shaded.png"));
                  stateBall[ballId2] = "Blue";
                } else if (stateBall[ballId2] == "Blue") {
                  B12.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Red_Shaded.png"));
                  stateBall[ballId2] = "Red";
                }
              } else if (ballId2 == 13) {
                if (stateBall[ballId2] == "Red") {
                  B13.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Blue_Shaded.png"));
                  stateBall[ballId2] = "Blue";
                } else if (stateBall[ballId2] == "Blue") {
                  B13.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Red_Shaded.png"));
                  stateBall[ballId2] = "Red";
                }
              } else if (ballId2 == 14) {
                if (stateBall[ballId2] == "Red") {
                  B14.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Blue_Shaded.png"));
                  stateBall[ballId2] = "Blue";
                } else if (stateBall[ballId2] == "Blue") {
                  B14.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Red_Shaded.png"));
                  stateBall[ballId2] = "Red";
                }
              } else if (ballId2 == 15) {
                if (stateBall[ballId2] == "Red") {
                  B15.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Blue_Shaded.png"));
                  stateBall[ballId2] = "Blue";
                } else if (stateBall[ballId2] == "Blue") {
                  B15.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Red_Shaded.png"));
                  stateBall[ballId2] = "Red";
                }
              } else if (ballId2 == 16) {
                if (stateBall[ballId2] == "Red") {
                  B16.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Blue_Shaded.png"));
                  stateBall[ballId2] = "Blue";
                } else if (stateBall[ballId2] == "Blue") {
                  B16.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Red_Shaded.png"));
                  stateBall[ballId2] = "Red";
                }
              } else if (ballId2 == 17) {
                if (stateBall[ballId2] == "Red") {
                  B17.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Blue_Shaded.png"));
                  stateBall[ballId2] = "Blue";
                } else if (stateBall[ballId2] == "Blue") {
                  B17.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Red_Shaded.png"));
                  stateBall[ballId2] = "Red";
                }
              } else if (ballId2 == 18) {
                if (stateBall[ballId2] == "Red") {
                  B18.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Blue_Shaded.png"));
                  stateBall[ballId2] = "Blue";
                } else if (stateBall[ballId2] == "Blue") {
                  B18.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Red_Shaded.png"));
                  stateBall[ballId2] = "Red";
                }
              } else if (ballId2 == 19) {
                if (stateBall[ballId2] == "Red") {
                  B19.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Blue_Shaded.png"));
                  stateBall[ballId2] = "Blue";
                } else if (stateBall[ballId2] == "Blue") {
                  B19.setIcon(NOverlayImage.fromAssetImage("assets/images/Ball_Red_Shaded.png"));
                  stateBall[ballId2] = "Red";
                }
              }
            }
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


  }

  // 공 뒤집기 송신
  void ballConvert(int ballId) {
    stompClient?.send(
      destination: '/app/game/play/$sendGameCode',
      body: json.encode({
        "id": id,
        "team": team,
        "ballId": ballId,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
    print("원판을 뒤집었습니다.");
    // 진동 메소드
    Vibration.vibrate(duration: 2000);
}



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: NaverMap(
          options: NaverMapViewOptions(
            indoorEnable: true,
            locationButtonEnable: false,
            consumeSymbolTapEvents: false,
          ),
          onMapReady: (controller) async {
            _mapController = controller;
            final locationOverlay = await controller.getLocationOverlay();

            // 현재 위치
            locationOverlay.setIcon(NOverlayImage.fromFile(imageFile!));
            locationOverlay.setIconSize(Size(25, 25));
            locationOverlay.setCircleRadius(15);
            locationOverlay.setCircleOutlineWidth(3);
            controller.setLocationTrackingMode(NLocationTrackingMode.follow);

            // 팀 별로 현재위치 아이콘 색상 다르게하기
             if(team == 0) locationOverlay.setCircleOutlineColor(Colors.redAccent);
             else if(team == 1) locationOverlay.setCircleOutlineColor(Colors.blueAccent);

            // 현재 위치
            var curPosition = await locationOverlay.getPosition();

            // Set up a periodic timer to update the location
            Timer.periodic(Duration(seconds: 5), (timer) async {
              var newPosition = await locationOverlay.getPosition();
              // 3m 이상 이동할 때마다 메세지 송신
              var distancePlayer = curPosition.distanceTo(newPosition);
              if(distancePlayer >= 3)
                {
                  stompClient?.send(
                    destination: '/app/game/location/$sendGameCode',
                    body: json.encode({
                      "id": id,
                      "latitude": newPosition.latitude,
                      "longitude": newPosition.longitude,
                    }),
                    headers: <String, String>{
                      'Content-Type': 'application/json',
                    },
                  );
                  print("3m 이동 데이터 송신 완료");
                  // 현재 위치 갱신
                  curPosition = newPosition;
                }

              // 일반 원판
              var distanceB0 = B0.position.distanceTo(newPosition);
              var distanceB1 = B1.position.distanceTo(newPosition);
              var distanceB2 = B2.position.distanceTo(newPosition);
              var distanceB3 = B3.position.distanceTo(newPosition);
              var distanceB4 = B4.position.distanceTo(newPosition);
              var distanceB5 = B5.position.distanceTo(newPosition);
              var distanceB6 = B6.position.distanceTo(newPosition);
              var distanceB7 = B7.position.distanceTo(newPosition);
              var distanceB8 = B8.position.distanceTo(newPosition);
              var distanceB9 = B9.position.distanceTo(newPosition);
              var distanceB10 = B10.position.distanceTo(newPosition);
              var distanceB11 = B11.position.distanceTo(newPosition);
              var distanceB12 = B12.position.distanceTo(newPosition);
              var distanceB13 = B13.position.distanceTo(newPosition);
              var distanceB14 = B14.position.distanceTo(newPosition);
              var distanceB15 = B15.position.distanceTo(newPosition);
              var distanceB16 = B16.position.distanceTo(newPosition);
              var distanceB17 = B17.position.distanceTo(newPosition);
              var distanceB18 = B18.position.distanceTo(newPosition);
              var distanceB19 = B19.position.distanceTo(newPosition);


              // 황금원판
              var distanceGold0 = Gold0.position.distanceTo(newPosition);
              var distanceGold1 = Gold1.position.distanceTo(newPosition);
              var distanceGold2 = Gold2.position.distanceTo(newPosition);
              var distanceGold3 = Gold3.position.distanceTo(newPosition);
              var distanceGold4 = Gold4.position.distanceTo(newPosition);
              var distanceGold5 = Gold5.position.distanceTo(newPosition);
              var distanceGold6 = Gold6.position.distanceTo(newPosition);
              var distanceGold7 = Gold7.position.distanceTo(newPosition);
              var distanceGold8 = Gold8.position.distanceTo(newPosition);
              var distanceGold9 = Gold9.position.distanceTo(newPosition);

              // 랜덤박스
              var distanceRandom0 = Random0.position.distanceTo(newPosition);
              var distanceRandom1 = Random1.position.distanceTo(newPosition);
              var distanceRandom2 = Random2.position.distanceTo(newPosition);
              var distanceRandom3 = Random3.position.distanceTo(newPosition);
              var distanceRandom4 = Random4.position.distanceTo(newPosition);
              var distanceRandom5 = Random5.position.distanceTo(newPosition);
              var distanceRandom6 = Random6.position.distanceTo(newPosition);
              var distanceRandom7 = Random7.position.distanceTo(newPosition);
              var distanceRandom8 = Random8.position.distanceTo(newPosition);
              var distanceRandom9 = Random9.position.distanceTo(newPosition);


              if (distanceB0 <= 8) {
                if (stateBall[0] == 'Blue' && team == 0) {
                  RedTeamGetScore1();
                  ballConvert(0);
                } else if (stateBall[0] == 'Red' && team == 1) {
                  BlueTeamGetScore1();
                  ballConvert(0);
                }
              }

              if (distanceB1 <= 8) {
                if (stateBall[1] == 'Blue' && team == 0) {
                  RedTeamGetScore1();
                  ballConvert(1);
                } else if (stateBall[1] == 'Red' && team == 1) {
                  BlueTeamGetScore1();
                  ballConvert(1);
                }
              }

              if (distanceB2 <= 8) {
                if (stateBall[2] == 'Blue' && team == 0) {
                  RedTeamGetScore1();
                  ballConvert(2);
                } else if (stateBall[2] == 'Red' && team == 1) {
                  BlueTeamGetScore1();
                  ballConvert(2);
                }
              }

              if (distanceB3 <= 8) {
                if (stateBall[3] == 'Blue' && team == 0) {
                  RedTeamGetScore1();
                  ballConvert(3);
                } else if (stateBall[3] == 'Red' && team == 1) {
                  BlueTeamGetScore1();
                  ballConvert(3);
                }
              }

              if (distanceB4 <= 8) {
                if (stateBall[4] == 'Blue' && team == 0) {
                  RedTeamGetScore1();
                  ballConvert(4);
                } else if (stateBall[4] == 'Red' && team == 1) {
                  BlueTeamGetScore1();
                  ballConvert(4);
                }
              }

              if (distanceB5 <= 8) {
                if (stateBall[5] == 'Blue' && team == 0) {
                  RedTeamGetScore1();
                  ballConvert(5);
                } else if (stateBall[5] == 'Red' && team == 1) {
                  BlueTeamGetScore1();
                  ballConvert(5);
                }
              }

              if (distanceB6 <= 8) {
                if (stateBall[6] == 'Blue' && team == 0) {
                  RedTeamGetScore1();
                  ballConvert(6);
                } else if (stateBall[6] == 'Red' && team == 1) {
                  BlueTeamGetScore1();
                  ballConvert(6);
                }
              }

              if (distanceB7 <= 8) {
                if (stateBall[7] == 'Blue' && team == 0) {
                  RedTeamGetScore1();
                  ballConvert(7);
                } else if (stateBall[7] == 'Red' && team == 1) {
                  BlueTeamGetScore1();
                  ballConvert(7);
                }
              }

              if (distanceB8 <= 8) {
                if (stateBall[8] == 'Blue' && team == 0) {
                  RedTeamGetScore1();
                  ballConvert(8);
                } else if (stateBall[8] == 'Red' && team == 1) {
                  BlueTeamGetScore1();
                  ballConvert(8);
                }
              }

              if (distanceB9 <= 8) {
                if (stateBall[9] == 'Blue' && team == 0) {
                  RedTeamGetScore1();
                  ballConvert(9);
                } else if (stateBall[9] == 'Red' && team == 1) {
                  BlueTeamGetScore1();
                  ballConvert(9);
                }
              }

              // test code
              if (distanceB10 <= 8) {
                if (stateBall[10] == 'Blue' && team == 0) {
                  RedTeamGetScore1();
                  ballConvert(10);
                } else if (stateBall[10] == 'Red' && team == 1) {
                  BlueTeamGetScore1();
                  ballConvert(10);
                }
              }

              if (distanceB11 <= 8) {
                if (stateBall[11] == 'Blue' && team == 0) {
                  RedTeamGetScore1();
                  ballConvert(11);
                } else if (stateBall[11] == 'Red' && team == 1) {
                  BlueTeamGetScore1();
                  ballConvert(11);
                }
              }


              if (distanceB12 <= 12.0) {
                if (stateBall[12] == 'Blue' && team == 0) {
                  RedTeamGetScore1();
                  ballConvert(12);
                } else if (stateBall[12] == 'Red' && team == 1) {
                  BlueTeamGetScore1();
                  ballConvert(12);
                }
              }

              if (distanceB13 <= 8) {
                if (stateBall[13] == 'Blue' && team == 0) {
                  RedTeamGetScore1();
                  ballConvert(13);
                } else if (stateBall[13] == 'Red' && team == 1) {
                  BlueTeamGetScore1();
                  ballConvert(13);
                }
              }

              if (distanceB14 <= 8) {
                if (stateBall[14] == 'Blue' && team == 0) {
                  RedTeamGetScore1();
                  ballConvert(14);
                } else if (stateBall[14] == 'Red' && team == 1) {
                  BlueTeamGetScore1();
                  ballConvert(14);
                }
              }

              if (distanceB15 <= 8) {
                if (stateBall[15] == 'Blue' && team == 0) {
                  RedTeamGetScore1();
                  ballConvert(15);
                } else if (stateBall[15] == 'Red' && team == 1) {
                  BlueTeamGetScore1();
                  ballConvert(15);
                }
              }

              if (distanceB16 <= 8) {
                if (stateBall[16] == 'Blue' && team == 0) {
                  RedTeamGetScore1();
                  ballConvert(16);
                } else if (stateBall[16] == 'Red' && team == 1) {
                  BlueTeamGetScore1();
                  ballConvert(16);
                }
              }

              if (distanceB17 <= 8) {
                if (stateBall[17] == 'Blue' && team == 0) {
                  RedTeamGetScore1();
                  ballConvert(17);
                } else if (stateBall[17] == 'Red' && team == 1) {
                  BlueTeamGetScore1();
                  ballConvert(17);
                }
              }

              if (distanceB18 <= 8) {
                if (stateBall[18] == 'Blue' && team == 0) {
                  RedTeamGetScore1();
                  ballConvert(18);
                } else if (stateBall[18] == 'Red' && team == 1) {
                  BlueTeamGetScore1();
                  ballConvert(18);
                }
              }

              if (distanceB19 <= 8) {
                if (stateBall[19] == 'Blue' && team == 0) {
                  RedTeamGetScore1();
                  ballConvert(19);
                } else if (stateBall[19] == 'Red' && team == 1) {
                  BlueTeamGetScore1();
                  ballConvert(19);
                }
              }

              // 황금원판
              // test code
              if(distanceGold0 <= 8)
              {
                // 뒤집음 매소드
                ballConvert(20);
                // 오버레이 호출
                if(team == 0) RedPlayerGetGoldenBall(context);
                else BluePlayerGetGoldenBall(context);
                // 맵에서 제거
                Gold0.setPosition(NLatLng(0, 0));

              }
              if(distanceGold1 <= 8)
              {
                // 뒤집음 매소드
                ballConvert(21);
                // 오버레이 호출
                if(team == 0) RedPlayerGetGoldenBall(context);
                else BluePlayerGetGoldenBall(context);
                // 맵에서 제거
                Gold1.setPosition(NLatLng(0, 0));

              }
              if(distanceGold2 <= 8)
              {
                // 뒤집음 매소드
                ballConvert(22);
                // 오버레이 호출
                if(team == 0) RedPlayerGetGoldenBall(context);
                else BluePlayerGetGoldenBall(context);
                // 맵에서 제거
                Gold2.setPosition(NLatLng(0, 0));

              }
              if(distanceGold3 <= 8)
              {
                // 뒤집음 매소드
                ballConvert(23);
                // 오버레이 호출
                if(team == 0) RedPlayerGetGoldenBall(context);
                else BluePlayerGetGoldenBall(context);
                // 맵에서 제거
                Gold3.setPosition(NLatLng(0, 0));

              }
              if(distanceGold4 <= 8)
              {
                // 뒤집음 매소드
                ballConvert(24);
                // 오버레이 호출
                if(team == 0) RedPlayerGetGoldenBall(context);
                else BluePlayerGetGoldenBall(context);
                // 맵에서 제거
                Gold4.setPosition(NLatLng(0, 0));

              }
              if(distanceGold5 <= 8)
              {
                // 뒤집음 매소드
                ballConvert(25);
                // 오버레이 호출
                if(team == 0) RedPlayerGetGoldenBall(context);
                else BluePlayerGetGoldenBall(context);
                // 맵에서 제거
                Gold5.setPosition(NLatLng(0, 0));

              }
              if(distanceGold6 <= 8)
              {
                // 뒤집음 매소드
                ballConvert(26);
                // 오버레이 호출
                if(team == 0) RedPlayerGetGoldenBall(context);
                else BluePlayerGetGoldenBall(context);
                // 맵에서 제거
                Gold6.setPosition(NLatLng(0, 0));

              }
              if(distanceGold7 <= 8)
              {
                // 뒤집음 매소드
                ballConvert(27);
                // 오버레이 호출
                if(team == 0) RedPlayerGetGoldenBall(context);
                else BluePlayerGetGoldenBall(context);
                // 맵에서 제거
                Gold7.setPosition(NLatLng(0, 0));

              }
              if(distanceGold8 <= 8)
              {
                // 뒤집음 매소드
                ballConvert(28);
                // 오버레이 호출
                if(team == 0) RedPlayerGetGoldenBall(context);
                else BluePlayerGetGoldenBall(context);
                // 맵에서 제거
                Gold8.setPosition(NLatLng(0, 0));

              }
              if(distanceGold9 <= 8)
              {
                // 뒤집음 매소드
                ballConvert(29);
                // 오버레이 호출
                if(team == 0) RedPlayerGetGoldenBall(context);
                else BluePlayerGetGoldenBall(context);
                // 맵에서 제거
                Gold9.setPosition(NLatLng(0, 0));

              }

              // 랜덤박스
              // test code
              if(distanceRandom0 <= 8)
              {
                GetRandomBox(context);
                // 공 뒤집음
                ballConvert(30);

                // random = 2 일때, block 활성화
                if(block == 1) {
                  // 시야차단 오버레이
                  controller.addOverlayAll({blockB0,blockB1,blockB2,blockB3,blockB4,blockB5,blockB6,
                    blockB7,blockB8,blockB9,blockB10,blockB11,blockB12,blockB13,blockB14,blockB15,blockB16,
                    blockB17,blockB18,blockB19,});

                  // 1분뒤 효과 제거
                  Future.delayed(Duration(seconds: 60), () {
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB0'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB1'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB2'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB3'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB4'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB5'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB6'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB7'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB8'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB9'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB10'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB11'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB12'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB13'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB14'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB15'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB16'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB17'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB18'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB19'));
                  });

                  // block off
                  block = 0;
                  }
                // 맵에서 삭제
                 Random0.setPosition(NLatLng(0, 0));
              }
              if(distanceRandom1 <= 8)
              {
                // 공 뒤집음
                ballConvert(31);

                // random = 2 일때, block 활성화
                if(block == 1) {
                  // 시야차단 오버레이
                  controller.addOverlayAll({blockB0,blockB1,blockB2,blockB3,blockB4,blockB5,blockB6,
                    blockB7,blockB8,blockB9,blockB10,blockB11,blockB12,blockB13,blockB14,blockB15,blockB16,
                    blockB17,blockB18,blockB19,});

                  // 1분뒤 효과 제거
                  Future.delayed(Duration(seconds: 60), () {
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB0'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB1'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB2'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB3'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB4'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB5'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB6'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB7'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB8'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB9'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB10'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB11'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB12'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB13'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB14'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB15'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB16'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB17'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB18'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB19'));
                  });

                  // block off
                  block = 0;
                }
                // 맵에서 삭제
                Random1.setPosition(NLatLng(0, 0));
              }
              if(distanceRandom2 <= 8)
              {
                // 공 뒤집음
                ballConvert(32);


                // random = 2 일때, block 활성화
                if(block == 1) {
                  // 시야차단 오버레이
                  controller.addOverlayAll({blockB0,blockB1,blockB2,blockB3,blockB4,blockB5,blockB6,
                    blockB7,blockB8,blockB9,blockB10,blockB11,blockB12,blockB13,blockB14,blockB15,blockB16,
                    blockB17,blockB18,blockB19,});

                  // 1분뒤 효과 제거
                  Future.delayed(Duration(seconds: 60), () {
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB0'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB1'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB2'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB3'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB4'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB5'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB6'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB7'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB8'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB9'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB10'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB11'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB12'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB13'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB14'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB15'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB16'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB17'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB18'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB19'));
                  });

                  // block off
                  block = 0;
                }
                // 맵에서 삭제
                Random2.setPosition(NLatLng(0, 0));
              }
              if(distanceRandom3 <= 8)
              {
                // 공 뒤집음
                ballConvert(33);

                // random = 2 일때, block 활성화
                if(block == 1) {
                  // 시야차단 오버레이
                  controller.addOverlayAll({blockB0,blockB1,blockB2,blockB3,blockB4,blockB5,blockB6,
                    blockB7,blockB8,blockB9,blockB10,blockB11,blockB12,blockB13,blockB14,blockB15,blockB16,
                    blockB17,blockB18,blockB19,});

                  // 1분뒤 효과 제거
                  Future.delayed(Duration(seconds: 60), () {
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB0'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB1'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB2'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB3'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB4'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB5'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB6'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB7'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB8'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB9'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB10'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB11'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB12'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB13'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB14'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB15'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB16'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB17'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB18'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB19'));
                  });

                  // block off
                  block = 0;
                }
                // 맵에서 삭제
                Random3.setPosition(NLatLng(0, 0));
              }
              if(distanceRandom4 <= 8)
              {
                // 공 뒤집음
                ballConvert(34);

                // random = 2 일때, block 활성화
                if(block == 1) {
                  // 시야차단 오버레이
                  controller.addOverlayAll({blockB0,blockB1,blockB2,blockB3,blockB4,blockB5,blockB6,
                    blockB7,blockB8,blockB9,blockB10,blockB11,blockB12,blockB13,blockB14,blockB15,blockB16,
                    blockB17,blockB18,blockB19,});

                  // 1분뒤 효과 제거
                  Future.delayed(Duration(seconds: 60), () {
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB0'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB1'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB2'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB3'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB4'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB5'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB6'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB7'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB8'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB9'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB10'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB11'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB12'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB13'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB14'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB15'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB16'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB17'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB18'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB19'));
                  });

                  // block off
                  block = 0;
                }
                // 맵에서 삭제
                Random4.setPosition(NLatLng(0, 0));
              }
              if(distanceRandom5 <= 8)
              {
                // 공 뒤집음
                ballConvert(35);

                // random = 2 일때, block 활성화
                if(block == 1) {
                  // 시야차단 오버레이
                  controller.addOverlayAll({blockB0,blockB1,blockB2,blockB3,blockB4,blockB5,blockB6,
                    blockB7,blockB8,blockB9,blockB10,blockB11,blockB12,blockB13,blockB14,blockB15,blockB16,
                    blockB17,blockB18,blockB19,});

                  // 1분뒤 효과 제거
                  Future.delayed(Duration(seconds: 60), () {
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB0'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB1'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB2'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB3'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB4'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB5'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB6'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB7'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB8'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB9'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB10'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB11'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB12'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB13'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB14'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB15'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB16'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB17'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB18'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB19'));
                  });

                  // block off
                  block = 0;
                }
                // 맵에서 삭제
                Random5.setPosition(NLatLng(0, 0));
              }
              if(distanceRandom6 <= 8)
              {
                // 공 뒤집음
                ballConvert(36);

                // random = 2 일때, block 활성화
                if(block == 1) {
                  // 시야차단 오버레이(랜덤박스 오버레이 시간 고려해서 딜레이)
                  Future.delayed(Duration(seconds: 12), () {
                  controller.addOverlayAll({blockB0,blockB1,blockB2,blockB3,blockB4,blockB5,blockB6,
                    blockB7,blockB8,blockB9,blockB10,blockB11,blockB12,blockB13,blockB14,blockB15,blockB16,
                    blockB17,blockB18,blockB19,});
                  });

                  // 1분뒤 효과 제거
                  Future.delayed(Duration(seconds: 60), () {
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB0'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB1'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB2'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB3'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB4'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB5'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB6'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB7'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB8'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB9'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB10'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB11'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB12'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB13'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB14'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB15'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB16'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB17'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB18'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB19'));
                  });

                  // block off
                  block = 0;
                }
                // 맵에서 삭제
                Random6.setPosition(NLatLng(0, 0));
              }
              if(distanceRandom7 <= 8)
              {
                // 공 뒤집음
                ballConvert(37);

                // random = 2 일때, block 활성화
                if(block == 1) {
                  // 시야차단 오버레이
                  controller.addOverlayAll({blockB0,blockB1,blockB2,blockB3,blockB4,blockB5,blockB6,
                    blockB7,blockB8,blockB9,blockB10,blockB11,blockB12,blockB13,blockB14,blockB15,blockB16,
                    blockB17,blockB18,blockB19,});

                  // 1분뒤 효과 제거
                  Future.delayed(Duration(seconds: 60), () {
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB0'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB1'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB2'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB3'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB4'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB5'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB6'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB7'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB8'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB9'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB10'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB11'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB12'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB13'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB14'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB15'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB16'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB17'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB18'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB19'));
                  });

                  // block off
                  block = 0;
                }
                // 맵에서 삭제
                Random7.setPosition(NLatLng(0, 0));
              }
              if(distanceRandom8 <= 8)
              {
                // 공 뒤집음
                ballConvert(38);

                // random = 2 일때, block 활성화
                if(block == 1) {
                  // 시야차단 오버레이
                  controller.addOverlayAll({blockB0,blockB1,blockB2,blockB3,blockB4,blockB5,blockB6,
                    blockB7,blockB8,blockB9,blockB10,blockB11,blockB12,blockB13,blockB14,blockB15,blockB16,
                    blockB17,blockB18,blockB19,});

                  // 1분뒤 효과 제거
                  Future.delayed(Duration(seconds: 60), () {
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB0'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB1'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB2'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB3'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB4'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB5'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB6'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB7'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB8'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB9'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB10'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB11'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB12'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB13'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB14'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB15'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB16'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB17'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB18'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB19'));
                  });

                  // block off
                  block = 0;
                }
                // 맵에서 삭제
                Random8.setPosition(NLatLng(0, 0));
              }
              if(distanceRandom9 <= 8)
              {
                // 공 뒤집음
                ballConvert(39);

                // random = 2 일때, block 활성화
                if(block == 1) {
                  // 시야차단 오버레이
                  controller.addOverlayAll({blockB0,blockB1,blockB2,blockB3,blockB4,blockB5,blockB6,
                    blockB7,blockB8,blockB9,blockB10,blockB11,blockB12,blockB13,blockB14,blockB15,blockB16,
                    blockB17,blockB18,blockB19,});

                  // 1분뒤 효과 제거
                  Future.delayed(Duration(seconds: 60), () {
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB0'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB1'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB2'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB3'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB4'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB5'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB6'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB7'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB8'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB9'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB10'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB11'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB12'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB13'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB14'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB15'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB16'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB17'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB18'));
                    controller.deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: 'blockB19'));
                  });

                  // block off
                  block = 0;
                }
                // 맵에서 삭제
                Random9.setPosition(NLatLng(0, 0));
              }
            });

            // 원판 초기 상태
            controller.addOverlayAll({
              B0, B1, B2, B3, B4, B5, B6, B7, B8, B9,
              B10, B11, B12, B13, B14, B15, B16, B17, B18, B19,
              Gold0, Gold1, Gold2, Gold3, Gold4, Gold5, Gold6,
              Gold7, Gold8, Gold9,
              Random0,Random1,Random2,Random3,Random4,Random5,
              Random6,Random7,Random8,Random9,
            });

            log("onMapReady", name: "onMapReady");
          },
        ),
      ),
    );
  }
}
