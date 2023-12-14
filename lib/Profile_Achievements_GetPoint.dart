import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'dart:async';


OverlayEntry? overlayEntryAchievementsGetPoint;


void AchievementsGetPoint(context) {
  if (overlayEntryAchievementsGetPoint == null) {

    Timer(Duration(milliseconds: 5000), (){
      overlayEntryAchievementsGetPoint?.remove();
      overlayEntryAchievementsGetPoint = null;
    });

    overlayEntryAchievementsGetPoint = OverlayEntry(
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => Stack(
          children: <Widget>[
            Pinned.fromPins(
              Pin(start: 19.0, end: 19.0),
              Pin(size: 204.0, middle: 0.4496),
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(start: 46.0, end: 50.0),
                    Pin(size: 74.0, middle: 0.4806),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.0, -1.0),
                          end: Alignment(0.0, 1.0),
                          colors: [const Color(0xffffebf2), const Color(0xffdff9ff)],
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
                  ),
                  Align(
                    alignment: Alignment(0.279, -0.035),
                    child: SizedBox(
                      width: 127.0,
                      height: 37.0,
                      child: Text.rich(
                        TextSpan(
                          style: TextStyle(
                            fontFamily: 'THEAlien',
                            fontSize: 30,
                            color: const Color(0xffffca18),
                          ),
                          children: [
                            TextSpan(
                              text: '{}P',
                            ),
                            TextSpan(
                              text: ' 획득!',
                              style: TextStyle(
                                color: const Color(0xffff7cab),
                              ),
                            ),
                          ],
                        ),
                        textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(-0.457, -0.036),
                    child: Container(
                      width: 36.0,
                      height: 36.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage('assets/images/Dog_Bone_Icon.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    Overlay.of(context)?.insert(overlayEntryAchievementsGetPoint!);
  }
}










