import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/domain/entities/cast.dart';
import 'package:movie_app/ui/components/movieContainer.dart';
import 'package:movie_app/ui/screens/trailer/trailer.dart';
import 'package:movie_app/ui/settings/theme/colorTheme.dart';
import 'package:movie_app/viewModels/movieViewModel.dart';
import 'package:sizer/sizer.dart';

class MovieDetailBody extends StatelessWidget {
  const MovieDetailBody({
    Key key,
    this.movie,
    this.casts,
  }) : super(key: key);

  final MovieViewModel movie;
  final List<Cast> casts;

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
                  MoviePoster(movie: movie),
                  _MovieDetailShortDescription(movie: movie),
                ],
              ),
            ),
            _MovieSynopsis(movie: movie),
            SizedBox(height: 25),
            _WatchTrailerButton(movie: movie),
            MovieCast(casts: casts),
          ],
        ),
      ),
    );
  }
}

class MovieCast extends StatelessWidget {
  const MovieCast({
    Key key,
    this.casts,
  }) : super(key: key);

  final List<Cast> casts;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          height: 33.0.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  'Casts',
                  style: GoogleFonts.montserrat(
                    color: Color(0xffC1C1C6),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Flexible(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  itemCount: casts.length,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CachedNetworkImage(
                              imageUrl: casts[index].image,
                              height: 20.0.h,
                              width: 22.0.w,
                              imageBuilder: (context, imageProvider) => Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.contain,
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
                            Expanded(
                              child: Container(
                                width: 20.0.w,
                                alignment: Alignment.center,
                                child: Text(
                                  casts[index].name,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WatchTrailerButton extends StatelessWidget {
  const _WatchTrailerButton({
    Key key,
    this.movie,
  }) : super(key: key);

  final MovieViewModel movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: FlatButton(
          color: kYellow,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TrailerPage(movie: movie),
              ),
            );
          },
          child: Text(
            'Watch Trailer',
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

class _MovieSynopsis extends StatelessWidget {
  const _MovieSynopsis({
    Key key,
    this.movie,
  }) : super(key: key);

  final MovieViewModel movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
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
            movie.description,
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

class _MovieDetailShortDescription extends StatelessWidget {
  const _MovieDetailShortDescription({
    Key key,
    this.movie,
  }) : super(key: key);

  final MovieViewModel movie;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: SizerUtil.orientation == Orientation.portrait ? 35.0.w : 25.0.h,
      top: 20.0,
      child: Container(
        height: 30.0.h,
        width: 55.0.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieTitle(movie: movie),
            SizedBox(height: 5),
            Row(
              children: [
                MovieQuality(text: '3D', color: Colors.blue),
                SizedBox(width: 5),
                MovieQuality(text: 'IMAX', color: kYellow),
              ],
            ),
            SizedBox(height: 5),
            _MovieGenre(movie: movie),
            SizedBox(height: 5),
            MovieRuntime(movie: movie),
            SizedBox(height: 5),
            starRating(movie),
          ],
        ),
      ),
    );
  }

  Row starRating(MovieViewModel movie) {
    return Row(
      children: [
        RatingBarIndicator(
          rating: movie.rating,
          itemBuilder: (context, index) => Icon(
            Icons.star,
            color: kYellow,
          ),
          itemCount: 5,
          itemSize: 20.0,
        ),
        SizedBox(width: 5),
        Text(
          movie.rating.toString(),
          style: GoogleFonts.montserrat(
            color: const Color(0xffFFBB3B),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _MovieGenre extends StatelessWidget {
  const _MovieGenre({
    Key key,
    this.movie,
  }) : super(key: key);

  final MovieViewModel movie;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Genre: ${movie.genre}',
      style: GoogleFonts.montserrat(
        color: Color(0xff8D8E96),
        fontSize: 13,
      ),
    );
  }
}
