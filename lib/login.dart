import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vielly_user/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/rendering.dart';
import 'package:vielly_user/verification.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:flutter/services.dart'; //STATUS BAR

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'GH';
  PhoneNumber number = PhoneNumber(isoCode: 'GH');

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
        body: Form(
          key: formKey,
          child: SafeArea(
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
                              'Get moving with Vielly',
                              style: Poppins_Bold26_OnHead,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ), //TextHEADER
                      Container(
                        margin: EdgeInsets.only(
                            left: size.width * 0.08,
                            right: size.width * 0.08,
                            top: 10),
                        padding: EdgeInsets.only(left: 15),
                        height: 50,
                        width: size.width * 0.84,
                        decoration: BoxDecoration(
                          color: Color(0xfff3f3f3),
                          borderRadius: BorderRadius.circular(12.00),
                        ),
                        child: InternationalPhoneNumberInput(
                          onInputChanged: (PhoneNumber number) {
                            print(number.phoneNumber);
                          },
                          onInputValidated: (bool value) {
                            print(value);
                          },
                          textStyle: Poppins_SetdestinationTextbox,
                          selectorConfig: SelectorConfig(
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                            backgroundColor: Colors.white,
                          ),
                          ignoreBlank: false,
                          autoValidateMode: AutovalidateMode.disabled,
                          selectorTextStyle: Poppins_SetdestinationTextbox,
                          initialValue: number,
                          textFieldController: controller,
                          inputBorder: InputBorder.none,
                          searchBoxDecoration: InputDecoration(
                            labelStyle: Poppins_SetdestinationTextbox,
                            hintText: 'Search by country name or dial code ',
                            hintStyle: Poppins_SetdestinationTextboxHint,
                            border: InputBorder.none,
                          ),
                        ),
                      ), //TextNumber
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: FlatButton(
                          splashColor: Colors.grey,
                          onPressed: () {},
                          shape: StadiumBorder(),
                          child: Text(
                            "Login with email instead",
                            style: Poppins_Medium12Getnew,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Container(
                    width: size.width,
                    margin: EdgeInsets.only(bottom: size.height * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: size.width * 0.08),
                          child: Container(
                            width: size.width * 0.5,
                            child: Text(
                              'By continuing you may receive an SMS for verification',
                              style: Poppins_Regular12,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: size.width * 0.07),
                          height: 50,
                          width: 50,
                          child: RawMaterialButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => VerifyPG()));
                              //formKey.currentState.validate();
                            },
                            shape: CircleBorder(),
                            child:
                                SvgPicture.asset('assets/icons/icon-arrow.svg'),
                            padding: EdgeInsets.all(2.0),
                            fillColor: XDColor_blue,
                            elevation: 0,
                          ),
                        ) //Round Button
                      ],
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
      ),
    );
  }

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');

    setState(() {
      this.number = number;
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
