import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/viewModels/movieViewModel.dart';

class FeatureImage extends StatelessWidget {
  final MovieViewModel movie;

  const FeatureImage({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          image: CachedNetworkImageProvider(
            movie.fullPosterUrl,
          ),
        ),
      ),
    );
  }
}
