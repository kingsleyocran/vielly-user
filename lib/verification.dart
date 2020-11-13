import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vielly_user/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/rendering.dart';
import 'package:vielly_user/transitions/slideright.dart';
import 'package:vielly_user/onboard.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:flutter/services.dart'; //STATUS BAR

class VerifyPG extends StatelessWidget {
  String value = "";

  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      color: Color(0xfff3f3f3),
      border: Border.all(
        width: 0,
        color: XDColor_white,
      ),
      borderRadius: BorderRadius.circular(12.0),
    );
  }

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
        body: SafeArea(
          child: Container(
            width: size.width,
            height: size.height,
            color: XDColor_white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: [
                    Container(
                      height: 50,
                      width: size.width,
                      margin: EdgeInsets.only(top: size.height * 0.04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: size.width * 0.08),
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
                              fillColor: XDColor_white,
                              elevation: 0,
                            ),
                          ),
                        ],
                      ),
                    ), //TopBar
                    Container(
                      margin: EdgeInsets.only(
                        left: size.width * 0.08,
                        right: size.width * 0.08,
                        bottom: 5,
                        top: 35,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Verify your number',
                            style: Poppins_Bold26_OnHead,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ), //TextHEADER
                    Container(
                      height: 50,
                      margin: EdgeInsets.only(
                        top: 10,
                      ),
                      width: size.width * 0.84,
                      child: Container(
                        color: Colors.white,
                        margin: const EdgeInsets.symmetric(horizontal: 0.0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 3, vertical: 4),
                        child: PinPut(
                          textStyle: Poppins_Semi14Black,
                          fieldsCount: 6,
                          onSubmit: (String pin) => _showSnackBar(pin, context),
                          focusNode: _pinPutFocusNode,
                          controller: _pinPutController,
                          submittedFieldDecoration: _pinPutDecoration.copyWith(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          selectedFieldDecoration: _pinPutDecoration,
                          followingFieldDecoration: _pinPutDecoration.copyWith(
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              width: 0,
                              color: XDColor_white,
                            ),
                          ),
                        ),
                      ),
                    ), // Textfield
                    Container(
                      margin: EdgeInsets.only(
                          top: 10,
                          right: size.width * 0.08,
                          left: size.width * 0.08),
                      width: size.width,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                'Did you receive an SMS?',
                                style: Poppins_Regular12,
                              ),
                            ),
                            Container(
                              width: 50,
                              height: 20,
                              child: FlatButton(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
                                splashColor: Colors.grey,
                                onPressed: () {},
                                child: Text(
                                  "Get new",
                                  style: Poppins_Medium12Getnew,
                                ),
                              ),
                            ),
                          ]),
                    ), //Text row
                  ],
                ),

                Container(
                  width: size.width * 0.8,
                  margin: EdgeInsets.only(
                      left: size.width * 0.1,
                      right: size.width * 0.1,
                      bottom: size.width * 0.08),
                  child: RawMaterialButton(
                    key: ValueKey('Verify'),
                    child: Text('Verify'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OnboardPage()));
                    },
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                    textStyle: Poppins_Semi16Button,
                    fillColor: XDColor_blue,
                    splashColor: Colors.redAccent,
                    highlightColor: Colors.redAccent,
                    elevation: 0,
                    highlightElevation: 0,
                    shape: StadiumBorder(),
                  ),
                ), //Button Action

                //RaisedButton(
                //onPressed: () {
                //getPhoneNumber('+15417543010');
                // },
                // child: Text('Update'),
                //),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _showSnackBar(String pin, BuildContext context) {
  final snackBar = SnackBar(
    duration: const Duration(seconds: 3),
    content: Container(
      height: 80.0,
      child: Center(
        child: Text(
          'Pin Submitted. Value: $pin',
          style: const TextStyle(fontSize: 16.0),
        ),
      ),
    ),
    backgroundColor: Colors.green,
  );
  Scaffold.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
