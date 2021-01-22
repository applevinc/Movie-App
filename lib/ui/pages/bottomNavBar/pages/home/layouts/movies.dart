import 'package:flutter/material.dart';
import 'package:movie_app/ui/images.dart';

class Movies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
          child: Text(
            'Watching',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20),
          child: Container(
            height: 130,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  child: Image.asset(Images.movieBanner1),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  child: Image.asset(Images.movieBanner2),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  child: Image.asset(Images.movieBanner1),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  child: Image.asset(Images.movieBanner2),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  child: Image.asset(Images.movieBanner1),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
