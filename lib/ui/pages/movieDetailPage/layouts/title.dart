import 'package:flutter/material.dart';
import 'package:movie_app/viewModels/movieViewModel.dart';

class MovieTitle extends StatelessWidget {
  final MovieViewModel movie;

  const MovieTitle({
    Key key,
    this.movie,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 230,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black.withOpacity(0.0), Colors.black],
            stops: [0, 0.4],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: TitleAndGenre(movie: movie),
      ),
    );
  }
}

class TitleAndGenre extends StatelessWidget {
  const TitleAndGenre({
    Key key,
    this.movie,
  }) : super(key: key);

  final MovieViewModel movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          movie.title,
          style: TextStyle(fontSize: 23, color: Colors.white),
        ),
        Text(
          'Movie  |  Family  |  Comedy  |  Adventure',
          style: TextStyle(fontSize: 12, color: Colors.white),
        ),
      ],
    );
  }
}