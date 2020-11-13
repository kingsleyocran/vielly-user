import 'package:flutter/material.dart';
import 'dart:async';
import 'package:vielly_user/constants.dart';
import 'package:vielly_user/getstarted.dart';
import 'package:vielly_user/transitions/fade.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 7),
        () => Navigator.push(context, FadeRoute(page: GetStartedPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: XDColor_white,
        child: Center(
          child: Container(
            width: 230,
            height: 230,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Layer_x0020_1@2x45.png'),
              ),
            ),
          ),
        ));
  }
}
