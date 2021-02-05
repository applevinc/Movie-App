import 'package:flutter/material.dart';
import 'package:movie_app/newUI/screens/movieDetails/components/body.dart';
import 'package:movie_app/ui/components/appBar.dart';
import 'package:movie_app/ui/images.dart';
import 'package:sizer/sizer.dart';

class MovieDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildCustomAppBar(context),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Container(
                width: 100.0.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.8),
                      BlendMode.darken,
                    ),
                    image: AssetImage(Images.movieBanner1),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                    MovieDetailBody(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSize _buildCustomAppBar(BuildContext context) {
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
