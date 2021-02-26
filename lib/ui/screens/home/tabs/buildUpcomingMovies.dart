import 'package:flutter/material.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/ui/constants/color.dart';
import 'package:movie_app/ui/widgets/errorBody.dart';
import 'package:movie_app/ui/widgets/movieContainer.dart';
import 'package:movie_app/viewModels/upcomingMoviesViewModel.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class BuildUpcomingMovies extends StatefulWidget {
  @override
  _BuildUpcomingMoviesState createState() => _BuildUpcomingMoviesState();
}

class _BuildUpcomingMoviesState extends State<BuildUpcomingMovies> {
  var _buildMovies;

  void initState() {
    super.initState();
    _buildMovies = context.read<UpcomingMoviesViewModel>().getUpcomingMovies();
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
            return SizerUtil.orientation == Orientation.portrait
                ? _BuildUpComingMoviesListView(moviesProvider: movies)
                : _BuildUpComingMoviesGridView(moviesProvider: movies);
          } else if (snapshot.hasError) {
            return ErrorBody(
              message: snapshot.error,
              refresh: () {
                setState(() {
                  _buildMovies = _buildMovies = context.read<UpcomingMoviesViewModel>().getUpcomingMovies();
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

class _BuildUpComingMoviesListView extends StatelessWidget {
  const _BuildUpComingMoviesListView({Key key, this.moviesProvider}) : super(key: key);

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

class _BuildUpComingMoviesGridView extends StatelessWidget {
  const _BuildUpComingMoviesGridView({Key key, this.moviesProvider}) : super(key: key);

  final UpcomingMoviesViewModel moviesProvider;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: moviesProvider.movies.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        var movie = moviesProvider.movies[index];
        return MovieContainer(movie: movie);
      },
    );
  }
}
