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
  ScrollController _scrollController = ScrollController();

  void initState() {
    super.initState();
    _buildMovies = context.read<UpcomingMoviesViewModel>().getUpcomingMovies();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        //if we are at the bottom of the page
        context.read<UpcomingMoviesViewModel>().getUpcomingMovies();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var movies = Provider.of<UpcomingMoviesViewModel>(context);

    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 1));

        // Turn isRefreshing to true so as to
        // return a new list of movies
        setState(() {
          movies.isRefreshing = true;
        });

        movies.getUpcomingMovies();
      },
      child: FutureBuilder<List<Movie>>(
        future: _buildMovies,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return SizerUtil.orientation == Orientation.portrait
                ? _BuildUpComingMoviesListView(
                    scrollController: _scrollController,
                    moviesProvider: movies,
                  )
                : _BuildUpComingMoviesGridView(
                    moviesProvider: movies,
                    scrollController: _scrollController,
                  );
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
  const _BuildUpComingMoviesListView({
    Key key,
    this.moviesProvider,
    this.scrollController,
  }) : super(key: key);

  final UpcomingMoviesViewModel moviesProvider;
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

class _BuildUpComingMoviesGridView extends StatelessWidget {
  const _BuildUpComingMoviesGridView({
    Key key,
    this.moviesProvider,
    this.scrollController,
  }) : super(key: key);

  final UpcomingMoviesViewModel moviesProvider;
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
