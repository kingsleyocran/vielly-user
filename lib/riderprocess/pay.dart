import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:vielly_user/constants.dart';
import 'package:vielly_user/riderprocess/rideon.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:animations/animations.dart';
import 'package:vielly_user/transitions/fade.dart';

class PayPage extends StatelessWidget {
  GoogleMapController mapController;

  static final CameraPosition _kInitialPosition = const CameraPosition(
    target: LatLng(24.150, -110.32),
    zoom: 13,
  );

  CameraPosition _position = _kInitialPosition;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
              color: Colors.grey,
            ),

            Positioned(
              child: SlidingUpPanel(
                minHeight: 200,
                maxHeight: size.height * 0.7,
                renderPanelSheet: false,
                panel: Container(
                  height: 200,
                  width: size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        XDColor_white,
                        XDColor_none,
                      ],
                      stops: [
                        0.8,
                        1,
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          width: size.width,
                          height: 100,
                          color: Colors.black,
                          child: Container(
                            width: size.width,
                            child: Container(
                              width: size.width * 0.8,
                              margin: EdgeInsets.only(
                                  left: size.width * 0.1,
                                  right: size.width * 0.1),
                              child: RawMaterialButton(
                                key: ValueKey('Join Ride'),
                                child: Text('Join ride'),
                                onPressed: () {
                                  Navigator.push(
                                      context, FadeRoute(page: RideOn()));
                                },
                                padding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 50),
                                textStyle: Poppins_Semi16Button,
                                fillColor: XDColor_blue,
                                splashColor: Colors.blueAccent,
                                highlightColor: Colors.blueAccent,
                                elevation: 0,
                                highlightElevation: 3,
                                shape: StadiumBorder(),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              top: 0,
              child: Container(
                height: size.height * 0.11,
                width: size.width,
                padding: EdgeInsets.only(top: 7),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      XDColor_white,
                      XDColor_none,
                    ],
                    stops: [
                      0.0,
                      1,
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: size.width * 0.04),
                      height: 43,
                      width: 43,
                      child: RawMaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        shape: CircleBorder(),
                        child: SvgPicture.asset(
                            'assets/icons/icon-arrow-back-black.svg'),
                        padding: EdgeInsets.all(2.0),
                        elevation: 0,
                      ),
                    ), //BackButton
                    Container(
                      width: size.width * 0.7,
                      margin: EdgeInsets.only(left: 5, right: size.width * 0.1),
                      child: Container(
                        height: 40.00,
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0.00, 3.00),
                              color: Color(0xff000000).withOpacity(0.16),
                              blurRadius: 6,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(12.00),
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 16, right: 10),
                              child: SvgPicture.asset(
                                  'assets/icons/setdestination short top bar.svg'),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 4),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Get moving with Vielly',
                                    style: Poppins_Maptopbar,
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    'Get moving with Vielly',
                                    style: Poppins_Maptopbar,
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ) //Top BAr Txet
                  ],
                ),
              ),
            ) //Tranparency at top
          ],
        ),
      ),
    );
  }
}
