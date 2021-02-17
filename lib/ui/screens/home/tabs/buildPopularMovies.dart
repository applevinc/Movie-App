import 'package:flutter/material.dart';
import 'package:movie_app/domain/movie.dart';
import 'package:movie_app/ui/components/movieContainer.dart';
import 'package:movie_app/ui/settings/theme/colorTheme.dart';
import 'package:movie_app/viewModels/movieListViewModel.dart';
import 'package:provider/provider.dart';

class BuildPopularMovies extends StatefulWidget {
  @override
  _BuildPopularMoviesState createState() => _BuildPopularMoviesState();
}

class _BuildPopularMoviesState extends State<BuildPopularMovies> {
  var _buildMovies;

  void initState() {
    super.initState();
    _buildMovies = Provider.of<MovieListViewModel>(context, listen: false).popularMovies();
  }

  @override
  Widget build(BuildContext context) {
    var movies = Provider.of<MovieListViewModel>(context);

    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 1));
        movies.popularMovies();
      },
      child: FutureBuilder<List<Movie>>(
        future: _buildMovies,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return _BuildPopularMoviesList(movies: movies);
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "${snapshot.error}",
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          return Center(
            child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(kYellow)),
          );
        },
      ),
    );
  }
}

class _BuildPopularMoviesList extends StatelessWidget {
  const _BuildPopularMoviesList({Key key, this.movies}) : super(key: key);

  final MovieListViewModel movies;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.popularMoviesList.length,
      itemBuilder: (context, index) {
        var movie = movies.popularMoviesList[index];
        return MovieContainer(movie: movie);
      },
    );
  }
}
