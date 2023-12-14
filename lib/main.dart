import 'package:did_u_c_my_dog/FindID.dart';
import 'package:did_u_c_my_dog/Profile_Achievements.dart';
import 'package:did_u_c_my_dog/Profile_GameRecords.dart';
import 'package:did_u_c_my_dog/Profile_Settings_ManageProfile.dart';
import 'package:did_u_c_my_dog/SignIn.dart';
import 'package:did_u_c_my_dog/SignIn_RegisterProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

import 'FindPW.dart';
import 'Game_In.dart';
import 'Game_Matching.dart';
import 'Point.dart';
import 'Profile.dart';
import 'Ranking.dart';
import 'SignUp.dart';
import 'Game.dart';
import 'Splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    NaverMapSdk.instance.initialize(clientId: 'a1z8xa1rz9');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '우리 댕댕이 봤어요?',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
          )
        ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
              )
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
              style: ButtonStyle(
                overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
              )
          )
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => Splash(),
        '/SignUp' : (context) => SignUp(),
        '/FindID' : (context) => FindID(),
        '/FindPW' : (context) => FindPW(),
        '/Game' : (context) => Game(),
        '/Splash' : (context) => Splash(),
        '/Ranking' : (context) => Ranking(),
        '/Profile' : (context) => Profile(),
        '/Point' : (context) => Point(),
        '/Game_In' : (context) => Game_In(),
        '/Game_Matching' : (context) => Game_Matching(),
        '/SignIn_RegisterProfile' : (context) => SignIn_RegisterProfile()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
