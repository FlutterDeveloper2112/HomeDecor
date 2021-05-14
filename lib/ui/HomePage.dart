
import 'dart:io';

import 'package:badges/badges.dart';
import 'package:decorhome/HEADERS/Drawer/SideNavigation.dart';
import 'package:decorhome/WishlistPage.dart';
import 'package:decorhome/services/ConnectivityService.dart';
import 'package:decorhome/ui/ProfileUi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import '../utils/BagCount.dart';
import '../ERRORS/error.dart';
import '../HEADERS/AppBar/AppBarWidget.dart';
import 'PageOne.dart';
import '../enum/ConnectivityStatus.dart';

class MainHome extends StatefulWidget {
  String title;

  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  ScrollController hideButtonController;
  var _isVisible;
  int _currentIndex, bagCounter = 1;
  Widget _currentPage;
  List<Widget> _pages = [];

  final connectivity=new ConnectivityService();
  var connectionStatus;
  @override
  void initState() {
    super.initState();
    // ignore: unnecessary_statements
    connectivity.connectionStatusController;
    bottomNavigationController();

  }

  bottomNavigationController(){
    hideButtonController = new ScrollController(initialScrollOffset: 0.0);

    _isVisible = true;
    _pages = [
      PageOne(),
      PageOne(),
      WishlistPage(),
      ProfileUI(),

    ];
    _currentIndex = 0;
    _currentPage = _pages[0];

    // handleDeepLinkLogic();
    // location_bloc.storeLocation();
  }

  @override
  void dispose() {
    super.dispose();
    connectivity.dispose();
  }

  void changeTab(int index) {
    setState(() {
      _currentIndex = index;
      _currentPage = _pages[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    connectionStatus = Platform.isIOS?connectivity.checkConnectivity1():Provider.of<ConnectivityStatus>(context);
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () {
        if(_currentIndex!=0){
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/homePage', (Route<dynamic> route) => false);
        }
        else{
          SystemNavigator.pop();
        }
      },
      child: MediaQuery(
        data:  MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Scaffold(
            backgroundColor: Colors.white,
            key: scaffoldKey,
            appBar: AppBarWidget().myAppBar(context, "AZA", scaffoldKey, webview: ""),
           // body:Center(),
            drawer: Drawer(child: SideNavigation()),
            body:connectionStatus.toString()!="ConnectivityStatus.Offline"? _currentPage:ErrorPage(appBarTitle: "You are offline."),
            bottomNavigationBar: connectionStatus.toString()!="ConnectivityStatus.Offline"?Padding(
              padding: EdgeInsets.only(bottom:Platform.isIOS?22:0),
              child: _bottomNavigationData(context),
            ):ErrorPage(appBarTitle: "You are offline.")
        ),
      ),
    );
  }

  Widget _bottomNavigationData(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height:60.0,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 5),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          onTap: (index) => changeTab(index),
          currentIndex: _currentIndex,
          unselectedFontSize: 12,
          selectedFontSize: 14,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                  width:20,
                    height:20,
                    child: Icon(Icons.home, color: _currentIndex == 0 ? Colors.teal : Colors.grey
                    ),),
              title: Center(
                child: new Text('  Home',
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Helvetica",
                        color: _currentIndex == 0
                            ? Colors.teal
                            : Colors.grey)),
              ),
            ),
            BottomNavigationBarItem(
              icon:Container(
                width:20,
                height:20,
                child: Icon(LineIcons.search, color: _currentIndex == 1 ? Colors.teal : Colors.grey
                ),),
              title: new Text(' Search',
                  style: TextStyle(
                      fontFamily: "Helvetica",
                      fontSize: 12,
                      color: _currentIndex == 1
                          ? Colors.teal
                          : Colors.grey)),
            ),

            BottomNavigationBarItem(
              icon: ValueListenableBuilder(
                valueListenable: BagCount.wishlistCount,
                builder:(context,int value,Widget child ) =>BagCount.wishlistCount.value > 0
                    ?  Badge(
                    shape: BadgeShape.circle,
                    badgeColor: Colors.black,
                    alignment: Alignment.topRight,
                    badgeContent: Text(
                        "${BagCount.wishlistCount.value}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:
                            BagCount.wishlistCount.value > 9
                                ? 10
                                : 12)
                    ),
                    child: Container(
                      width:20,
                      height:20,
                      child: Icon(LineIcons.heartAlt, color: _currentIndex == 2 ? Colors.teal : Colors.grey
                      ),))  : Container(
                  width:20,
                  height:20,
                  child: Icon(LineIcons.heart, color: _currentIndex == 2 ? Colors.teal : Colors.grey
                  ),),
              ),

              title: new Text('  Wishlist',
                  style: TextStyle(
                      fontFamily: "Helvetica",
                      fontSize: 11.5,
                      color: _currentIndex == 2
                          ? Colors.teal
                          : Colors.grey)),
            ),
            BottomNavigationBarItem(
                icon: Container(
                  width:20,
                  height:20,
                  child: Icon(Icons.account_box, color: _currentIndex == 3 ? Colors.teal : Colors.grey
                  ),),
                title: Text('  Profile',
                    style: TextStyle(
                        fontFamily: "Helvetica",
                        fontSize: 12,
                        color: _currentIndex == 3
                            ? Colors.teal
                            : Colors.grey)))
          ],
        ),
      )
    );
  }
}
