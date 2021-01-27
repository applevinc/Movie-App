import 'package:flutter/material.dart';
import 'package:movie_app/ui/images.dart';

class Cast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20),
          child: Text(
            'Cast',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 5),
        CastList(),
      ],
    );
  }
}

class CastList extends StatelessWidget {
  const CastList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: 140,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            SizedBox(width: 15),
            CastItem(),
            CastItem(),
            CastItem(),
            CastItem(),
            CastItem(),
          ],
        ),
      ),
    );
  }
}

class CastItem extends StatelessWidget {
  const CastItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5),
      child: Column(
        children: [
          Image.asset(
            Images.michaelPana,
            color: Color(0xff707070),
          ),
          SizedBox(height: 5),
          Text(
            'Michael Pana',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
