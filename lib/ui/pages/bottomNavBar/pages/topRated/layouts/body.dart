import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/domain/movie.dart';
import 'package:movie_app/ui/pages/movieDetailPage/movieDetail.dart';
import 'package:movie_app/viewModels/movieListViewModel.dart';
import 'package:provider/provider.dart';

class TopRatedBody extends StatefulWidget {
  @override
  _TopRatedBodyState createState() => _TopRatedBodyState();
}

class _TopRatedBodyState extends State<TopRatedBody> {
  @override
  void initState() {
    super.initState();
    Provider.of<MovieListViewModel>(context, listen: false).newMovies();
  }

  @override
  Widget build(BuildContext context) {
    var movies = Provider.of<MovieListViewModel>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: FutureBuilder<List<Movie>>(
        future: movies.newMovies(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return _buildGridView(movies);
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

  GridView _buildGridView(MovieListViewModel movies) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: movies.movies.length,
      itemBuilder: (BuildContext context, int index) {
        final movie = movies.movies[index];
        return GestureDetector(
          onTap: () {
            _showMovieDetails(context, movie);
          },
          child: Container(
            child: CachedNetworkImage(
              imageUrl: movie.fullPosterUrl,
              placeholder: (context, url) {
                return Center(child: CircularProgressIndicator(backgroundColor: Color(0xffFFBB3B)));
              },
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        );
      },
    );
  }

  void _showMovieDetails(context, movie) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MovieDetail(movie: movie);
    }));
  }
}
