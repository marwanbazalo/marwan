import 'dart:ui';
import 'package:flutter/material.dart';
import '../UI/Login.dart';
import 'package:hexcolor/hexcolor.dart';
import '../UI/Const UI.dart';


class favorites extends StatefulWidget {
  // const favourites({Key key}) : super(key: key);

  @override
  _favoritesState createState() => _favoritesState();
}

class _favoritesState extends State<favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      backgroundColor: HexColor(backgroundColor),
      appBar: new AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.filter_list_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
        title: new Text('Favorites'),
        centerTitle: true,
        backgroundColor: HexColor(appbarColor),
      ),

      bottomNavigationBar:bottom_NavigationBar(),
    );
  }
}
