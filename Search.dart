//import 'dart:html';
//import 'dart:ui';
import 'package:flutter/material.dart';
import '../UI/Login.dart';
import 'package:hexcolor/hexcolor.dart';
import '../UI/Const UI.dart';


class search extends StatefulWidget {
  @override
  _searchState createState() => _searchState();
}

class _searchState extends State<search> {
  var searchKey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      backgroundColor: HexColor(backgroundColor),
      appBar: new AppBar(
        title: new Text('Search'),
        centerTitle: true,
        backgroundColor: HexColor(appbarColor),
      ),
      bottomNavigationBar: bottom_NavigationBar(),
     body: Column(
       children: [
         Padding(
           padding: const EdgeInsets.all(15.0),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               SizedBox(
                 width: MediaQuery.of(context).size.width,
                 child: new TextField(
                   controller: searchKey,
                   decoration: new InputDecoration(
                     hintText: 'Search Here',
                     icon: new Icon(Icons.search_sharp),
                   ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(top:8.0),
                 child: RaisedButton(
                   color: HexColor(buttonColor),

                   shape: new RoundedRectangleBorder(
                       borderRadius:
                       new BorderRadius.circular(30.0)),
                   onPressed: () {
                   },
                   child: new Text('Search',
                       style: new TextStyle(
                         color: Colors.white,
                         fontSize: 20,
                       )),

                 ),
               ),
             ],
           ),
         ),
       ],
     ),
    );
  }
}
