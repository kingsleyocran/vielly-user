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
import 'package:im_stepper/main.dart';
import 'package:im_stepper/stepper.dart';

class DriverWait extends StatelessWidget {
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
              color: Colors.grey[400],
            ),

            Positioned(
              child: SlidingUpPanel(
                minHeight: 257,
                maxHeight: 500,
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
                        margin: EdgeInsets.only(
                            left: size.width * 0.3,
                            right: size.width * 0.3,
                            bottom: 10),
                        child: Container(
                          height: 5,
                          decoration: BoxDecoration(
                            color: XDColor_blue,
                            borderRadius: BorderRadius.circular(20.00),
                          ),
                        ),
                      ), //Blue Slide icon
                      Container(
                        height: 60,
                        margin: EdgeInsets.only(
                            left: size.width * 0.08,
                            right: size.width * 0.08,
                            top: 5,
                            bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: size.width * 0.4,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 10,
                                    top: 0,
                                    child: Container(
                                      height: 45,
                                      width: 70,
                                      color: Colors.green,
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    bottom: 0,
                                    child: Container(
                                      height: 17,
                                      width: 21,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            top: 0,
                                            left: 0,
                                            child: SvgPicture.asset(
                                                'assets/icons/seatsstack.svg'),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            right: 0,
                                            child: Container(
                                              height: 12.00,
                                              width: 12.00,
                                              decoration: BoxDecoration(
                                                color: Color(0xff000000),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  '3',
                                                  style:
                                                      Poppins_SliderInfoSmallSeats,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ), //SeatsSmall
                                  Positioned(
                                    left: 85,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Seth',
                                          style: Poppins_SliderInfoDriver,
                                          textAlign: TextAlign.left,
                                        ),
                                        Text(
                                          'Driver name',
                                          style: Poppins_SliderInfoDriverlabel,
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 1,
                                    left: 25,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 7,
                                        vertical: 3,
                                      ),
                                      decoration: BoxDecoration(
                                        color: XDColor_blue,
                                        borderRadius:
                                            BorderRadius.circular(20.00),
                                      ),
                                      child: Text(
                                        'GW 820 P',
                                        style: Poppins_SliderInfoNumberPlate,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ), //Driver Info
                            Container(
                              width: 60,
                              height: 40,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    child: Container(
                                      padding: EdgeInsets.all(2),
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: XDColor_blue,
                                        shape: BoxShape.circle,
                                      ),
                                      child: CircleAvatar(
                                          radius: 20,
                                          backgroundImage: NetworkImage(
                                              'https://via.placeholder.com/140x100')),
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    child: Container(
                                      padding: EdgeInsets.all(2),
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: XDColor_blue,
                                        shape: BoxShape.circle,
                                      ),
                                      child: CircleAvatar(
                                          radius: 20,
                                          backgroundImage: NetworkImage(
                                              'https://via.placeholder.com/140x100')),
                                    ),
                                  ),
                                ],
                              ),
                            ), //Circle Avatar
                            Container(
                              height: 44,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '06.00',
                                    style: Poppins_SliderInfoAmount,
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    '4:15 PM',
                                    style: Poppins_SliderInfoSmalltime,
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
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
                        height: 47,
                        margin: EdgeInsets.only(
                            left: size.width * 0.08,
                            right: size.width * 0.08,
                            top: 10,
                            bottom: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Your ride has been booked',
                              style: Poppins_PageHeader,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Meet your driver in ',
                                  style: Poppins_PageHeader,
                                ),
                                Text(
                                  '04:36',
                                  style: Poppins_PageHeaderBlue,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ), //TextRow
                      Container(
                        color: Colors.white,
                        height: 70,
                        width: size.width,
                        margin: EdgeInsets.only(
                            left: size.width * 0.08,
                            right: size.width * 0.08,
                            top: 0,
                            bottom: 0),
                        child: Center(
                          child: Container(
                            height: 45.00,
                            width: 158.00,
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              border: Border.all(
                                width: 1.5,
                                color: Color(0xff1da1f3),
                              ),
                              borderRadius: BorderRadius.circular(45.00),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Call the driver',
                                  style: Poppins_Mediumk14Black,
                                ),
                                SvgPicture.asset(
                                    'assets/icons/Component 204 – 1.svg'),
                              ],
                            ),
                          ),
                        ),
                      ), //Call Buttom

                      Container(
                        color: Colors.grey,
                        width: size.width,
                        height: 170,
                      ), //Stepper Process
                      Container(
                        color: Colors.black,
                        height: 90,
                      ), //Space to cover stack
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
                            key: ValueKey('Cancel ride'),
                            child: Text('Cancel ride'),
                            onPressed: () {
                              Navigator.push(
                                  context, FadeRoute(page: RideOn()));
                            },
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 50),
                            textStyle: Poppins_Semi16Button,
                            fillColor: Colors.grey[400],
                            splashColor: Colors.grey[500],
                            highlightColor: Colors.grey[500],
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
