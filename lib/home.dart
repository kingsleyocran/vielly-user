import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vielly_user/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/rendering.dart';
import 'package:vielly_user/profile.dart';
import 'package:vielly_user/community.dart';
import 'package:vielly_user/rider.dart';

import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomePage extends StatelessWidget {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      // This needs to be true if you want to move up the screen when keyboard appears.
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }

  List<Widget> _buildScreens() {
    return [
      CommPage(),
      RiderPage(),
      ProfilePage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Container(
            height: 30,
            width: 30,
            child:
                SvgPicture.asset('assets/icons/feather - message-square.svg')),
        activeColor: CupertinoColors.activeBlue,
        inactiveColor: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Container(
            height: 46,
            width: 46,
            child: SvgPicture.asset(
                'assets/icons/taxi-cab-local-travel-service-ride-32131.svg')),
        activeColor: CupertinoColors.activeBlue,
        inactiveColor: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Container(
          padding: EdgeInsets.all(2),
          height: 37,
          width: 37,
          decoration: BoxDecoration(
            color: XDColor_blue,
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
              radius: 20,
              backgroundImage:
                  NetworkImage('https://via.placeholder.com/140x100')),
        ),
        activeColor: CupertinoColors.activeBlue,
        inactiveColor: CupertinoColors.systemGrey,
      ),
    ];
  }
}
