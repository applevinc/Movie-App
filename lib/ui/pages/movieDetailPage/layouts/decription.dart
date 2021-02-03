import 'package:flutter/material.dart';
import 'package:movie_app/viewModels/movieViewModel.dart';

class MovieDescription extends StatelessWidget {

  const MovieDescription({
    Key key, this.movie,
  }) : super(key: key);

  final MovieViewModel movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Text(
        movie.description,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
