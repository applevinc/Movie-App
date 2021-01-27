import 'package:flutter/material.dart';
import 'package:movie_app/ui/components/appBar.dart';
import 'package:movie_app/ui/pages/movieDetailPage/layouts/cast.dart';
import 'package:movie_app/ui/pages/movieDetailPage/layouts/decription.dart';

import 'package:movie_app/ui/pages/movieDetailPage/layouts/featureImage.dart';
import 'package:movie_app/ui/pages/movieDetailPage/layouts/rating.dart';
import 'package:movie_app/ui/pages/movieDetailPage/layouts/title.dart';
import 'package:movie_app/ui/pages/movieDetailPage/layouts/watch.dart';

class MovieDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: buildCustomAppBar(context),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: Column(
              children: [
                Stack(
                  overflow: Overflow.visible,
                  children: [
                    FeatureImage(),
                    MovieTitle(),
                  ],
                ),
                MovieRating(),
                MovieDescription(),
                WatchMovie(),
                Cast(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSize buildCustomAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(60.0),
      child: CustomAppBar(
        onBackTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
