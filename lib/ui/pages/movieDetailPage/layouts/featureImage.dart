import 'package:flutter/material.dart';
import 'package:movie_app/ui/images.dart';

class FeatureImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          image: AssetImage(Images.movieFeatureImg),
        ),
      ),
    );
  }
}