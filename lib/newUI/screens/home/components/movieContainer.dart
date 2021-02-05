import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/newUI/screens/movieDetails/movieDetail.dart';
import 'package:movie_app/ui/images.dart';
import 'package:movie_app/ui/settings/theme/colorTheme.dart';
import 'package:sizer/sizer.dart';

class MovieContainer extends StatelessWidget {
  const MovieContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetails()));
        },
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Container(
              height: 25.0.h,
              width: SizerUtil.orientation == Orientation.portrait ? 100.0.w : 70.0.h,
              decoration: BoxDecoration(
                color: Colors.grey[850],
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            MoviePoster(),
            MovieShortDescription(),
          ],
        ),
      ),
    );
  }
}

class MovieShortDescription extends StatelessWidget {
  const MovieShortDescription({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 20.0,
      top: 5.0.h,
      child: Container(
        width: SizerUtil.orientation == Orientation.portrait ? 50.0.w : 40.0.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                movieTitle(),
                _movieRating(),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                movieQuality('3D', Colors.blue),
                SizedBox(width: 5),
                movieQuality('IMAX', kYellow),
              ],
            ),
            SizedBox(height: 5),
            Text(
              'Genre: Drama',
              style: GoogleFonts.montserrat(color: Color(0xff8D8E96), fontSize: 13),
            ),
            SizedBox(height: 5),
            Text(
              'Runtime: 85min',
              style: GoogleFonts.montserrat(color: Color(0xff8D8E96), fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }

  static Container movieQuality(String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        text,
        style: GoogleFonts.montserrat(fontSize: 13),
      ),
    );
  }

  Text _movieRating() {
    return Text(
      '10',
      style: GoogleFonts.montserrat(
        color: const Color(0xffFFBB3B),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static SizedBox movieTitle() {
    return SizedBox(
      child: Text(
        'Movie Title',
        style: GoogleFonts.montserrat(
          color: Color(0xffC1C1C6),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class MoviePoster extends StatelessWidget {
  const MoviePoster({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20.0,
      top: -10.0,
      child: Image.asset(
        Images.movieBanner1,
      ),
    );
  }
}
