import 'dart:io';

import 'package:decorhome/HEADERS/AppBar/AppBarWidget.dart';
import 'package:decorhome/Models/LineItems.dart';
import 'package:decorhome/enum/ConnectivityStatus.dart';
import 'package:decorhome/services/ConnectivityService.dart';
import 'package:decorhome/ui/PDPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class ItemPage extends StatefulWidget{
  ItemState createState()=>ItemState();
}
class ItemState extends State<ItemPage>{
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  var connection = new ConnectivityService();
  var connectionStatus;
  List<LineItems> lineItemList=[LineItems("image/crockery_set.png","Crockery"),
    LineItems( "image/lamps.jpeg","Lamps"),
    LineItems( "image/mini_table.jpeg","Mini Tables"),
    LineItems( "image/pots.png","Fancy Pots"),
    LineItems( "image/swing chairs.jpeg","Swing Chairs"),
    LineItems( "image/wall_mirror.png","Wall Mirror"),
    LineItems( "image/wall_stickers.png","Wall Stickers"),
    LineItems( "image/cushions_cover.jpeg","Cushions"),
    LineItems("image/perfume_candles.jpeg","Candles"),
    LineItems("image/coffee_mugs.png","Coffee Mugs"),
    LineItems( "image/handwork_emb.png","Embroidery Art"),
    LineItems( "image/coffee_coaster.jpeg","Coffee Coaster"),
    LineItems( "image/photoFrame.png","Photo Frames"),
    LineItems( "image/jhumars.jpg","Ceiling Light"),
    LineItems( "image/acrylicWallArt.jpg","Acrylic WallArt"),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // ignore: unnecessary_statements
    connection.connectionStatusController;

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    connection.connectionStatusController.close();
  }
  @override
  Widget build(BuildContext context) {
    connectionStatus= Platform.isIOS?connection.checkConnectivity1():Provider.of<ConnectivityStatus>(context);
    double height= MediaQuery.of(context).size.height<600?  (MediaQuery.of(context).size.height / 1.23): (MediaQuery.of(context).size.height / 1.53);
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Scaffold(
          appBar: AppBarWidget().myAppBar(context, "Line Item Page", scaffoldKey),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:10.0,right:10,top:10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15),topLeft: Radius.circular(15),bottomLeft: Radius.circular(15)),
                        child: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width/2.3,
                          color: Colors.teal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right:10.0),
                                child: Icon(Icons.sort_sharp,color: Colors.white,size: 25 ,),
                              ),
                              Align(alignment:Alignment.center,child: Text('Sort', style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "PlayfairDisplay",
                                  color: Colors.white
                              ))),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      ClipRRect(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15),topLeft: Radius.circular(15),bottomLeft: Radius.circular(15)),
                        child: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width/2.3,
                          color: Colors.teal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right:10.0),
                                child: Icon(Icons.filter_list,color: Colors.white,size: 25 ,),
                              ),
                              Align(alignment:Alignment.center,child: Text('Filter', style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "PlayfairDisplay",
                                  color: Colors.white
                              ))),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top:10,left: 10,right:10,bottom: 30),
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: MediaQuery.of(context).size.width /height,

                          crossAxisSpacing: 10,
                          mainAxisSpacing: 15

                      ),
                      physics:NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: lineItemList.length,
                      itemBuilder: (BuildContext context,index){
                        return InkWell(
                          onTap: (){
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return PDPage();
                                    }));
                          },
                          child: Card(
                              /*shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),*/
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(topLeft:Radius.circular(10),topRight: Radius.circular(10)),
                                    child: Container(
                                      child: Image.asset(
                                        lineItemList[index].itemImage,
                                      ),
                                    ),

                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                    children: [
                                      Padding(
                                        padding:  EdgeInsets.only(top:5.0,left: 10),
                                        child: Text(lineItemList[index].itemName.toString(),style: TextStyle(fontFamily: "PlayfairDisplay",fontSize: 13,color: Colors.black),),
                                      ),
                                        Padding(
                                          padding:  EdgeInsets.only(top:5.0,right: 5),
                                          child: Icon(LineIcons.heartAlt, color:Colors.teal,size: 15),
                                        ),
                                    ],
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(top:10.0,left:10),
                                    child: Text("₹ 5000".toString(),style: TextStyle(fontFamily: "Helvetica-Condensed",fontSize: 14,color: Colors.black),),
                                  )
                                ],
                              )
                          ),
                        );

                      }),
                )
              ],
            ),
          ),


    ));
  }


}