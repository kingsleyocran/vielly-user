import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vielly_user/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/rendering.dart';
import 'package:vielly_user/login.dart';
import 'package:vielly_user/transitions/slideright.dart';
import 'dart:ui';
import 'package:flutter/services.dart'; //STATUS BAR

class GetStartedPage extends StatelessWidget {
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
        backgroundColor: XDColor_white,
        body: Container(
          child: Stack(
            children: [
              Container(
                height: size.height * 0.5,
                width: size.width,
                child: Image.asset(
                  'assets/images/getunder.png',
                  fit: BoxFit.fill,
                  alignment: Alignment.bottomCenter,
                ),
              ), //Under Image

              Container(
                height: size.height,
                width: size.width,
                child: ClipRRect(
                  // make sure we apply clip it properly
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.white.withOpacity(0.4),
                    ),
                  ),
                ),
              ), //Blur Filter

              SafeArea(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: size.width,
                        height: size.height - 350,
                        child: Image.asset(
                          'assets/images/Component 204 – 1.png',
                          fit: BoxFit.contain,
                          alignment: Alignment.bottomCenter,
                        ),
                      ),
                      Container(
                        width: size.width * 0.6,
                        margin: EdgeInsets.only(
                            left: size.width * 0.2,
                            right: size.width * 0.2,
                            bottom: 20),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0.00, 9.00),
                              color: Color(0xff1da1f3).withOpacity(0.40),
                              blurRadius: 32,
                            ),
                          ],
                        ),
                        child: RawMaterialButton(
                          key: ValueKey('Get Started'),
                          child: Text('Get Started'),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 50),
                          textStyle: Poppins_Semi16Button,
                          fillColor: XDColor_blue,
                          splashColor: Colors.redAccent,
                          highlightColor: Colors.redAccent,
                          elevation: 0,
                          highlightElevation: 0,
                          shape: StadiumBorder(),
                        ),
                      ),
                      Container(
                        width: size.width,
                        height: 240,
                        child: SvgPicture.asset(
                          'assets/icons/Layer_x0020_1dfr.svg',
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
