import 'package:flutter/material.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/ui/components/movieContainer.dart';
import 'package:movie_app/ui/settings/theme/colorTheme.dart';
import 'package:movie_app/viewModels/upcomingMoviesViewModel.dart';
import 'package:provider/provider.dart';

class BuildUpcomingMovies extends StatefulWidget {
  @override
  _BuildUpcomingMoviesState createState() => _BuildUpcomingMoviesState();
}

class _BuildUpcomingMoviesState extends State<BuildUpcomingMovies> {
  var _buildMovies;

  void initState() {
    super.initState();
    _buildMovies = Provider.of<UpcomingMoviesViewModel>(context, listen: false).getUpcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    var movies = Provider.of<UpcomingMoviesViewModel>(context);

    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 1));
        movies.getUpcomingMovies();
      },
      child: FutureBuilder<List<Movie>>(
        future: _buildMovies,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return _BuildUpComingMoviesList(moviesProvider: movies);
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "${snapshot.error}",
                style: TextStyle(color: Colors.white),
              ),
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

class _BuildUpComingMoviesList extends StatelessWidget {
  const _BuildUpComingMoviesList({Key key, this.moviesProvider}) : super(key: key);

  final UpcomingMoviesViewModel moviesProvider;

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
