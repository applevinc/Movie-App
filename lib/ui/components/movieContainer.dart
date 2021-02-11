import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/ui/screens/movieDetails/movieDetail.dart';
import 'package:movie_app/ui/settings/theme/colorTheme.dart';
import 'package:movie_app/viewModels/movieViewModel.dart';
import 'package:sizer/sizer.dart';

class MovieContainer extends StatelessWidget {
  const MovieContainer({
    Key key,
    this.movie,
  }) : super(key: key);

  final MovieViewModel movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
      child: GestureDetector(
        onTap: () => _showMovieDetails(context, movie),
        child: Stack(
          overflow: Overflow.visible,
          children: [
            MovieContainerGreyBox(),
            MoviePoster(movie: movie),
            MovieShortDescription(movie: movie),
          ],
        ),
      ),
    );
  }

  void _showMovieDetails(context, movie) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieDetails(movie: movie),
      ),
    );
  }
}

class MovieContainerGreyBox extends StatelessWidget {
  const MovieContainerGreyBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.0.h,
      width: SizerUtil.orientation == Orientation.portrait ? 100.0.w : 70.0.h,
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

class MovieShortDescription extends StatelessWidget {
  const MovieShortDescription({
    Key key,
    this.movie,
  }) : super(key: key);

  final MovieViewModel movie;

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                movieTitle(movie),
                _movieRating(movie),
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
            genre(),
            SizedBox(height: 5),
            runTime(),
          ],
        ),
      ),
    );
  }

  static Text runTime() {
    return Text(
      'Runtime: 85min',
      style: GoogleFonts.montserrat(color: Color(0xff8D8E96), fontSize: 13),
    );
  }

  static Text genre() {
    return Text(
      'Genre: Drama',
      style: GoogleFonts.montserrat(color: Color(0xff8D8E96), fontSize: 13),
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

  Text _movieRating(MovieViewModel movie) {
    return Text(
      movie.rating.toString(),
      style: GoogleFonts.montserrat(
        color: const Color(0xffFFBB3B),
        fontSize: 17,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static Flexible movieTitle(MovieViewModel movie) {
    return Flexible(
      child: Text(
        movie.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.montserrat(
          color: Color(0xffC1C1C6),
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class MoviePoster extends StatelessWidget {
  const MoviePoster({
    Key key,
    this.movie,
  }) : super(key: key);

  final MovieViewModel movie;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20.0,
      top: -23.0,
      child: Hero(
        tag: 'poster${movie.id}',
        child: CachedNetworkImage(
          imageUrl: movie.poster,
          height: 25.0.h,
          width: 25.0.w,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
            ),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
