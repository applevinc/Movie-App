import 'package:flutter/material.dart';
import 'package:movie_app/ui/images.dart';
import 'package:movie_app/ui/pages/bottomNavBar/pages/home/layouts/doraInfo.dart';
import 'package:movie_app/ui/pages/bottomNavBar/pages/home/layouts/movies.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Flexible(
              flex: 5,
              child: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Positioned(
                    child: Image.asset(
                      Images.doraBanner,
                      height: 360,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  Positioned(
                    bottom: -75,
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
            Flexible(flex: 2, child: DoraInfo()),
            Flexible(flex: 2, child: Movies()),
          ],
        ),
      ),
    );
  }
}
