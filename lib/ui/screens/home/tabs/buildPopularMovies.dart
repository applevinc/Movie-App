import 'package:flutter/material.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/ui/components/movieContainer.dart';
import 'package:movie_app/ui/screens/home/layout/errorBody.dart';
import 'package:movie_app/ui/settings/theme/colorTheme.dart';
import 'package:movie_app/viewModels/popularMoviesViewModel.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class BuildPopularMovies extends StatefulWidget {
  @override
  _BuildPopularMoviesState createState() => _BuildPopularMoviesState();
}

class _BuildPopularMoviesState extends State<BuildPopularMovies> {
  var _buildMovies;

  void initState() {
    super.initState();
    _buildMovies = context.read<PopularMoviesViewModel>().getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    var movies = Provider.of<PopularMoviesViewModel>(context);

    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 1));
        movies.getPopularMovies();
      },
      child: FutureBuilder<List<Movie>>(
        future: _buildMovies,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return SizerUtil.orientation == Orientation.portrait
                ? _BuildPopularMoviesListView(moviesProvider: movies)
                : _BuildPopularMoviesGridView(moviesProvider: movies);
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
  const _BuildPopularMoviesListView({Key key, this.moviesProvider}) : super(key: key);

  final PopularMoviesViewModel moviesProvider;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: moviesProvider.movies.length,
      itemBuilder: (context, index) {
        var movie = moviesProvider.movies[index];
        return MovieContainer(movie: movie);
      },
    );
  }
}

class _BuildPopularMoviesGridView extends StatelessWidget {
  const _BuildPopularMoviesGridView({Key key, this.moviesProvider}) : super(key: key);

  final PopularMoviesViewModel moviesProvider;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: moviesProvider.movies.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        //crossAxisSpacing: 4.0,
        //mainAxisSpacing: 4.0,
      ),
      itemBuilder: (context, index) {
        var movie = moviesProvider.movies[index];
        return MovieContainer(movie: movie);
      },
    );
  }
}
