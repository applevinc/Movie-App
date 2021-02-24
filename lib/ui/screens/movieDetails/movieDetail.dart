import 'package:flutter/material.dart';
import 'package:movie_app/ui/components/backAppBar.dart';
import 'package:movie_app/ui/screens/movieDetails/layouts/movieDetailbody.dart';
import 'package:movie_app/viewModels/castsViewModel.dart';

import 'package:movie_app/viewModels/movieViewModel.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({Key key, this.movie}) : super(key: key);

  final MovieViewModel movie;

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  void initState() {
    super.initState();
    Provider.of<CastsViewModel>(context, listen: false).getMovieCastsList(widget.movie.id);
  }

  @override
  Widget build(BuildContext context) {
    var casts = Provider.of<CastsViewModel>(context).casts;

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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                    MovieDetailBody(
                      movie: widget.movie,
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
        image: NetworkImage(widget.movie.poster),
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
