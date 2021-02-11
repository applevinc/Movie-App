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
  @override
  void initState() {
    super.initState();
    Provider.of<MovieListViewModel>(context, listen: false).popularMovies();
  }

  @override
  Widget build(BuildContext context) {
    var movies = Provider.of<MovieListViewModel>(context);

    return FutureBuilder<List<Movie>>(
      future: movies.popularMovies(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          return _buildMovieListView(movies);
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
    );
  }

  ListView _buildMovieListView(MovieListViewModel movies) {
    return ListView.builder(
      itemCount: movies.popularMoviesList.length,
      itemBuilder: (context, index) {
        var movie = movies.popularMoviesList[index];
        return MovieContainer(movie: movie);
      },
    );
  }
}
