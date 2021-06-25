import 'package:flutter/material.dart';
import '../UI/Login.dart';
import '../UI/Favorites.dart';
import '../UI/Search.dart';
import 'package:hexcolor/hexcolor.dart';
import '../UI/Most Important.dart';
import '../UI/Const UI.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
  
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        drawer: SideDrawer(),
        backgroundColor: HexColor(backgroundColor),
        appBar: new AppBar(
          actions: <Widget>[
            new Image.asset(
              'images/logo2.png',
              width: 35,
              height: 35,
            ),

          ],
          title: Text('Egyptian Tour Guide'),
          centerTitle: true,
          backgroundColor: HexColor(appbarColor),
        ),
        bottomNavigationBar: bottom_NavigationBar(),
        body: new Column(

          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Image.asset(
                'images/logo2.png',
                width: 100,
                height: 100,
              ),
            ),
            new Container(
              alignment: Alignment.center,
              child: new Text(
                "HELLO",
                style: new TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 8, left: 12, right: 12),
              width: double.infinity,
              height: 60,
              child: new RaisedButton(
                //margin: EdgeInsets.only(top: 15, left: 7, right: 7),
                color: HexColor(buttonColor),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => mostImportant()));
                },
                child: new Text(
                  "Most Important Egyptian Monuments",
                  style: new TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 8, left: 12, right: 12),
              width: double.infinity,
              height: 60,
              child: new RaisedButton(
                //margin: EdgeInsets.only(top: 15, left: 7, right: 7),
                color: HexColor(buttonColor),
                onPressed: () {},
                child: new Text(
                  "Most Important Egyptian Monuments",
                  style: new TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 8, left: 12, right: 12),
              width: double.infinity,
              height: 60,
              // ignore: deprecated_member_use
              child: new RaisedButton(
                //margin: EdgeInsets.only(top: 15, left: 7, right: 7),
                color: HexColor(buttonColor),
                onPressed: () {},
                child: new Text(
                  "Most Important Egyptian Monuments",
                  style: new TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 8, left: 12, right: 12),
              width: double.infinity,
              height: 60,
              child: new RaisedButton(
                //margin: EdgeInsets.only(top: 15, left: 7, right: 7),
                color: HexColor(buttonColor),
                onPressed: () {},
                child: new Text(
                  "Most Important Egyptian Monuments",
                  style: new TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
