import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DoraInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.13,
      child: Column(
        children: [
          Text(
            '4.0',
            style: TextStyle(fontSize: 33, color: Colors.white),
          ),
          DoraRating(),
          SizedBox(height: 5),
          DoraGenre(),
        ],
      ),
    );
  }
}

class DoraRating extends StatelessWidget {
  const DoraRating({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar(
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
    );
  }
}

class DoraGenre extends StatelessWidget {
  const DoraGenre({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Movies',
          style: _buildTextStyle(),
        ),
        SizedBox(width: 20),
        VerticalDivider(),
        SizedBox(width: 20),
        Text(
          'Adventure',
          style: _buildTextStyle(),
        ),
        SizedBox(width: 20),
        VerticalDivider(),
        SizedBox(width: 20),
        Text(
          'Comedy',
          style: _buildTextStyle(),
        ),
        SizedBox(width: 20),
        VerticalDivider(),
        SizedBox(width: 20),
        Text(
          'Family',
          style: _buildTextStyle(),
        ),
      ],
    );
  }

  TextStyle _buildTextStyle() => TextStyle(color: Colors.white);
}

class VerticalDivider extends StatelessWidget {
  const VerticalDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff7E7E7E),
      height: 13,
      width: 2,
    );
  }
}
