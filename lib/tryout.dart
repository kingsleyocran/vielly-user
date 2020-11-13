import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vielly_user/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/rendering.dart';
import 'package:vielly_user/transitions/slideright.dart';
import 'package:vielly_user/onboard.dart';
import 'package:pinput/pin_put/pin_put.dart';

class VerifyPG extends StatelessWidget {
  String value = "";

  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(
        width: 2.00,
        color: Color(0xff1da1f3),
      ),
      borderRadius: BorderRadius.circular(12.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: XDColor_white,
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  height: size.height * 0.9,
                  width: size.width,
                  margin: EdgeInsets.only(bottom: size.height * 0.1),
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.00, 10.00),
                        color: Color(0xff000000).withOpacity(0.08),
                        blurRadius: 30,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(36.00),
                      bottomRight: Radius.circular(36.00),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: size.width * 0.15,
                        child: Container(
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
                            fillColor: XDColor_white,
                            elevation: 0,
                          ),
                        ),
                      ), //Previous Screen Button

                      Positioned(
                          bottom: 0,
                          child: Container(
                            margin: EdgeInsets.only(bottom: size.width * 0.1),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: size.width * 0.1,
                                      right: size.width * 0.1,
                                      bottom: 15,
                                    ),
                                    width: size.width,
                                    child: Text(
                                      'Verify your number',
                                      style: Poppins_Bold26_OnHead,
                                      textAlign: TextAlign.left,
                                    ),
                                  ), //Header Verify

                                  Container(
                                    height: 50,
                                    margin: EdgeInsets.only(
                                        bottom: 10,
                                        left: size.width * 0.1,
                                        right: size.width * 0.1),
                                    width: size.width * 0.8,
                                    child: Container(
                                      color: Colors.white,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 0.0),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4.0, vertical: 4),
                                      child: PinPut(
                                        textStyle: Poppins_Semi14Black,
                                        fieldsCount: 6,
                                        onSubmit: (String pin) =>
                                            _showSnackBar(pin, context),
                                        focusNode: _pinPutFocusNode,
                                        controller: _pinPutController,
                                        submittedFieldDecoration:
                                            _pinPutDecoration.copyWith(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        selectedFieldDecoration:
                                            _pinPutDecoration,
                                        followingFieldDecoration:
                                            _pinPutDecoration.copyWith(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          border: Border.all(
                                            width: 2,
                                            color: XDColor_blue,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ), // Textfield

                                  Container(
                                    margin: EdgeInsets.only(
                                        bottom: size.width * 0.50),
                                    width: size.width,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: size.width * 0.1),
                                            child: Text(
                                              'Did you receive an SMS?',
                                              style: Poppins_Regular12,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                right: size.width * 0.07),
                                            child: FlatButton(
                                              splashColor: Colors.grey,
                                              onPressed: () {},
                                              shape: StadiumBorder(),
                                              child: Text(
                                                "Get new",
                                                style: Poppins_Medium12Getnew,
                                              ),
                                            ),
                                          ),
                                        ]),
                                  ), //GEt new

                                  Container(
                                    width: size.width,
                                    child: Container(
                                      width: size.width * 0.8,
                                      margin: EdgeInsets.only(
                                          left: size.width * 0.1,
                                          right: size.width * 0.1),
                                      child: RawMaterialButton(
                                        key: ValueKey('Verify'),
                                        child: Text('Verify'),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    OnboardPage()),
                                          );
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
                                  ) //Verify Button
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                ), //Box background
              ),
              //Center image
            ],
          ),
        ));
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
