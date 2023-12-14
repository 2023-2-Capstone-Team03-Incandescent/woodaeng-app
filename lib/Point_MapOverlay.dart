import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './Point.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';

OverlayEntry? overlayEntryPointMap;

final List<Info> Hospital = [
  Info(name: '상도힐링동물병원\n02-812-7512\n서울특별시 동작구 상도로 353', HImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFZz9rzFDJzxyV8CjCU-iH35PPeWvT13LFXjia_PjYYtQeRQ2w4Wpllk8ftFZqBGUTRDE&usqp=CAU'),
  Info(name: '정겨운동물병원\n02-817-8172\n서울특별시 동작구 상도로 315 상정빌딩', HImage: 'https://search.pstatic.net/common/?autoRotate=true&quality=100&type=f640_380&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20200804_279%2F1596509220747ppH6G_JPEG%2FCvcf2DN591WM70tBb1G5uB2z.jpg'),
  Info(name: '품 동물의료센터\n02-812-7585\n서울특별시 동작구 양녕로 277-1 1층', HImage: 'https://search.pstatic.net/common/?autoRotate=true&quality=100&type=f640_380&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20220224_111%2F1645690449254oTXTD_JPEG%2F1%2528%25B4%25EB%25C7%25A5%25BB%25E7%25C1%25F8-%25BE%25DF%25B0%25A3%25BF%25DC%25B0%25FC%2529.jpg'),
  Info(name: '우리아이동물병원\n02-823-7500\n서울특별시 동작구 상도로 262', HImage: 'https://peton.me/data/file/addPlace/%EC%9A%B0%EB%A6%AC%EC%95%84%EC%9D%B4_%EB%8F%99%EB%AC%BC%EB%B3%91%EC%9B%90_262_1.webp'),
  Info(name: '유케어 종합동물병원\n0507-1385-8307\n서울특별시 동작구 상도로 214 성은빌딩 1층', HImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJL7HlCyHyXq5fTqk7HUBKKj095E64rjbITQQqz1k6hJ03_gJRurPkB9Ui9n4SmaKD_jM&usqp=CAU'),
  Info(name: '하나사랑동물병원\n02-822-7574\n서울특별시 동작구 상도로 171', HImage: 'https://search.pstatic.net/common/?autoRotate=true&quality=100&type=f640_380&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20191026_120%2F1572068259092vzDfG_JPEG%2FHIDagwSplfOhFJtIpJqjYIS8.jpeg.jpg'),
  Info(name: '디아크동물병원\n02-816-7582\n서울특별시 동작구 장승배기로27길 18', HImage: 'https://peton.me/data/file/addPlace/%EB%94%94%EC%95%84%ED%81%AC%EB%8F%99%EB%AC%BC%EB%B3%91%EC%9B%90_64-1_1.webp'),
  Info(name: '피닉스동물병원\n02-813-7579\n서울특별시 동작구 상도로 43 1층', HImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRklAfIAsJkbqUGfMDR8GWkdtt76bGa-38RS1TKYloubGgJi9N8Rxci25Y9YpxH5HuTiT4&usqp=CAU'),
  Info(name: '보라매 웰 종합 동물병원\n02-3280-7975\n서울특별시 동작구 상도로 16 MGI빌딩 1층', HImage: 'https://mypethospitals.b-cdn.net/wp-content/uploads/2022/03/%EB%B3%B4%EB%9D%BC%EB%A7%A4-%EC%9B%B0-%EC%A2%85%ED%95%A9-%EB%8F%99%EB%AC%BC%EB%B3%91%EC%9B%90-1.jpg'),
];


void PointMapOverlay(BuildContext context) {

  if (overlayEntryPointMap == null) {
    overlayEntryPointMap = OverlayEntry(
      builder: (context) =>
          StatefulBuilder(
            builder: (context, setState) =>
                Stack(
                  children: <Widget>[
                    Pinned.fromPins(
                      Pin(start: -0.5, end: 0.0),
                      Pin(size: 1.0, middle: 0.2254),
                      child: SvgPicture.string(
                        _svg_mu86bw,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(start: 0.0, end: 0.0),
                      Pin(size: 683.0, end: 62.0),
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      top: 43.0 + 128.5,
                      bottom: 65.0,
                      left: 0.0,
                      right: 0.0,
                      child: ListView.builder(
                        itemCount: Hospital.length,
                        itemBuilder: (BuildContext context, int index) {
                          return buildRankingItem(Hospital[index]);
                        },
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 59.0, end: 20.0),
                      Pin(size: 59.0, end: 89.0),
                      child: GestureDetector(
                        onTap: () {
                          overlayEntryPointMap!.remove();
                          overlayEntryPointMap = null;
                        },
                        child: Stack(
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment(0.0, -1.0),
                                      end: Alignment(0.0, 1.0),
                                      colors: [
                                        const Color(0xffdbdbdb),
                                        const Color(0xffeeeeee),
                                        const Color(0xffececec),
                                        const Color(0xffd5d5d5)
                                      ],
                                      stops: [0.0, 0.318, 0.703, 1.0],
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.elliptical(9999.0, 9999.0)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0xff6e6e6e),
                                        offset: Offset(0, 0),
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage(
                                      'assets/images/Map_Icon.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              margin: EdgeInsets.fromLTRB(7.0, 6.0, 7.0, 8.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
          ),
    );
    Overlay.of(context)!.insert(overlayEntryPointMap!);
  }
}

Widget buildRankingItem(Info Info) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    padding: EdgeInsets.all(10.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Transform.translate(
          offset: Offset(0.0, 0.0),
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage('${Info.HImage}'),
              ),
            ),
          ),
        ),
        SizedBox(width: 20.0),
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontFamily: 'TmoneyRoundWindRegular',
              fontSize: 13.0,
              color: Colors.black,
            ),
            children: [
              TextSpan(
                text: '${Info.name.split('\n')[0]}', // Extracting place name before '\n'
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0, // Adjust the font size for place names
                ),
              ),
              TextSpan(
                text: '\n${Info.name.split('\n')[1]}', // Extracting phone number after '\n'
                style: TextStyle(
                  color: Colors.blue, // Setting blue color for phone numbers
                ),
              ),
              TextSpan(
                text: '\n${Info.name.split('\n')[2]}', // Extracting phone number after '\n'
                ),
            ],
          ),
        ),
      ],
    ),
  );
}


class Info {
  final String name;
  final String HImage;

  Info({
    required this.name,
    required this.HImage,
  });
}

const String _svg_mu86bw =
    '<svg viewBox="-0.5 144.0 360.5 1.0" ><path transform="translate(-0.5, 144.0)" d="M 0 0 L 360.5 0" fill="none" stroke="#bcbcbc" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';