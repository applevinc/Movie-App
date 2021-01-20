import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DoraInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Text('4.0', style: TextStyle(fontSize: 33)),
        RatingBar(
          initialRating: 3,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 25,
          ratingWidget: RatingWidget(
            full: Icon(Icons.star, color: Color(0xffFFBB3B)),
            half: Icon(Icons.star_half, color: Color(0xffFFBB3B)),
            empty: Icon(Icons.star_border, color: Color(0xffFFBB3B)),
          ),
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Movies'),
            SizedBox(width: 20),
            Container(
              color: Color(0xff7E7E7E),
              height: 13,
              width: 2,
            ),
            SizedBox(width: 20),
            Text('Adventure'),
            SizedBox(width: 20),
            Container(
              color: Color(0xff7E7E7E),
              height: 13,
              width: 2,
            ),
            SizedBox(width: 20),
            Text('Comedy'),
            SizedBox(width: 20),
            Container(
              color: Color(0xff7E7E7E),
              height: 13,
              width: 2,
            ),
            SizedBox(width: 20),
            Text('Family'),
          ],
        )
      ],
    );
  }
}
