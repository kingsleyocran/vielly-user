import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:vielly_user/constants.dart';
import 'package:vielly_user/riderprocess/addnote.dart';
import 'package:vielly_user/riderprocess/joinride.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:animations/animations.dart';
import 'package:vielly_user/transitions/fade.dart';
import 'package:vielly_user/transitions/scale.dart';
import 'package:vielly_user/transitions/size.dart';

class ConfirmPickup extends StatelessWidget {
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
            ), //Map Goes Here

            Positioned(
              child: SlidingUpPanel(
                minHeight: 310,
                maxHeight: 310,
                renderPanelSheet: false,
                panel: Container(
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
                        0.85,
                        1,
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 30,
                        margin: EdgeInsets.only(
                            left: size.width * 0.08, right: size.width * 0.08),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Confirm pickup spot',
                              style: Poppins_Mediumk14Where,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ), //TextRow
                      Container(
                        color: Colors.white,
                        height: 20,
                        margin: EdgeInsets.only(
                            left: size.width * 0.08, right: size.width * 0.08),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Drag or edit address to set your pickup',
                              style: Poppins_SliderInfo,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ), //TextRow
                      Container(
                        color: Colors.white,
                        height: 38,
                        margin: EdgeInsets.only(
                          left: size.width * 0.08,
                          right: size.width * 0.08,
                          top: 10,
                          bottom: 5,
                        ),
                        child: Container(
                          height: 36,
                          padding: EdgeInsets.only(
                            left: 5,
                            right: 15,
                            bottom: 3,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xfff3f3f3),
                            borderRadius: BorderRadius.circular(7.00),
                          ),
                          child: TextField(
                            textAlignVertical: TextAlignVertical.top,
                            style: Poppins_SetdestinationTextbox,
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                            cursorColor: XDColor_blue,
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 12,
                                  ),
                                  child: SvgPicture.asset(
                                      'assets/icons/Path 402.svg')),
                              hintText: "Pick up location",
                              hintStyle: Poppins_SetdestinationTextboxHint,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ), //TextRow //TextField
                      Container(
                        color: Colors.white,
                        height: 30,
                        margin: EdgeInsets.only(
                            left: size.width * 0.08, right: size.width * 0.08),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'This is the nearest bus stop for pickup',
                              style: Poppins_SliderInfoNearest,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ), //TextRow
                      Container(
                        margin: EdgeInsets.only(
                            left: size.width * 0.08, right: size.width * 0.08),
                        child: Divider(
                          color: Colors.grey[300],
                          height: 5,
                          thickness: 1,
                          indent: 0,
                          endIndent: 0,
                        ),
                      ), //Divider
                      Container(
                        color: Colors.white,
                        height: 40,
                        margin: EdgeInsets.only(
                            left: size.width * 0.08, right: size.width * 0.08),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              color: Colors.white,
                              height: 30,
                              child: RawMaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                      context, ScaleRoute(page: AddNote()));
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                        'assets/icons/cross-1.svg'),
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text(
                                        'Add note for driver',
                                        style: Poppins_SliderInfoblue,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ), //TextRow
                      Container(
                        color: Colors.black,
                        height: 90,
                      ), //Space to cover stack
                    ],
                  ),
                ),
              ),
            ), //SliderPanel

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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Jean Nelson Hall',
                                    style: Poppins_Maptopbar,
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    'UNA Home',
                                    style: Poppins_Maptopbar,
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ), //Top BAr Txet

            Positioned(
              bottom: 0,
              child: Container(
                  width: size.width,
                  height: 90,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: size.width,
                        child: Container(
                          width: size.width * 0.8,
                          margin: EdgeInsets.only(
                              left: size.width * 0.1, right: size.width * 0.1),
                          child: RawMaterialButton(
                            key: ValueKey('Confirm'),
                            child: Text('Confirm'),
                            onPressed: () {
                              Navigator.push(
                                  context, ScaleRoute(page: JoinRide()));
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
                      ),
                    ],
                  )),
            ), //MAin Buton
          ],
        ),
      ),
    );
  }
}
