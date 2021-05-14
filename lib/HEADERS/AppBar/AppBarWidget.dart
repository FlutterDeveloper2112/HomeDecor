

import 'dart:io';
import 'package:badges/badges.dart';
import 'package:decorhome/enum/ConnectivityStatus.dart';
import 'package:decorhome/services/ConnectivityService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/BagCount.dart';
import '../../utils/ToastMsg.dart';

class AppBarWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final connectivity = new ConnectivityService();
  var connectionStatus;
  @override
  AppBar myAppBar(BuildContext context, String title,
      GlobalKey<ScaffoldState> scaffoldKey,{String webview}) {
    return AppBar(
      centerTitle: true,
      leading: title=="AZA"?Padding(
        padding: EdgeInsets.only(left:10),
        child: InkWell(
          onTap: () {
            connectionStatus = Platform.isIOS
                ? connectivity.checkConnectivity1()
                : Provider.of<ConnectivityStatus>(context,listen: false);
            connectionStatus.toString() != "ConnectivityStatus.Offline"
                ? scaffoldKey.currentState.isDrawerOpen
                ? scaffoldKey.currentState.openEndDrawer()
                : scaffoldKey.currentState.openDrawer()
                : ToastMsg().getInternetFailureMsg(context);

          },
          child: Icon(
            Icons.menu,
            color: Colors.black,
            size: 30,
          ),
        ),
      ):
      InkWell(
        child: Padding(
          padding: EdgeInsets.only(left: 10),
          child: GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Platform.isAndroid?Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 20
            ):Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          title=="AZA"?Expanded(
            child: Center(
                child:InkWell(
                  onTap:(){
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/homePage', (Route<dynamic> route) => false);
    },
                  child: Container(
                    width:20,
                    height:20,
                    child: Icon(Icons.settings_system_daydream
                    ),
                  ),
                )),
          ):
          Expanded(
            child: Center(
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "$title",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "PlayfairDisplay",
                          fontSize: 16.5,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ))),
          ),
        ],
      ),
      automaticallyImplyLeading: false,

      actions: <Widget>[



//SHOPPING BAG
        Stack(
          alignment: Alignment.topRight,
          children: [
            InkWell(
              onTap: (){
                /*connectionStatus = Platform.isIOS
                    ? connectivity.checkConnectivity1()
                    : Provider.of<ConnectivityStatus>(context,listen: false);
                connectionStatus.toString() !=
                    "ConnectivityStatus.Offline"
                    ? Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (__) => new ShoppingBag()))
                    : ToastMsg().getInternetFailureMsg(context);*/
              },
              child: Padding(
                padding: EdgeInsets.only(top: 15,right: 15),
                child:ValueListenableBuilder(
                    valueListenable: BagCount.bagCount,
                    builder:(BuildContext context,int value,Widget child ) => BagCount.bagCount.value>0?Badge(
                      shape: BadgeShape.circle,
                      badgeColor: Colors.black,
                      alignment: Alignment.topLeft,
                      badgeContent: Text("${BagCount.bagCount.value}",style: TextStyle(
                          color: Colors.white,
                          fontSize:
                          BagCount.wishlistCount.value > 9
                              ? 10
                              : 12)),
                      child: GestureDetector(
                        onTap: ()async {
                         /* connectionStatus = Platform.isIOS
                              ? connectivity.checkConnectivity1()
                              : Provider.of<ConnectivityStatus>(context,listen: false);
                          connectionStatus.toString() !=
                              "ConnectivityStatus.Offline"
                              ? Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (__) => new ShoppingBag()))
                              : ToastMsg().getInternetFailureMsg(context);*/
                        },
                        child: Container(
                          width:20,
                          height:20,
                          child: Icon(Icons.shopping_cart_outlined,color: Colors.teal,
                          ),
                        ),
                      ),
                    ):
                    GestureDetector(
                      onTap: ()async {
                      /*  connectionStatus = Platform.isIOS
                            ? connectivity.checkConnectivity1()
                            : Provider.of<ConnectivityStatus>(context,listen: false);
                        connectionStatus.toString() !=
                            "ConnectivityStatus.Offline"
                            ? Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (__) => new ShoppingBag()))
                            : ToastMsg().getInternetFailureMsg(context);*/
                      },
                      child: Container(
                        width:20,
                        height:20,
                        child: Icon(Icons.shopping_cart_outlined,color: Colors.teal,
                        ),
                      ),
                    )
                ),
              ),
            ),

          ],

        ),
      ],
      backgroundColor: Colors.white,
    );
  }


}
