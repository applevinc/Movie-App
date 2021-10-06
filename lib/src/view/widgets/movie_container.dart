import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/src/core/style/color.dart';
import 'package:movie_app/src/domain/entities/movie.dart';
import 'package:movie_app/src/view/screens/movieDetails/movie_detail.dart';
import 'package:sizer/sizer.dart';

class MovieContainer extends StatelessWidget {
  const MovieContainer({
    Key key,
    this.movie,
  }) : super(key: key);

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
      child: GestureDetector(
        onTap: () => _showMovieDetails(context, movie),
        child: MovieContainerGreyBox(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              MoviePoster(movie: movie),
              _MovieShortDescription(movie: movie),
            ],
          ),
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
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizerUtil.orientation == Orientation.portrait ? 25.0.h : 70.0.w,
      width: 100.0.w,
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}

class _MovieShortDescription extends StatelessWidget {
  const _MovieShortDescription({
    Key key,
    this.movie,
  }) : super(key: key);

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 20.0,
      top: SizerUtil.orientation == Orientation.portrait ? 5.0.h : 40.0.w,
      child: Container(
        width: SizerUtil.orientation == Orientation.portrait ? 50.0.w : 40.0.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MovieTitle(movie: movie),
                MovieRating(movie: movie),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                MovieQuality(text: '3D', color: Colors.blue),
                SizedBox(width: 5),
                MovieQuality(text: 'IMAX', color: AppColor.yellow),
              ],
            ),
            SizedBox(height: 5),
            MovieGenre(movie: movie),
            SizedBox(height: 5),
            MovieRuntime(movie: movie),
          ],
        ),
      ),
    );
  }
}

class MovieRuntime extends StatelessWidget {
  const MovieRuntime({
    Key key,
    this.movie,
  }) : super(key: key);

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Release Date: ${movie.releaseDate}',
      style: GoogleFonts.montserrat(
        color: Color(0xff8D8E96),
        fontSize: 9.0.sp,
      ),
    );
  }
}

class MovieGenre extends StatelessWidget {
  const MovieGenre({
    Key key,
    this.movie,
  }) : super(key: key);

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return Text(
      (movie.genres != null) ? 'Genre: ${movie.genres}' : 'null',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.montserrat(
        color: Color(0xff8D8E96),
        fontSize: 9.0.sp,
      ),
    );
  }
}

class MovieQuality extends StatelessWidget {
  const MovieQuality({
    Key key,
    this.text,
    this.color,
  }) : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        text,
        style: GoogleFonts.montserrat(fontSize: 9.0.sp),
      ),
    );
  }
}

class MovieTitle extends StatelessWidget {
  const MovieTitle({
    Key key,
    this.movie,
  }) : super(key: key);

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(
        movie.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.montserrat(
          color: Color(0xffC1C1C6),
          fontSize: 11.0.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class MovieRating extends StatelessWidget {
  const MovieRating({
    Key key,
    this.movie,
  }) : super(key: key);

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return Text(
      movie.rating.toString(),
      style: GoogleFonts.montserrat(
        color: const Color(0xffFFBB3B),
        fontSize: 11.0.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class MoviePoster extends StatelessWidget {
  const MoviePoster({
    Key key,
    this.movie,
  }) : super(key: key);

  final MovieEntity movie;

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
