import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'ui/HomePage.dart';
import 'enum/ConnectivityStatus.dart';
import 'services/ConnectivityService.dart';


Future<void> main() async {

    runApp(
        new MaterialApp(
          home: new HomeDecor(),
          debugShowCheckedModeBanner: false,
        )
    );

}
class HomeDecor extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<ConnectivityStatus>(create: (context)=>ConnectivityService().connectionStatusController.stream, initialData: null)
      ],
      child: MaterialApp(
        initialRoute: "/",
        theme: ThemeData(primaryColor: Colors.white),
        home: SplashScreen(),

        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/homePage': (context) => MainHome(),

        },
        navigatorObservers: [RouteObserver(), NavigatorObserver()],
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  startTime() async {

    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (BuildContext context) {
              return MainHome();
            }));

  }
  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  void dispose() {
    super.dispose();
  }



  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<ConnectivityStatus>(create: (context)=>ConnectivityService().connectionStatusController.stream, initialData: null)
      ],
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Scaffold(
            backgroundColor: Colors.black,
            body:  Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration:BoxDecoration(


                    image:DecorationImage(
                      fit: BoxFit.fill,
                      image:  AssetImage("image/splashscreen.jpeg"),

                    )
                  )
                ),
                Positioned(top: 40 ,
                    child: Column(
                      children: [
                        Text("Create Your",
                            softWrap: true,

                            style: TextStyle(
                              // fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.normal,
                                fontSize: 25,
                                fontFamily: "PlayfairDisplay",
                                color: Colors.black)),
                        Padding(
                          padding:  EdgeInsets.only(left:5,top:5.0),
                          child: Text("Happy Space",
                              softWrap: true,

                              style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: "PlayfairDisplay",
                                  color: Colors.black)),
                        ),

                      ],
                    ))
              ],
            )
        ),
      ),

    );
  }

}



