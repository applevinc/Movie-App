import 'package:flutter/material.dart';

class MovieTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 230,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white.withOpacity(0.0), Color(0xfff5f5f5)],
            stops: [0, 0.4],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Dora and the lost city of gold',
              style: TextStyle(
                fontSize: 23,
                color: Color(0xff030303),
              ),
            ),
            Text(
              'Movie  |  Family  |  Comedy  |  Adventure',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xff030303),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
