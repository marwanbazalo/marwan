import 'dart:ui';
import 'package:egyption_tourism_guide/UI/Login.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../UI/Favorites.dart';
import '../UI/HomePage.dart';
import '../UI/Search.dart';


String appbarColor = "2b4450";
String backgroundColor = "dfebed";
String buttonColor= "497285";

// String appbarColor = "b07946";
// String backgroundColor = "efe4d4";
// String buttonColor= "9d6c54";

//=============================================================================================
//Side Drawer


class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: HexColor(backgroundColor),
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: Container(
                  height: MediaQuery.of(context).size.height / 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            color: HexColor('C4EFE4D4'),
                          ),
                          child: Image.asset(
                            'images/logo2.png',
                            width: 100,
                            height: 100,
                          )),
                      Container(
                          child: new Text(
                        'Egyptian Tour Guide',
                        style: new TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w400),
                      )),
                    ],
                  ),
                ),
              ),
              curve: Curves.easeInCirc,
              decoration: BoxDecoration(
                color: HexColor(appbarColor),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => homePage())),},
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favorites'),
              onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => favorites())),}
            ),
            ListTile(
              leading: Icon(Icons.border_color),
              title: Text('Feedback'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => Login())),},
            ),ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => aboutApp())),},
            ),
          ],
        ),
      ),
    );
  }
}




//=================================================================================================================
// About 



class aboutApp extends StatefulWidget {
  @override
  _aboutAppState createState() => _aboutAppState();
}

class _aboutAppState extends State<aboutApp> {
  @override
  Widget build(BuildContext context) {
    const Key centerKey = ValueKey<String>('bottom-sliver-list');
    return Scaffold(
      backgroundColor: HexColor(backgroundColor),
      body: CustomScrollView(
        // center: centerKey,
        reverse: false,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    transformAlignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: Text(
                      '''
Egyptian Tourism Guide was designed by 

Marwan Mohamed Bazalo

Ahmed Mohamed Abdou

 Mohamed Fakhry Ali
 
  Abdalla Abdellatif ElSaieed
  
 as a graduation Project from FCI-ZU 2021 .''',
                      textAlign:TextAlign.center,
                      textScaleFactor: 2,

                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}



//==========================================================================================================
//Bottom Navigation Bar




int _bottomBarIndex =0;
class bottom_NavigationBar extends StatefulWidget {
  @override
  _bottom_NavigationBarState createState() => _bottom_NavigationBarState();
}

class _bottom_NavigationBarState extends State<bottom_NavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      alignment: Alignment.bottomCenter,
      child: Scaffold(
        bottomNavigationBar: new BottomNavigationBar(
          iconSize: 23,
          selectedFontSize: 12,
          backgroundColor: HexColor(appbarColor),
          fixedColor: HexColor('efe4d4'),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
             label: 'Favorites',
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
              backgroundColor: Colors.black,
            ),
          ],
          onTap: (index) {
            setState(
              () {
                _bottomBarIndex = index;
                if (index == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => homePage()),
                  );
                }
                if (index == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => favorites()),
                  );
                }
                if (index == 2) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => search()),
                  );
                }
              },
            );
          },
          currentIndex: _bottomBarIndex,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}

