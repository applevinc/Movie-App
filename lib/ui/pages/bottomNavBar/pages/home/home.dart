import 'package:flutter/material.dart';
import 'package:movie_app/ui/images.dart';
import 'package:movie_app/ui/pages/bottomNavBar/pages/home/layouts/doraInfo.dart';
import 'package:movie_app/ui/pages/bottomNavBar/pages/home/layouts/drawer.dart';
import 'package:movie_app/ui/pages/bottomNavBar/pages/home/layouts/movies.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      body: SafeArea(
        child: ListView(
          children: [
            IconButton(
              icon: Icon(Icons.menu),
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
              color: const Color(0xff7C7C7C),
              onPressed: () => _scaffoldKey.currentState.openDrawer(),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Positioned(
                    top: -50,
                    left: 30,
                    child: Container(
                      //color: Colors.amber,
                      child: Image.asset(
                        Images.doraBanner,
                        height: 360,
                        width: 360,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -55,
                    left: 80,
                    child: Image.asset(
                      Images.doraTitle,
                      height: 230,
                      width: 230,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.13,
              child: DoraInfo(),
            ),
            Movies(),
          ],
        ),
      ),
    );
  }
}
