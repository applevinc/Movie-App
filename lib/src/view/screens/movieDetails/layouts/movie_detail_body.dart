import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/src/core/constants.dart';
import 'package:movie_app/src/core/style/color.dart';
import 'package:movie_app/src/domain/entities/cast.dart';
import 'package:movie_app/src/domain/entities/movie.dart';
import 'package:movie_app/src/view/screens/trailer/trailer.dart';
import 'package:movie_app/src/view/widgets/error_body.dart';
import 'package:movie_app/src/view/widgets/movie_container.dart';
import 'package:movie_app/src/view/screens/movieDetails/casts_controller.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class MovieDetailBody extends StatelessWidget {
  const MovieDetailBody({
    Key key,
    this.movie,
    this.casts,
  }) : super(key: key);

  final MovieEntity movie;
  final List<CastEntity> casts;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColor.darkGrey,
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
                clipBehavior: Clip.none,
                children: [
                  MoviePoster(movie: movie),
                  _MovieDetailShortDescription(movie: movie),
                ],
              ),
            ),
            _MovieSynopsis(movie: movie),
            SizedBox(height: 25),
            _WatchTrailerButton(movie: movie),
            MovieCast(movie: movie),
          ],
        ),
      ),
    );
  }
}

class MovieCast extends StatelessWidget {
  const MovieCast({
    Key key,
    this.movie,
  }) : super(key: key);

  final MovieEntity movie;

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
              _CastFutureBuilder(movie: movie),
            ],
          ),
        ),
      ),
    );
  }
}

class _CastFutureBuilder extends StatefulWidget {
  const _CastFutureBuilder({
    Key key,
    this.movie,
  }) : super(key: key);

  final MovieEntity movie;

  @override
  __CastFutureBuilderState createState() => __CastFutureBuilderState();
}

class __CastFutureBuilderState extends State<_CastFutureBuilder> {
  var _buildCasts;

  @override
  void initState() {
    super.initState();
    _buildCasts = context.read<CastController>().getMovieCastsList(widget.movie.id);
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FutureBuilder<List<CastEntity>>(
        future: _buildCasts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var casts = context.watch<CastController>().casts;

            return _buildCastHorizontalListView(casts);
          } else if (snapshot.hasError) {
            return ErrorBody(
              message: snapshot.error,
            );
          }

          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColor.yellow),
            ),
          );
        },
      ),
    );
  }

  ListView _buildCastHorizontalListView(List<CastEntity> casts) {
    return ListView.builder(
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
                _CastImage(casts: casts, index: index),
                _CastName(casts: casts, index: index),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _CastName extends StatelessWidget {
  const _CastName({
    Key key,
    @required this.casts,
    @required this.index,
  }) : super(key: key);

  final List<CastEntity> casts;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 20.0.w,
        alignment: Alignment.center,
        child: Text(
          casts[index].name,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _CastImage extends StatelessWidget {
  const _CastImage({
    Key key,
    @required this.casts,
    @required this.index,
  }) : super(key: key);

  final List<CastEntity> casts;
  final int index;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
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
    );
  }
}

class _WatchTrailerButton extends StatelessWidget {
  const _WatchTrailerButton({
    Key key,
    this.movie,
  }) : super(key: key);

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(AppColor.yellow),
          ),
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
            style: kSubHeadline.copyWith(
              color: Colors.white,
              fontSize: 11.0.sp,
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

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return (movie.description != null)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  'Introduction',
                  style: kSubHeadline,
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  movie.description,
                  style: GoogleFonts.montserrat(
                    color: Color(0xffC1C1C6),
                    fontSize: 10.0.sp,
                  ),
                ),
              ),
            ],
          )
        : Container();
  }
}

class _MovieDetailShortDescription extends StatelessWidget {
  const _MovieDetailShortDescription({
    Key key,
    this.movie,
  }) : super(key: key);

  final MovieEntity movie;

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
                MovieQuality(text: 'IMAX', color: AppColor.yellow),
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

  Row starRating(MovieEntity movie) {
    return Row(
      children: [
        RatingBarIndicator(
          rating: movie.rating,
          itemBuilder: (context, index) => Icon(
            Icons.star,
            color: AppColor.yellow,
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

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Genre: ${movie.genres}',
      style: GoogleFonts.montserrat(
        color: Color(0xff8D8E96),
        fontSize: 13,
      ),
    );
  }
}
