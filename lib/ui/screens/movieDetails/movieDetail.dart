import 'package:flutter/material.dart';
import 'package:movie_app/ui/components/backAppBar.dart';
import 'package:movie_app/ui/screens/movieDetails/layouts/movieDetailbody.dart';

import 'package:movie_app/viewModels/movieViewModel.dart';
import 'package:sizer/sizer.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({Key key, this.movie}) : super(key: key);

  final MovieViewModel movie;

  @override
  Widget build(BuildContext context) {
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
                width: 100.0.w,
                decoration: moviePosterBackground(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                    MovieDetailBody(movie: movie),
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
          Colors.black.withOpacity(0.8),
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
