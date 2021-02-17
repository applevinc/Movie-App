import 'package:flutter/material.dart';
import 'package:movie_app/domain/movie.dart';
import 'package:movie_app/ui/components/movieContainer.dart';
import 'package:movie_app/ui/settings/theme/colorTheme.dart';
import 'package:movie_app/viewModels/movieListViewModel.dart';
import 'package:provider/provider.dart';

class BuildUpcomingMovies extends StatefulWidget {
  @override
  _BuildUpcomingMoviesState createState() => _BuildUpcomingMoviesState();
}

class _BuildUpcomingMoviesState extends State<BuildUpcomingMovies> {
  var _buildMovies;

  void initState() {
    super.initState();
    _buildMovies = Provider.of<MovieListViewModel>(context, listen: false).upcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    var movies = Provider.of<MovieListViewModel>(context);

    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 1));
        Provider.of<MovieListViewModel>(context, listen: false).upcomingMovies();
      },
      child: FutureBuilder<List<Movie>>(
        future: _buildMovies,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return _BuildUpComingMoviesList(movies: movies);
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

class _BuildUpComingMoviesList extends StatelessWidget {
  const _BuildUpComingMoviesList({Key key, this.movies}) : super(key: key);

  final MovieListViewModel movies;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.popularMoviesList.length,
      itemBuilder: (context, index) {
        var movie = movies.upcomingMoviesList[index];
        return MovieContainer(movie: movie);
      },
    );
  }
}
