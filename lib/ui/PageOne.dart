

import 'dart:io';

import 'package:decorhome/Models/LineItems.dart';
import 'package:decorhome/enum/ConnectivityStatus.dart';
import 'package:decorhome/services/ConnectivityService.dart';
import 'package:decorhome/ui/ItemPage.dart';
import 'package:decorhome/ui/PDPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageOne extends StatefulWidget{

  PageOneState createState()=> PageOneState();
}
class PageOneState extends State<PageOne>{
  var connection = new ConnectivityService();
  var connectionStatus;
  List<LineItems> lineItemList=[
    LineItems("image/crockery_set.png","Crockery"),
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
    print("HEIGHT: ${MediaQuery.of(context).size.height } ${ MediaQuery.of(context).size.width /
        (MediaQuery.of(context).size.height / 1.3)}");
    double height= MediaQuery.of(context).size.height<600?  (MediaQuery.of(context).size.height / 1.3): (MediaQuery.of(context).size.height / 1.6);
    return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
            Row(
              children: [
                Padding(
                  padding:  EdgeInsets.only(top:10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15)),
                    child: Container(
                      height: 40,
                      width: 200,
                      color: Colors.teal,
                      child: Padding(
                        padding:  EdgeInsets.only(left:20.0),
                        child: Align(alignment:Alignment.centerLeft,child: Text('Categories', style: TextStyle(
                            fontSize: 18,
                            fontFamily: "PlayfairDisplay",
                            color: Colors.white
                        ))),
                      ),
                    ),
                  ),
                ),
              ],
            ),

              Padding(
                padding:  EdgeInsets.only(top:20,left: 10,right:10,bottom:30),
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
                                    return ItemPage();
                                  }));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight: Radius.circular(20)),
                                child: Container(

                                  child: Image.asset(
                                    lineItemList[index].itemImage,
                                  ),
                                ),

                              ),
                              Padding(
                                padding:  EdgeInsets.only(top:10.0),
                                child: Text(lineItemList[index].itemName.toString(),style: TextStyle(fontFamily: "PlayfairDisplay",fontSize: 16,color: Colors.black),),
                              )
                            ],
                          )
                        ),
                      );

                    }),
              )

            ],
          ),
        ));

  }


}