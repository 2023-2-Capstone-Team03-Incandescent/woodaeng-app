import 'package:did_u_c_my_dog/Game_Matching.dart';
import 'dart:collection';

String response = '';
String accessToken = '';
String refreshToken = '';

// test code
var minutes = 15;
var seconds = 0;

// 회원가입 email temp
var email = 'test123434';

// 게임코드
String ?sendGameCode;

// 원판 위치
var sendBalls = [];

// 팀 정보
List<dynamic> ?teamRed;
List<dynamic> ?teamBlue;

// randombox
int random = 2;
// 플레이어 정보
int id = 123;
int team = 0;
int player = 0;
String? playerImage;

// 강아지 정보
String? nickname;
String? image_id;
String? dog_name;
int? dog_age;
String? dog_breed;
int? dog_sex;

// 특수원판 ballId
int ?goldId;
int ?randomId;

// 결과창 오버레이(id)
String ?red_player0_Id = '감자';
String ?red_player1_Id = '고구마';
String ?red_player2_Id = '콩이';

String ?blue_player0_Id = '브라우니';
String ?blue_player1_Id = '몽이';
String ?blue_player2_Id = '코코';


// 미니게임
int ?gameType = 0;
int ?opponentId;
String ?opponentImage;
String ?opponentNick;
String ?question;
Map<String, dynamic> ?option;
int ?answer;
int win = 0;

// 전체 팀별 원판
int Ball_red = 10;
int Ball_blue = 10;

// 개인별 원판
int red_player0_ballScore = 4;
int red_player1_ballScore = 3;
int red_player2_ballScore = 4;

int blue_player0_ballScore = 4;
int blue_player1_ballScore = 5;
int blue_player2_ballScore = 3;

// 개인별 황금 원판
int red_player0_goldScore = 2;
int red_player1_goldScore = 0;
int red_player2_goldScore = 0;

int blue_player0_goldScore = 1;
int blue_player1_goldScore = 1;
int blue_player2_goldScore = 0;

// 개인별 랜덤 박스
int red_player0_randomBoxScore = 1;
int red_player1_randomBoxScore = 0;
int red_player2_randomBoxScore = 1;

int blue_player0_randomBoxScore = 1;
int blue_player1_randomBoxScore = 1;
int blue_player2_randomBoxScore = 0;

// 개인별 미니게임
int red_player0_miniGameScore = 2;
int red_player1_miniGameScore = 0;
int red_player2_miniGameScore = 1;

int blue_player0_miniGameScore = 2;
int blue_player1_miniGameScore = 1;
int blue_player2_miniGameScore = 0;

// 게임 result
var playerResults;
