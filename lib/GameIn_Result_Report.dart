import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

OverlayEntry? overlayEntryResultReportt;

void GameResultReportOverlay(BuildContext context) {
  if (overlayEntryResultReportt == null) {
    double centerX = MediaQuery.of(context).size.width / 2;
    double centerY = MediaQuery.of(context).size.height / 2;

    overlayEntryResultReportt = OverlayEntry(
        builder: (context) => Material(
          color: Colors.transparent,
          child: Stack(
            children: <Widget>[
              SizedBox.expand(
                child: SvgPicture.string(
                  _svg_kyv0ak,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              Align(
                alignment: Alignment(0.0, -0.006),
                child: SizedBox(
                  width: 242.0,
                  height: 153.0,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(0.0, -1.0),
                            end: Alignment(0.0, 1.0),
                            colors: [
                              const Color(0xffffffff),
                              const Color(0xfff2f2f2)
                            ],
                            stops: [0.0, 1.0],
                          ),
                          borderRadius: BorderRadius.circular(25.0),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x29000000),
                              offset: Offset(0, 0),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        margin: EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 0.0),
                      ),
                      Align(
                        alignment: Alignment(0.9, -0.85),
                        child: GestureDetector(
                          onTap: () {
                            overlayEntryResultReportt?.remove();
                            overlayEntryResultReportt = null;
                          },
                          child: Container(
                            width: 16.0,
                            height: 16.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: const AssetImage(
                                    'assets/images/Exit_Icon.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          width: 104.0,
                          height: 33.0,
                          child: Stack(
                            children: <Widget>[
                              Pinned.fromPins(
                                Pin(size: 33.0, start: 0.0),
                                Pin(start: 0.0, end: 0.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: const AssetImage(
                                          'assets/images/Red_Alert_Icon.png'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Pinned.fromPins(
                                Pin(size: 79.0, end: 0.0),
                                Pin(size: 22.0, end: 3.0),
                                child: Text(
                                  '신고하기',
                                  style: TextStyle(
                                    fontFamily: 'TmoneyRoundWindRegular',
                                    fontSize: 18,
                                    color: const Color(0xffff1818),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(start: 32.0, end: 31.0),
                        Pin(size: 80.0, middle: 0.6344),
                        child: Material(
                          color: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffe6e6e6),
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                            child: TextField(
                              // Add text field properties as needed
                              style: TextStyle(fontSize: 12),
                              decoration: InputDecoration(
                                hintText: '내용을 입력해주세요.',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(8.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Pinned.fromPins(
                          Pin(size: 64.0, middle: 0.5),
                          Pin(size: 19.0, end: 6.0),
                          child: GestureDetector(
                            onTap: () {
                              overlayEntryResultReportt?.remove();
                              overlayEntryResultReportt = null;
                            },
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment(0.0, -1.0),
                                      end: Alignment(0.0, 1.0),
                                      colors: [
                                        const Color(0xffffebf2),
                                        const Color(0xffdff9ff)
                                      ],
                                      stops: [0.0, 1.0],
                                    ),
                                    borderRadius: BorderRadius.circular(34.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0xffc9c9c9),
                                        offset: Offset(0, 0),
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(size: 22.0, middle: 0.5238),
                                  Pin(size: 14.0, start: 2.0),
                                  child: Text(
                                    '제출',
                                    style: TextStyle(
                                      fontFamily: 'TmoneyRoundWindRegular',
                                      fontSize: 12,
                                      color: const Color(0xffff0000),
                                    ),
                                    textAlign: TextAlign.center,
                                    softWrap: false,
                                  ),
                                ),
                              ],
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
        ));

    Overlay.of(context)?.insert(overlayEntryResultReportt!);
  }
}

const String _svg_kyv0ak =
    '<svg viewBox="0.0 0.0 360.0 640.0" ><path  d="M 0 0 L 360 0 L 360 640 L 0 640 L 0 0 Z" fill="#000000" fill-opacity="0.25" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';