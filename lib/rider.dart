import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vielly_user/constants.dart';
import 'package:vielly_user/riderprocess/setdestination.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:animations/animations.dart';
import 'package:flutter/services.dart'; //STATUS BAR

class RiderPage extends StatefulWidget {
  @override
  State createState() => RiderPageState();
}

class RiderPageState extends State<RiderPage> {
  GoogleMapController mapController;
  double mappadding = 0;

  static final CameraPosition _kInitialPosition = const CameraPosition(
    target: LatLng(24.150, -110.32),
    zoom: 13,
  );

  CameraPosition _position = _kInitialPosition;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // transparent status bar
        systemNavigationBarColor: Colors.black, // navigation bar color
        statusBarIconBrightness: Brightness.dark, // status bar icons' color
        systemNavigationBarIconBrightness:
            Brightness.dark, //navigation bar icons' color
      ),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
              child: GoogleMap(
                padding: EdgeInsets.only(bottom: 230),
                initialCameraPosition: _kInitialPosition,
                onMapCreated: _onMapCreated,
                myLocationEnabled: true,
                mapType: MapType.normal,
                onCameraMove: _updateCameraPosition,
                rotateGesturesEnabled: true,
                scrollGesturesEnabled: true,
                zoomGesturesEnabled: true,
              ),
            ), //Map
            SafeArea(
              child: Stack(
                children: [
                  Positioned(
                      bottom: 0,
                      child: Container(
                        height: 260,
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
                              0.7,
                              1,
                            ],
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: size.width,
                              margin: EdgeInsets.only(
                                left: size.width * 0.08,
                                right: size.width * 0.08,
                                bottom: 5,
                                top: 40,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      'Hey there, Valerie',
                                      style: Poppins_Mediumk14Hey,
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      'Where are you going?',
                                      style: Poppins_Mediumk14Where,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: size.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: size.width * 0.08,
                                    ),
                                    child: OpenContainer(
                                        closedColor: Colors.white,
                                        openColor: Colors.white,
                                        closedElevation: 0,
                                        openElevation: 0,
                                        transitionType:
                                            ContainerTransitionType.fade,
                                        transitionDuration:
                                            const Duration(milliseconds: 200),
                                        closedBuilder: (context, openWidget) {
                                          return InkWell(
                                            child: Container(
                                              height: 40.00,
                                              width: size.width * 0.73,
                                              decoration: BoxDecoration(
                                                color: Color(0xfff3f3f3),
                                                borderRadius:
                                                    BorderRadius.circular(7.00),
                                              ),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                      left: 18,
                                                      right: 18,
                                                      top: 13,
                                                      bottom: 13,
                                                    ),
                                                    child: SvgPicture.asset(
                                                        'assets/icons/Path 402.svg'),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      'Search destination',
                                                      style:
                                                          Poppins_Regular14Search,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                        openBuilder: (context, closedWidget) {
                                          return SetDestination();
                                        }),
                                  ),
                                  Container(
                                    width: size.width * 0.14,
                                    margin: EdgeInsets.only(
                                      right: size.width * 0.05,
                                    ),
                                    child: RawMaterialButton(
                                      onPressed: () {},
                                      shape: CircleBorder(),
                                      child: SvgPicture.asset(
                                          'assets/icons/today-calender-schedule-day-management-31793.svg'),
                                      padding: EdgeInsets.all(2.0),
                                      elevation: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                left: size.width * 0.08,
                                right: size.width * 0.08,
                                top: 10,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 40,
                                    width: size.width * 0.84,
                                    color: Colors.white,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/icons/homeicon.svg'),
                                        SizedBox(width: 15),
                                        Container(
                                          child: Text(
                                            'Add Home',
                                            style: Poppins_Mediumk14Black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ), //Location row
                                  Container(
                                    child: Divider(
                                      color: Colors.grey[300],
                                      height: 5,
                                      thickness: 1,
                                      indent: 0,
                                      endIndent: 0,
                                    ),
                                  ), //Divider
                                  Container(
                                    height: 40,
                                    width: size.width * 0.84,
                                    color: Colors.white,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/icons/workicon.svg'),
                                        SizedBox(width: 15),
                                        Container(
                                          child: Text(
                                            'Add Work',
                                            style: Poppins_Mediumk14Black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ), //Location row
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                  Positioned(
                    top: 0,
                    child: Container(
                      height: size.height * 0.1,
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              right: size.width * 0.05,
                            ),
                            height: 40,
                            width: 110,
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0.00, 1.00),
                                  color: Color(0xff000000).withOpacity(0.07),
                                  blurRadius: 6,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(40.00),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 7),
                                  child: SvgPicture.asset(
                                      'assets/icons/moneychange.svg'),
                                ),
                                Container(
                                  child: Text(
                                    '014.09',
                                    style: Poppins_Mediumk16Topmoney,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            //Tranparency at top
          ],
        ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  void _updateCameraPosition(CameraPosition position) {
    setState(() {
      _position = position;
    });
  } // widgets go here
}

// widgets go here
