
import 'dart:async';

import 'package:decorhome/Models/LineItems.dart';
import 'package:decorhome/Models/ProfileListing.dart';
import 'package:decorhome/ui/ItemPage.dart';
import 'package:flutter/material.dart';

class ProfileUI extends StatefulWidget {
  String title;

  ProfileUI({this.title});

  ProfilePage createState() => ProfilePage();
}

class ProfilePage extends State<ProfileUI> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    print("INIT Called");

    super.initState();
  }

  List<ProfileListing> profileList=[
    ProfileListing("Account Details", null),
    ProfileListing("Change Password", null),
    ProfileListing("My Wishlist", null),
    ProfileListing("My Orders", null),
    ProfileListing("Chat with us", null),
    ProfileListing("Others",null),
    ProfileListing("About Us",null),

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
                height: 75,
                child: DrawerHeader(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:  EdgeInsets.only(bottom:3,top:5),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Hi, Shravanti Sunchu',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "PlayfairDisplay",
                                  color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                  ),
                ),

              ),
              SizedBox(
                height: 10,
              ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                    itemCount: profileList.length,
                    itemBuilder: (BuildContext context,index){
                   return  Padding(
                     padding: const EdgeInsets.only(left:20,right:15.0,top:5,bottom: 10),
                     child: Column(
                       children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Align(
                               alignment: Alignment.centerLeft,
                               child: Text(profileList[index].categoryName,
                                   style: TextStyle(
                                       fontSize: 15,
                                       fontWeight: FontWeight.normal,
                                       fontFamily: "PlayfairDisplay",
                                       color: Colors.black)),
                             ),
                             Align(
                               alignment: Alignment.centerLeft,
                               child: Icon(Icons.arrow_forward_ios_outlined,size:18),
                             ),
                           ],
                         ),
                         profileList[index].subCategoryName!=null && profileList[index].subCategoryName.length>0?
                         ListView.builder(
                             shrinkWrap: true,
                             physics: NeverScrollableScrollPhysics(),
                             itemCount: profileList[index].subCategoryName.length,
                             itemBuilder: (BuildContext context,index){
                               return  Padding(
                                 padding: const EdgeInsets.only(left:20,right:15.0,top:5,bottom: 10),
                                 child: Column(
                                   children: [
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [
                                         Align(
                                           alignment: Alignment.centerLeft,
                                           child: Text(profileList[index].subCategoryName[index].subCategory.toString(),
                                               style: TextStyle(
                                                   fontSize: 15,
                                                   fontWeight: FontWeight.normal,
                                                   fontFamily: "PlayfairDisplay",
                                                   color: Colors.black)),
                                         ),
                                         Align(
                                           alignment: Alignment.centerLeft,
                                           child: Icon(Icons.arrow_forward_ios_outlined,size:18),
                                         ),
                                       ],
                                     ),
                                     Container(
                                       height: 15,
                                       child: Divider(thickness: 2,color: Colors.grey[200],),
                                     )
                                   ],
                                 ),
                               );
                             }):Center(),
                         Container(
                           height: 15,
                           child: Divider(thickness: 2,color: Colors.grey[200],),
                         )
                       ],
                     ),
                   );
                }),
              /*  Padding(
                  padding: const EdgeInsets.only(left:20,right:15.0,top:5,bottom: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('My Account',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "PlayfairDisplay",
                                    color: Colors.black)),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Icon(Icons.arrow_forward_ios_outlined,size:18),
                          ),
                        ],
                      ),
                      Container(
                        height: 15,
                        child: Divider(thickness: 2,color: Colors.grey[200],),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:20,right:15.0,top:5,bottom: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Orders',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "PlayfairDisplay",
                                    color: Colors.black)),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Icon(Icons.arrow_forward_ios_outlined,size:18),
                          ),
                        ],
                      ),
                      Container(
                        height: 15,
                        child: Divider(thickness: 2,color: Colors.grey[200],),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:20,right:15.0,top:5,bottom: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Change Password',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "PlayfairDisplay",
                                    color: Colors.black)),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Icon(Icons.arrow_forward_ios_outlined,size:18,color: Colors.black45,),
                          ),
                        ],
                      ),
                      Container(
                        height: 15,
                        child: Divider(thickness: 2,color: Colors.grey[200],),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:20,right:15.0,top:5,bottom: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('My Wishlist',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "PlayfairDisplay",
                                    color: Colors.black)),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Icon(Icons.arrow_forward_ios_outlined,size:18),
                          ),
                        ],
                      ),
                      Container(
                        height: 15,
                        child: Divider(thickness: 2,color: Colors.grey[200],),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:20,right:15.0,top:5,bottom: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Chat with Us',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "PlayfairDisplay",
                                    color: Colors.black)),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Icon(Icons.arrow_forward_ios_outlined,size:18),
                          ),
                        ],
                      ),
                      Container(
                        height: 15,
                        child: Divider(thickness: 2,color: Colors.grey[200],),
                      )
                    ],
                  ),
                ),*/


              SizedBox(
                height: 50,
              )
            ],
          )),
    );
  }


}
