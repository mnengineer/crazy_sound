import 'package:flutter/material.dart';
import 'package:strange_sounds/custom_drawer/drawer_user_controller.dart';
import 'package:strange_sounds/custom_drawer/home_drawer.dart';
import 'package:strange_sounds/screens/category/category_home.dart';
import 'package:strange_sounds/screens/drawer/about.dart';
import 'package:strange_sounds/screens/drawer/review.dart';
import 'package:strange_sounds/screens/drawer/share.dart';

class NavigationHomeScreen extends StatefulWidget {
  const NavigationHomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NavigationHomeScreenState();
  }
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget? screenView;
  DrawerIndex? drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = const CategoryHomeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      switch (drawerIndex) {
        case DrawerIndex.HOME:
          setState(() {
            screenView = const CategoryHomeScreen();
          });
          break;
        case DrawerIndex.SHARE:
          setState(() {
            screenView = const ShareScreen();
          });
          break;
        case DrawerIndex.REVIEW:
          setState(() {
            screenView = ReviewScreen();
          });
          break;
        case DrawerIndex.ABOUT:
          setState(() {
            screenView = const AboutScreen();
          });
          break;
        default:
          break;
      }
    }
  }
}
