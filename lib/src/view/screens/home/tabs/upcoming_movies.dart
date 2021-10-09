import 'package:flutter/material.dart';
import 'package:movie_app/src/core/style/color.dart';
import 'package:movie_app/src/domain/entities/movie.dart';
import 'package:movie_app/src/view/screens/home/controllers/helpers.dart';
import 'package:movie_app/src/view/widgets/error_body.dart';
import 'package:movie_app/src/view/widgets/movie_container.dart';
import 'package:movie_app/src/view/screens/home/controllers/upcoming_movies_controller.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class BuildUpcomingMovies extends StatefulWidget {
  @override
  _BuildUpcomingMoviesState createState() => _BuildUpcomingMoviesState();
}

class _BuildUpcomingMoviesState extends State<BuildUpcomingMovies> {
  var _buildMovies;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    var movieController = context.read<GetUpcomingMoviesController>();
    _buildMovies = movieController.getMovies();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //when we are at the bottom of the page
        movieController.refreshStatus = RefreshStatus.static;
        movieController.getMovies();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var movieController = context.watch<GetUpcomingMoviesController>();

    return RefreshIndicator(
      color: AppColor.yellow,
      onRefresh: () async {
        movieController.refreshStatus = RefreshStatus.refreshing;
        await movieController.getMovies();
      },
      child: FutureBuilder<List<MovieEntity>>(
        future: _buildMovies,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SizerUtil.orientation == Orientation.portrait
                ? _BuildUpComingMoviesListView(
                    scrollController: _scrollController,
                    moviesProvider: movieController,
                  )
                : _BuildUpComingMoviesGridView(
                    moviesProvider: movieController,
                    scrollController: _scrollController,
                  );
          } else if (snapshot.hasError) {
            return ErrorBody(
              message: snapshot.error,
              refresh: () {
                movieController.refreshStatus = RefreshStatus.static;
                _buildMovies = movieController.getMovies();
              },
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
}

class _BuildUpComingMoviesListView extends StatelessWidget {
  const _BuildUpComingMoviesListView({
    Key key,
    this.moviesProvider,
    this.scrollController,
  }) : super(key: key);

  final GetUpcomingMoviesController moviesProvider;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: moviesProvider.movies.length,
      itemBuilder: (context, index) {
        var movie = moviesProvider.movies[index];

        // show loading more indicator at last movie on current page
        if (index == moviesProvider.movies.length - 1) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColor.yellow),
            ),
          );
        }

        return MovieContainer(movie: movie);
      },
    );
  }
}

class _BuildUpComingMoviesGridView extends StatelessWidget {
  const _BuildUpComingMoviesGridView({
    Key key,
    this.moviesProvider,
    this.scrollController,
  }) : super(key: key);

  final GetUpcomingMoviesController moviesProvider;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: scrollController,
      itemCount: moviesProvider.movies.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        var movie = moviesProvider.movies[index];

        // show loading more indicator at last movie on current page
        if (index == moviesProvider.movies.length - 1) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColor.yellow),
            ),
          );
        }

        return MovieContainer(movie: movie);
      },
    );
  }
}
