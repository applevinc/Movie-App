import 'package:flutter/material.dart';
import 'package:movie_app/ui/images.dart';
import 'package:movie_app/ui/pages/movieDetailPage/movieDetail.dart';

class Watching extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
          child: Text(
            'Watching',
            style: _buildTextStyle(),
          ),
        ),
        SizedBox(height: 5),
        WatchingMovies(),
      ],
    );
  }

  TextStyle _buildTextStyle() {
    return const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }
}

class WatchingMovies extends StatelessWidget {
  const WatchingMovies({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: 130,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetail()));
              },
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
    );
  }
}
