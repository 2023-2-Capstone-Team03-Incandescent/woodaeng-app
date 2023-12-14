import 'dart:async';
import 'dart:developer';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:url_launcher/url_launcher.dart';


var H0 = NMarker(
  id: '상도힐링동물병원',
  position: NLatLng(37.49727759934065, 126.95322783198003),
  size: Size(50, 50),
  icon: NOverlayImage.fromAssetImage('assets/images/Pin_Icon.png'),
);

final infoH0 = NInfoWindow.onMap(id: "infoH0", position: NLatLng(37.49727759934065, 126.95322783198003),
    text: "상도힐링동물병원\n"
    "02-812-7512\n"
    "서울특별시 동작구 상도로 353\n포인트로 예약하기: 클릭");

var H1 = NMarker(
  id: '정겨운동물병원',
  position: NLatLng(37.50002240392542, 126.95073814778873),
  size: Size(50, 50),
  icon: NOverlayImage.fromAssetImage('assets/images/Pin_Icon.png'),
);

final infoH1 = NInfoWindow.onMap(id: "infoH1", position: NLatLng(37.50002240392542, 126.95073814778873),
    text: "정겨운동물병원\n"
    "02-817-8172\n"
    "서울특별시 동작구 상도로 315 상정빌딩\n포인트로 예약하기: 클릭");

var H2 = NMarker(
  id: '품 동물의료센터',
  position: NLatLng(37.50438270138323, 126.94938943796687),
  size: Size(50, 50),
  icon: NOverlayImage.fromAssetImage('assets/images/Pin_Icon.png'),
);

final infoH2 = NInfoWindow.onMap(id: "infoH2", position: NLatLng(37.50438270138323, 126.94938943796687),
    text: "품 동물의료센터\n"
        "02-812-7585\n"
        "서울특별시 동작구 양녕로 277-1 1층\n포인트로 예약하기: 클릭");

var H3 = NMarker(
  id: '우리아이동물병원',
  position: NLatLng(37.50384775983549, 126.9468932178315),
  size: Size(50, 50),
  icon: NOverlayImage.fromAssetImage('assets/images/Pin_Icon.png'),
);

final infoH3 = NInfoWindow.onMap(id: "infoH3", position: NLatLng(37.50384775983549, 126.9468932178315),
    text: "우리아이동물병원\n"
        "02-823-7500\n"
        "서울특별시 동작구 상도로 262\n포인트로 예약하기: 클릭");

var H4 = NMarker(
  id: '유케어 종합동물병원',
  position: NLatLng(37.50506648879376, 126.94234301769174),
  size: Size(50, 50),
  icon: NOverlayImage.fromAssetImage('assets/images/Pin_Icon.png'),
);

final infoH4 = NInfoWindow.onMap(id: "infoH4", position: NLatLng(37.50506648879376, 126.94234301769174),
    text: "유케어 종합동물병원\n"
        "0507-1385-8307\n"
        "서울특별시 동작구 상도로 214 성은빌딩 1층\n포인트로 예약하기: 클릭");

var H5 = NMarker(
  id: '하나사랑동물병원',
  position: NLatLng(37.50448540841793, 126.9380288380208),
  size: Size(50, 50),
  icon: NOverlayImage.fromAssetImage('assets/images/Pin_Icon.png'),
);

final infoH5 = NInfoWindow.onMap(id: "infoH5", position: NLatLng(37.50448540841793, 126.9380288380208),
    text: "하나사랑동물병원\n"
        "02-822-7574\n"
        "서울특별시 동작구 상도로 171\n포인트로 예약하기: 클릭");

var H6 = NMarker(
  id: '디아크동물병원',
  position: NLatLng(37.51167821568329, 126.93906065035881),
  size: Size(50, 50),
  icon: NOverlayImage.fromAssetImage('assets/images/Pin_Icon.png'),
);

final infoH6 = NInfoWindow.onMap(id: "infoH6", position: NLatLng(37.51167821568329, 126.93906065035881),
    text: "디아크동물병원\n"
        "02-816-7582\n"
        "서울특별시 동작구 장승배기로27길 18\n포인트로 예약하기: 클릭");

var H7 = NMarker(
  id: '피닉스동물병원',
  position: NLatLng(37.49997534371618, 126.92541742472059),
  size: Size(50, 50),
  icon: NOverlayImage.fromAssetImage('assets/images/Pin_Icon.png'),
);

final infoH7 = NInfoWindow.onMap(id: "infoH7", position: NLatLng(37.49997534371618, 126.92541742472059),
    text: "피닉스동물병원\n"
        "02-813-7579\n"
        "서울특별시 동작구 상도로 43 1층\n포인트로 예약하기: 클릭",);

var H8 = NMarker(
  id: '보라매웰종합동물병원',
  position: NLatLng(37.49970529767467, 126.9223190505788),
  size: Size(50, 50),
  icon: NOverlayImage.fromAssetImage('assets/images/Pin_Icon.png'),
);

final infoH8 = NInfoWindow.onMap(id: "infoH8", position: NLatLng(37.49970529767467, 126.9223190505788),
    text: "보라매 웰 종합 동물병원\n"
        "02-3280-7975\n"
        "서울특별시 동작구 상도로 16 MGI빌딩 1층\n포인트로 예약하기: 클릭");



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NaverMapSdk.instance.initialize(clientId: 'a1z8xa1rz9');
  runApp(Point_Naver());
}

class Point_Naver extends StatefulWidget {
  const Point_Naver({Key? key});

  @override
  State<Point_Naver> createState() => _Point_NaverState();
}

class _Point_NaverState extends State<Point_Naver> {
  late NaverMapController _mapController;
  OverlayEntry? overlayEntry; // Declare overlayEntry as a field


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          // Set constraints to control the screen size
          child: NaverMap(
            options: NaverMapViewOptions(
              indoorEnable: true,
              locationButtonEnable: false,
              consumeSymbolTapEvents: false,
            ),
            onMapReady: (controller) async {
              _mapController = controller;
              controller.setLocationTrackingMode(NLocationTrackingMode.follow);

              // 마커
              controller.addOverlayAll({H0, H1, H2, H3, H4, H5, H6, H7, H8});

              // 정보창 키기
              H0.setOnTapListener((NMarker H0) {
                controller.clearOverlays(type: NOverlayType.infoWindow);
                  controller.addOverlay(infoH0);
                  final cameraUpdate = NCameraUpdate.scrollAndZoomTo(
                    target: NLatLng(37.49727759934065, 126.95322783198003),
                    zoom: 18,
                  );
                  cameraUpdate.setAnimation(animation: NCameraAnimation.easing, duration: Duration(seconds: 2));
                  controller.updateCamera(cameraUpdate);
              });
              H1.setOnTapListener((NMarker H1) {
                controller.clearOverlays(type: NOverlayType.infoWindow);
                controller.addOverlay(infoH1);
                final cameraUpdate = NCameraUpdate.scrollAndZoomTo(
                  target: NLatLng(37.50002240392542, 126.95073814778873),
                  zoom: 18,
                );
                cameraUpdate.setAnimation(animation: NCameraAnimation.easing, duration: Duration(seconds: 2));
                controller.updateCamera(cameraUpdate);
              });
              H2.setOnTapListener((NMarker H2) {
                controller.clearOverlays(type: NOverlayType.infoWindow);
                controller.addOverlay(infoH2);
                final cameraUpdate = NCameraUpdate.scrollAndZoomTo(
                  target: NLatLng(37.50438270138323, 126.94938943796687),
                  zoom: 18,
                );
                cameraUpdate.setAnimation(animation: NCameraAnimation.easing, duration: Duration(seconds: 2));
                controller.updateCamera(cameraUpdate);
              });
              H3.setOnTapListener((NMarker H3) {
                controller.clearOverlays(type: NOverlayType.infoWindow);
                controller.addOverlay(infoH3);
                final cameraUpdate = NCameraUpdate.scrollAndZoomTo(
                  target: NLatLng(37.50384775983549, 126.9468932178315),
                  zoom: 18,
                );
                cameraUpdate.setAnimation(animation: NCameraAnimation.easing, duration: Duration(seconds: 2));
                controller.updateCamera(cameraUpdate);
              });
              H4.setOnTapListener((NMarker H4) {
                controller.clearOverlays(type: NOverlayType.infoWindow);
                controller.addOverlay(infoH4);
                final cameraUpdate = NCameraUpdate.scrollAndZoomTo(
                  target: NLatLng(37.50506648879376, 126.94234301769174),
                  zoom: 18,
                );
                cameraUpdate.setAnimation(animation: NCameraAnimation.easing, duration: Duration(seconds: 2));
                controller.updateCamera(cameraUpdate);
              });
              H5.setOnTapListener((NMarker H5) {
                controller.clearOverlays(type: NOverlayType.infoWindow);
                controller.addOverlay(infoH5);
                final cameraUpdate = NCameraUpdate.scrollAndZoomTo(
                  target: NLatLng(37.50448540841793, 126.9380288380208),
                  zoom: 18,
                );
                cameraUpdate.setAnimation(animation: NCameraAnimation.easing, duration: Duration(seconds: 2));
                controller.updateCamera(cameraUpdate);
              });
              H6.setOnTapListener((NMarker H6) {
                controller.clearOverlays(type: NOverlayType.infoWindow);
                controller.addOverlay(infoH6);
                final cameraUpdate = NCameraUpdate.scrollAndZoomTo(
                  target: NLatLng(37.51167821568329, 126.93906065035881),
                  zoom: 18,
                );
                cameraUpdate.setAnimation(animation: NCameraAnimation.easing, duration: Duration(seconds: 2));
                controller.updateCamera(cameraUpdate);
              });
              H7.setOnTapListener((NMarker H7) {
                controller.clearOverlays(type: NOverlayType.infoWindow);
                controller.addOverlay(infoH7);
                final cameraUpdate = NCameraUpdate.scrollAndZoomTo(
                  target: NLatLng(37.49997534371618, 126.92541742472059),
                  zoom: 18,
                );
                cameraUpdate.setAnimation(animation: NCameraAnimation.easing, duration: Duration(seconds: 2));
                controller.updateCamera(cameraUpdate);
              });
              H8.setOnTapListener((NMarker H8) {
                controller.clearOverlays(type: NOverlayType.infoWindow);
                controller.addOverlay(infoH8);
                final cameraUpdate = NCameraUpdate.scrollAndZoomTo(
                  target: NLatLng(37.49970529767467, 126.9223190505788),
                  zoom: 18,
                );
                cameraUpdate.setAnimation(animation: NCameraAnimation.easing, duration: Duration(seconds: 2));
                controller.updateCamera(cameraUpdate);
              });

              // 정보창 클릭시 홈페이지 이동
              infoH0.setOnTapListener((infoH0) {
                launchUrl(Uri.parse('https://map.naver.com/p/entry/place/37801245?c=15.00,0,0,0,dh'));
              });
              infoH1.setOnTapListener((infoH1) {
                launchUrl(Uri.parse('https://map.naver.com/p/entry/place/32116370?c=15.00,0,0,0,dh'));
              });
              infoH2.setOnTapListener((infoH2) {
                launchUrl(Uri.parse('https://map.naver.com/p/entry/place/1925125042?c=15.00,0,0,0,dh'));
              });
              infoH3.setOnTapListener((infoH3) {
                launchUrl(Uri.parse('https://map.naver.com/p/entry/place/21235945?c=15.00,0,0,0,dh'));
              });
              infoH4.setOnTapListener((infoH4) {
                launchUrl(Uri.parse('https://map.naver.com/p/entry/place/35021584?c=15.00,0,0,0,dh'));
              });
              infoH5.setOnTapListener((infoH5) {
                launchUrl(Uri.parse('https://map.naver.com/p/entry/place/31591898?c=15.00,0,0,0,dh'));
              });
              infoH6.setOnTapListener((infoH6) {
                launchUrl(Uri.parse('https://map.naver.com/p/entry/place/34402153?c=15.00,0,0,0,dh'));
              });
              infoH7.setOnTapListener((infoH7) {
                launchUrl(Uri.parse('https://map.naver.com/p/entry/place/11691640?c=15.00,0,0,0,dh'));
              });
              infoH8.setOnTapListener((infoH8) {
                launchUrl(Uri.parse('https://map.naver.com/p/entry/place/32873789?c=15.00,0,0,0,dh'));
              });


              log("onMapReady", name: "onMapReady");
            },
          ),
        ),
      ),
    );
  }
}
