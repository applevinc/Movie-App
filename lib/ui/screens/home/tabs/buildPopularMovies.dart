import 'package:flutter/material.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/ui/constants/color.dart';
import 'package:movie_app/ui/widgets/errorBody.dart';
import 'package:movie_app/ui/widgets/movieContainer.dart';
import 'package:movie_app/viewModels/popularMoviesViewModel.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class BuildPopularMovies extends StatefulWidget {
  @override
  _BuildPopularMoviesState createState() => _BuildPopularMoviesState();
}

class _BuildPopularMoviesState extends State<BuildPopularMovies> {
  var _buildMovies;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _buildMovies = context.read<PopularMoviesViewModel>().getPopularMovies();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        //if we are at the bottom of the page
        context.read<PopularMoviesViewModel>().getPopularMovies();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var movies = Provider.of<PopularMoviesViewModel>(context);

    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 1));

        // Turn isRefreshing to true so as to
        // return a new list of movies
        setState(() {
          movies.isRefreshing = true;
        });

        movies.getPopularMovies();
      },
      child: FutureBuilder<List<Movie>>(
        future: _buildMovies,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return SizerUtil.orientation == Orientation.portrait
                ? _BuildPopularMoviesListView(
                    scrollController: _scrollController,
                    moviesProvider: movies,
                  )
                : _BuildPopularMoviesGridView(
                    moviesProvider: movies,
                    scrollController: _scrollController,
                  );
          } else if (snapshot.hasError) {
            return ErrorBody(
              message: snapshot.error,
              refresh: () {
                setState(() {
                  _buildMovies = context.read<PopularMoviesViewModel>().getPopularMovies();
                });
              },
            );
          }

          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(kYellow),
            ),
          );
        },
      ),
    );
  }
}

class _BuildPopularMoviesListView extends StatelessWidget {
  const _BuildPopularMoviesListView({
    Key key,
    this.moviesProvider,
    this.scrollController,
  }) : super(key: key);

  final PopularMoviesViewModel moviesProvider;
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
              valueColor: AlwaysStoppedAnimation<Color>(kYellow),
            ),
          );
        }

        return MovieContainer(movie: movie);
      },
    );
  }
}

class _BuildPopularMoviesGridView extends StatelessWidget {
  const _BuildPopularMoviesGridView({
    Key key,
    this.moviesProvider,
    this.scrollController,
  }) : super(key: key);

  final PopularMoviesViewModel moviesProvider;
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
              valueColor: AlwaysStoppedAnimation<Color>(kYellow),
            ),
          );
        }

        return MovieContainer(movie: movie);
      },
    );
  }
}
