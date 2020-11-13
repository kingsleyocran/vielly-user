import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vielly_user/constants.dart';
import 'package:vielly_user/riderprocess/joinride.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:animations/animations.dart';
import 'package:vielly_user/transitions/fade.dart';

class AddNote extends StatefulWidget {
  @override
  AddNoteClassState createState() => new AddNoteClassState();
}

class AddNoteClassState extends State<AddNote> with TickerProviderStateMixin {
  var tags = [
    "I'm wearing",
    "I'm infront of",
    "I'm at the corner of",
    "You'll be picking up",
  ];

  int _selectedIndex;

  generate_tags() {
    return tags.map((tag) => get_chip(tag)).toList();
  }

  get_chip(name) {
    return ChoiceChip(
      selected: false,
      label: Text("${name}", style: Poppins_Choicechips),
      elevation: 00,
      pressElevation: 0,
      backgroundColor: Colors.grey[200],
      selectedColor: XDColor_blue,
      onSelected: (bool selected) {
        setState(() {
          if (selected) {}
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      ],
                    ), //Header
                  ),
                  Container(
                    margin: EdgeInsets.only(left: size.width * 0.08),
                    child: Text(
                      'Add note for driver',
                      style: Poppins_PageHeader,
                    ),
                  ), //Page Header text
                  Container(
                    color: Colors.white,
                    height: 40,
                    margin: EdgeInsets.only(
                      left: size.width * 0.08,
                      right: size.width * 0.08,
                      top: 15,
                      bottom: 5,
                    ),
                    child: Container(
                      height: 36,
                      padding: EdgeInsets.only(
                        left: 15,
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
                          hintText: "Pick up note",
                          hintStyle: Poppins_SetdestinationTextboxHint,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(
                      left: size.width * 0.08,
                      right: size.width * 0.08,
                      top: 5,
                      bottom: 5,
                    ),
                    child: Wrap(
                      spacing: 8.0, // gap between adjacent chips
                      runSpacing: 0, // gap between lines
                      children: <Widget>[...generate_tags()],
                    ),
                  ),
                ],
              ), //TopElements
              Container(
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
                            key: ValueKey('Add note'),
                            child: Text('Add note'),
                            onPressed: () {
                              Navigator.pop(context);
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
            ],
          ),
        ),
      ),
    );
  }
}
