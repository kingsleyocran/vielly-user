import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vielly_user/constants.dart';
import 'package:flutter/rendering.dart';
import 'package:vielly_user/transitions/slideright.dart';
import 'package:vielly_user/home.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:provider/provider.dart';

class OnboardPage extends StatelessWidget {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Provider<OnBoardState>(
      create: (_) => OnBoardState(),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
              color: Color(0xffffffff),
            ), //BackCOntainer

            OnBoard(
              pageController: _pageController,
              onSkip: () {
                Navigator.push(context, SlideRightRoute(page: HomePage()));
              },
              onDone: () {
                Navigator.push(context, SlideRightRoute(page: HomePage()));
              },
              imageHeight: 300,
              imageWidth: 300,
              onBoardData: onBoardData,
              titleStyles: Poppins_Medium16On,
              descriptionStyles: Poppins_Regular12,
              pageIndicatorStyle: PageIndicatorStyle(
                width: 100,
                inactiveColor: XDColor_grey,
                activeColor: XDColor_blue,
                inactiveSize: Size(8, 8),
                activeSize: Size(11, 11),
              ),
              skipButton: FlatButton(
                onPressed: () {
                  Navigator.push(context, SlideRightRoute(page: HomePage()));
                },
                child: Text(
                  "SKIP",
                  style: Poppins_Mediumk14Skip,
                ),
              ),
              nextButton: Consumer<OnBoardState>(
                builder:
                    (BuildContext context, OnBoardState state, Widget child) {
                  return InkWell(
                    onTap: () => _onNextTap(state),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      width: 150,
                      height: 42,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [XDColor_blue, XDColor_blue],
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        state.isLastPage ? "DONE" : "NEXT",
                        style: Poppins_Mediumk14Next,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onNextTap(OnBoardState onBoardState) {
    if (!onBoardState.isLastPage) {
      _pageController.animateToPage(
        onBoardState.page + 1,
        duration: Duration(milliseconds: 250),
        curve: Curves.easeInOutSine,
      );
    } else {}
  }
}

final List<OnBoardModel> onBoardData = [
  OnBoardModel(
    title: "Set your own goals and get better",
    description: "",
    imgUrl: "assets/images/Group 1752@2x.png",
  ),
  OnBoardModel(
    title: "Track your progress with statistics",
    description: "",
    imgUrl: 'assets/images/Group 1750@2x.png',
  ),
  OnBoardModel(
    title: "Create photo comparisons and share your results",
    description: "",
    imgUrl: 'assets/images/Group 1751@2x.png',
  ),
];
