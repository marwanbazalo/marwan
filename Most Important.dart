import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import '../UI/Const UI.dart';

class mostImportant extends StatefulWidget {
  @override
  _mostImportantState createState() => _mostImportantState();
}

class _mostImportantState extends State<mostImportant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      bottomNavigationBar: bottom_NavigationBar(),
      backgroundColor: HexColor(backgroundColor),
      appBar: new AppBar(
        backgroundColor: HexColor(appbarColor),
        title: Text('Most Important Egyptian Monuments'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
       //   StreamBuilder(builder: builder)
        ],
      ),
    );
  }
}
