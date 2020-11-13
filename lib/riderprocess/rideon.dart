import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:vielly_user/constants.dart';
import 'package:vielly_user/riderprocess/pay.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:animations/animations.dart';
import 'package:vielly_user/transitions/fade.dart';

class RideOn extends StatelessWidget {
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
        child: Container(),
      ),
    );
  }
}
