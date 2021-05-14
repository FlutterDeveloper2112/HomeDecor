import 'dart:convert';
import 'dart:io';

import 'package:decorhome/Models/LineItems.dart';
import 'package:decorhome/ui/ItemPage.dart';
import 'package:flutter/material.dart';

class SideNavigation extends StatefulWidget {
  String title;

  SideNavigation({this.title});

  Navigation createState() => Navigation();
}

class Navigation extends State<SideNavigation> {
    final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    print("INIT Called");

    super.initState();
  }

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
  Widget build(BuildContext context) {
    return SafeArea(
      top:true,
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 105,
                child: DrawerHeader(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween ,

                       children: [
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Padding(
                               padding:  EdgeInsets.only(bottom:3,top:5),
                               child: Align(
                                 alignment: Alignment.centerLeft,
                                 child: Text('Shravanti Sunchu',
                                     style: TextStyle(
                                         fontSize: 17,
                                         fontWeight: FontWeight.normal,
                                         fontFamily: "PlayfairDisplay",
                                         color: Colors.white)),
                               ),
                             ),
                             Padding(
                               padding:  EdgeInsets.only(top:5),
                               child: Align(
                                 alignment: Alignment.centerLeft,
                                 child: Text('sunchushravanti5@gmail.com',
                                     style: TextStyle(
                                         fontSize: 13,
                                         fontWeight: FontWeight.normal,
                                         fontFamily: "Helvetica",
                                         color: Colors.white)),
                               ),
                             ),
                           ],
                         ),


                          Padding(
                           padding:  EdgeInsets.only(),
                           child: ClipRRect(
                             borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15),bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
                             child: Container(
                               height: 30,
                               width:80,

                               color: Colors.white,
                               child: Align(alignment:Alignment.center,child: Text('Rate App', style: TextStyle(
                                   fontSize: 13,
                                   fontWeight:FontWeight.bold,
                                   fontFamily: "PlayfairDisplay",
                                   color: Colors.teal
                               ))),
                             ),
                           ),
                         ),
                       ],
                      ),

                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                  ),
                ),

              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: lineItemList.length,
                  itemBuilder: (BuildContext context,index){
                  return InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                        return ItemPage();
                      }));
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top:5,right:15),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                            child: Container(
                              height: 70,
                              width: 55,

                              child: Padding(
                                padding:  EdgeInsets.only(left:20.0),
                                child: Image.asset(lineItemList[index].itemImage),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding:  EdgeInsets.only(bottom:3,top:5),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(lineItemList[index].itemName,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "PlayfairDisplay",
                                    color: Colors.black)),
                          ),
                        ),
                      ],
                    ),
                  );

              }),

              Padding(
                padding:  EdgeInsets.only(top:20),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15)),
                  child: Container(

                    height: 40,
                    width: 105  ,
                    color: Colors.teal,
                    child: Padding(
                      padding:  EdgeInsets.only(left:20.0),
                      child: Align(alignment:Alignment.centerLeft,child: Text('Logout', style: TextStyle(
                          fontSize: 15,
                          fontFamily: "PlayfairDisplay",
                          color: Colors.white
                      ))),
                    ),
                  ),
                ),
              ),


              SizedBox(
                height: 50,
              )
            ],
          )),
    );
  }


}
