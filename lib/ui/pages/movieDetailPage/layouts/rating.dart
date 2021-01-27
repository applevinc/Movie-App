import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieRating extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            '4.0',
            style: TextStyle(
              fontSize: 33,
              color: Colors.white,
            ),
          ),
          MovieStarRating(),
        ],
      ),
    );
  }
}

class MovieStarRating extends StatelessWidget {
  const MovieStarRating({
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
