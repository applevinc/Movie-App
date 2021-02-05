import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/newUI/screens/home/components/movieContainer.dart';
import 'package:movie_app/ui/images.dart';
import 'package:movie_app/ui/settings/theme/colorTheme.dart';

class MovieDetailBody extends StatelessWidget {
  const MovieDetailBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: kContainerColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  MovieDetailPoster(),
                  MovieDetailShortDescription(),
                ],
              ),
            ),
            MovieSynopsis(),
            SizedBox(height: 25),
            BuyNowButton(),
          ],
        ),
      ),
    );
  }
}

class BuyNowButton extends StatelessWidget {
  const BuyNowButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: FlatButton(
          color: kYellow,
          onPressed: () {
            // movie Urls page
          },
          child: Text(
            'Buy Now',
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class MovieSynopsis extends StatelessWidget {
  const MovieSynopsis({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Introduction',
            style: GoogleFonts.montserrat(
              color: Color(0xffC1C1C6),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.',
            style: GoogleFonts.montserrat(
              color: Color(0xffC1C1C6),
              fontSize: 15,
            ),
          ),
        )
      ],
    );
  }
}

class MovieDetailShortDescription extends StatelessWidget {
  const MovieDetailShortDescription({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 20.0,
      top: 20.0,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.55,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieShortDescription.movieTitle(),
            SizedBox(height: 5),
            Row(
              children: [
                MovieShortDescription.movieQuality('3D', Colors.blue),
                SizedBox(width: 5),
                MovieShortDescription.movieQuality('IMAX', kYellow),
              ],
            ),
            SizedBox(height: 5),
            _movieType(text: 'Genre: Drama'),
            SizedBox(height: 5),
            _movieType(text: 'Runtime: 85min'),
            SizedBox(height: 5),
            starRating(),
          ],
        ),
      ),
    );
  }

  Row starRating() {
    return Row(
      children: [
        RatingBarIndicator(
          rating: 8,
          itemBuilder: (context, index) => Icon(
            Icons.star,
            color: kYellow,
          ),
          itemCount: 5,
          itemSize: 20.0,
        ),
        SizedBox(width: 5),
        Text(
          '8.0',
          style: GoogleFonts.montserrat(
            color: const Color(0xffFFBB3B),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Text _movieType({String text}) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
        color: Color(0xff8D8E96),
        fontSize: 13,
      ),
    );
  }
}

class MovieDetailPoster extends StatelessWidget {
  const MovieDetailPoster({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -20,
      child: Image.asset(
        Images.movieBanner1,
      ),
    );
  }
}
