import 'package:flutter/material.dart';
import 'package:movie_app/domain/movie.dart';
import 'package:movie_app/ui/screens/home/components/movieContainer.dart';
import 'package:movie_app/viewModels/movieListViewModel.dart';
import 'package:provider/provider.dart';

class BuildMovies extends StatefulWidget {
  @override
  _BuildMoviesState createState() => _BuildMoviesState();
}

class _BuildMoviesState extends State<BuildMovies> {
  @override
  void initState() {
    super.initState();
    Provider.of<MovieListViewModel>(context, listen: false).popularMovies();
  }

  @override
  Widget build(BuildContext context) {
    var movies = Provider.of<MovieListViewModel>(context);

    return Expanded(
      child: FutureBuilder<List<Movie>>(
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
            child: CircularProgressIndicator(backgroundColor: Color(0xffFFBB3B)),
          );
        },
      ),
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
