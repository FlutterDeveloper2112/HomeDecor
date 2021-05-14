import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:decorhome/HEADERS/AppBar/AppBarWidget.dart';
import 'package:decorhome/Models/LineItems.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PDPage extends StatefulWidget{
  PDPState createState()=>PDPState();

}
class PDPState extends State<PDPage>{
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final _currentPageNotifier = ValueNotifier<int>(0);
  int totalPages;

  double _scale = 1.0;
  double _previousScale = 1.0;

  List<LineItems> lineItemList=[LineItems("image/crockery_set.png","Crockery"),
    LineItems( "image/lamps.jpeg","Lamps"),
    LineItems( "image/mini_table.jpeg","Mini Tables"),
    LineItems( "image/pots.png","Fancy Pots"),
    LineItems( "image/swing chairs.jpeg","Swing Chairs"),
    LineItems( "image/wall_mirror.png","Wall Mirror"),
  ];
  void initState() {
    totalPages = lineItemList.length;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double height= MediaQuery.of(context).size.height<600?  (MediaQuery.of(context).size.height / 1.3): (MediaQuery.of(context).size.height / 1.6);

    return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        appBar: AppBarWidget().myAppBar(context, "Product", scaffoldKey, webview: ""),
        resizeToAvoidBottomInset: false,
        body: SafeArea(

          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,


              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(top:0.0),
                      child:Container(
                          width: double.infinity,
                          height:height,
                          child: Center(
                            child: PhotoViewGallery.builder(

                                backgroundDecoration: BoxDecoration(color: Colors.transparent),
                                onPageChanged: (i){
                                  _currentPageNotifier.value = i;
                                },
                                itemCount: lineItemList.length, builder: (context,int index){
                              return PhotoViewGalleryPageOptions(
                                imageProvider: AssetImage(
                                  lineItemList[index].itemImage,
                                ),
                                // Contained = the smallest possible size to fit one dimension of the screen
                                minScale: PhotoViewComputedScale.contained * 1,
                                // Covered = the smallest possible size to fit the whole screen
                                maxScale: PhotoViewComputedScale.covered * 2,
                              );
                            }),
                          )

                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, top: 10),
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.teal),
                              child: InkWell(
                                onTap: () {
                                //  Navigator.pop(context);
                                },
                                child: Icon(
                                  LineIcons.heartAlt,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ))),
                    ),

                  ]),

              /*  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start ,
                  children: [

                    Padding(
                      padding:  EdgeInsets.only(top:5,left: 20,right:20,bottom:5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(lineItemList[0].itemName.toString(),style: TextStyle(fontFamily: "PlayfairDisplay",fontSize: 20,color: Colors.black),),
                          Padding(padding: EdgeInsets.only(top: 10),child: _buildCircleIndicator(),)
                        ],
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top:5,left: 20,right:20,bottom:5),
                      child:Text("Price: ₹ 5000",style: TextStyle(fontFamily: "PlayfairDisplay",fontSize: 18,color: Colors.black),),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top:5,left: 20,right:20,bottom:5),
                      child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries",style: TextStyle(fontFamily: "Helvetica",fontSize: 15,color: Colors.black),),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top:5,left: 20,right:20,bottom:5),
                      child:Text("Estimated Delivery : 20th May 20201",style: TextStyle(fontFamily: "PlayfairDisplay",fontSize: 15,color: Colors.black),),
                    ),

                    Padding(
                      padding:  EdgeInsets.only(top:20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15)),
                        child: Container(
                          height: 40,
                          width: 190  ,
                          color: Colors.teal,
                          child: Padding(
                            padding:  EdgeInsets.only(left:20.0),
                            child: Align(alignment:Alignment.centerLeft,child: Text('Recently Viewed', style: TextStyle(
                                fontSize: 15,
                                fontFamily: "PlayfairDisplay",
                                color: Colors.white
                            ))),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top:20,bottom: 30),
                      child: Container(

                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        child: ListView.builder(
                            itemCount: lineItemList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context,index){
                              return InkWell(
                                onTap: (){
                                  Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) {
                                            return PDPage();
                                          }));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right:15.0),
                                  child: Card(
                                    child: Column(
                                      children: [
                                        ClipRect(

                                          child: Container(
                                            width:220,
                                            height: 150,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image:AssetImage(
                                                  lineItemList[index].itemImage,
                                                ),
                                              ),
                                            ),
                                          ),


                                        ),

                                        Padding(
                                            padding:  EdgeInsets.only(top:10.0),
                                            child:Text(lineItemList[index].itemName.toString(),style: TextStyle(fontFamily: "PlayfairDisplay",fontSize: 13,color: Colors.black),))
                                      ],
                                    ),
                                  ),
                                ),
                              );

                            }),
                      ),
                    ),

                    Padding(
                      padding:  EdgeInsets.only(top:15.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                        child: Container(
                          height: 55,
                          width: MediaQuery.of(context).size.width ,
                          color: Colors.teal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(top:10,left: 30,right:20,bottom:5),
                                child:Text("₹ 5000",style: TextStyle(fontWeight:FontWeight.bold,fontFamily: "Helvetica",fontSize: 20,color: Colors.white),),
                              ),
                              Padding(
                                padding:  EdgeInsets.only(right:20.0,top:5),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15),bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
                                  child: Container(
                                    height: 35,
                                    width: 140  ,
                                    color: Colors.white,
                                    child: Align(alignment:Alignment.center,child: Text('Add to Cart', style: TextStyle(
                                        fontSize: 15,
                                        fontWeight:FontWeight.normal,
                                        fontFamily: "PlayfairDisplay",
                                        color: Colors.black
                                    ))),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),








                  ],
                ),*/

              ],
            )
          ),
        ),
      ));
  }

  _buildCircleIndicator() {
    return CirclePageIndicator(
      dotColor: Colors.grey[400],
      selectedDotColor: Colors.teal,
      itemCount: lineItemList.length,
      currentPageNotifier: _currentPageNotifier,
    );
  }

}