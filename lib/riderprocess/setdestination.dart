import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vielly_user/constants.dart';
import 'package:vielly_user/riderprocess/confirmpickup.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:animations/animations.dart';
import 'package:vielly_user/transitions/fade.dart';
import 'package:page_transition/page_transition.dart';

class SetDestination extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: 56,
                color: Colors.white,
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
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Text(
                        'Set Destination',
                        style: Poppins_PageHeader,
                      ),
                    )
                  ],
                ), //Header
              ), //Header
              Container(
                width: size.width,
                height: 90,
                color: Colors.white,
                margin: EdgeInsets.only(
                    left: size.width * 0.08, right: size.width * 0.08),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 50,
                      child:
                          SvgPicture.asset('assets/icons/setdestination.svg'),
                    ),
                    Container(
                      width: size.width * 0.84 - 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Container(
                              height: 36,
                              padding: EdgeInsets.only(
                                left: 12,
                                right: 12,
                                bottom: 2,
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
                                  hintText: "Current Location",
                                  hintStyle: Poppins_SetdestinationTextboxHint,
                                  border: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(12.0),
                                  ),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                ),
                              ),
                            ),
                          ), //TextBox
                          Container(
                            child: Container(
                              height: 36,
                              padding: EdgeInsets.only(
                                left: 12,
                                right: 12,
                                bottom: 2,
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
                                  hintText: "Where To?",
                                  hintStyle: Poppins_SetdestinationTextboxHint,
                                  border: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(12.0),
                                  ),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                ),
                              ),
                            ),
                          ), //Textbox
                        ],
                      ),
                    ), //Two Textfields
                    Container(
                      width: 50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: 36,
                            width: 36,
                            child: RawMaterialButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.bottomToTop,
                                        child: ConfirmPickup()));
                              },
                              shape: CircleBorder(),
                              child: SvgPicture.asset(
                                  'assets/icons/icon-arrow.svg'),
                              padding: EdgeInsets.all(2.0),
                              fillColor: XDColor_blue,
                              elevation: 0,
                            ),
                          ),
                        ],
                      ),
                    ), //Button
                  ],
                ),
              ), //TEXTFIELDS
              Container(
                width: size.width,
                height: 70,
                margin: EdgeInsets.only(
                  left: size.width * 0.08,
                  right: size.width * 0.08,
                  top: 20,
                ),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 0),
                      child: Text(
                        'How many seats do you need?',
                        style: Poppins_Mediumk14Black,
                      ),
                    ),
                    _InputChipExample(),
                  ],
                ),
              ), //How many
              Container(
                color: Colors.blueGrey,
                width: size.width,
                height: size.height - 350,
                margin: EdgeInsets.only(
                  left: size.width * 0.08,
                  right: size.width * 0.08,
                  top: 0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [],
                ),
              ), //LocationSuggestions
              Container(
                color: Colors.white,
                width: size.width * 0.4,
                height: 30,
                margin: EdgeInsets.only(
                  left: size.width * 0.08,
                  right: size.width * 0.08,
                  top: 0,
                ),
                child: RawMaterialButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/setonmap.svg'),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Text(
                          'Set on map',
                          style: Poppins_Medium16Blue_Setonmap,
                        ),
                      )
                    ],
                  ),
                ),
              ), //Seton map
            ],
          ),
        ),
      ),
    );
  }
}

class _InputChipExample extends StatefulWidget {
  @override
  _InputChipExampleState createState() => new _InputChipExampleState();
}

class _InputChipExampleState extends State<_InputChipExample>
    with TickerProviderStateMixin {
  int _selectedIndex;

  List<String> _options = [
    '        1        ',
    '          2          ',
    '           3           '
  ];

  Widget _buildChips() {
    List<Widget> chips = new List();

    for (int i = 0; i < _options.length; i++) {
      ChoiceChip choiceChip = ChoiceChip(
        selected: _selectedIndex == i,
        label: Text(_options[i], style: Poppins_Choicechips),
        elevation: 00,
        pressElevation: 0,
        backgroundColor: Colors.grey[200],
        selectedColor: XDColor_blue,
        onSelected: (bool selected) {
          setState(() {
            if (selected) {
              _selectedIndex = i;
            }
          });
        },
      );

      chips.add(Padding(padding: EdgeInsets.only(right: 0), child: choiceChip));
    }

    return Row(
      // This next line does the trick.
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: chips,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: <Widget>[
            Container(
              height: 45,
              child: _buildChips(),
            ),
          ],
        ));
  }
}
