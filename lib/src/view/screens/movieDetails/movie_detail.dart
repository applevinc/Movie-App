import 'package:flutter/material.dart';
import 'package:movie_app/src/domain/entities/movie.dart';
import 'package:movie_app/src/view/screens/movieDetails/layouts/movie_detail_body.dart';
import 'package:movie_app/src/view/widgets/back_app_bar.dart';
import 'package:movie_app/src/view/screens/movieDetails/casts_controller.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({Key key, this.movie}) : super(key: key);

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    var casts = Provider.of<CastController>(context).casts;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildCustomAppBar(context),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Container(
                width: SizerUtil.orientation == Orientation.portrait ? 100.0.w : 100.0.h,
                decoration: moviePosterBackground(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 20.0.h),
                    MovieDetailBody(
                      movie: movie,
                      casts: casts,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration moviePosterBackground() {
    return BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
          Colors.black.withOpacity(0.6),
          BlendMode.darken,
        ),
        image: NetworkImage(movie.poster),
      ),
    );
  }

  PreferredSize _buildCustomAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(60.0),
      child: BackAppBar(
        onBackTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
