import 'package:flutter/material.dart';
import 'package:strange_sounds/custom_drawer/drawer_user_controller.dart';
import 'package:strange_sounds/custom_drawer/home_drawer.dart';
import 'package:strange_sounds/screens/home.dart';

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
    screenView = HomeScreen();
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
            screenView = HomeScreen();
          });
          break;
        case DrawerIndex.Help:
          setState(() {
            screenView = HomeScreen();
          });
          break;
        case DrawerIndex.FeedBack:
          setState(() {
            screenView = HomeScreen();
          });
          break;
        case DrawerIndex.Invite:
          setState(() {
            screenView = HomeScreen();
          });
          break;
        default:
          break;
      }
    }
  }
}
