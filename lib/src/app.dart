import 'package:flutter/material.dart';
import 'package:movie_app/src/core/style/color.dart';
import 'package:movie_app/src/locator.dart';
import 'package:movie_app/src/view/screens/home/controllers/tmbd_genre_list_controller.dart';
import 'package:movie_app/src/view/screens/home/home.dart';
import 'package:movie_app/src/view/screens/movieDetails/casts_controller.dart';
import 'package:movie_app/src/view/screens/home/controllers/popular_movies_controller.dart';
import 'package:movie_app/src/view/screens/home/controllers/upcoming_movies_controller.dart';
import 'package:movie_app/src/view/screens/trailer/movie_trailer_controller.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => backend<GetPopularMoviesController>(),
        ),
        ChangeNotifierProvider(
          create: (context) => backend<GetUpcomingMoviesController>(),
        ),
        ChangeNotifierProvider(
          create: (context) => backend<CastController>(),
        ),
        ChangeNotifierProvider(
          create: (context) => backend<MovieTrailerController>(),
        ),
        ChangeNotifierProvider(
          create: (context) => backend<GenreListController>(),
        ),
      ],
      child: LayoutBuilder(
        builder: (context, constraints) => OrientationBuilder(
          builder: (context, orientation) {
            SizerUtil().init(constraints, orientation);
            return MaterialApp(
              title: 'Photoplay',
              theme: ThemeData.dark().copyWith(
                scaffoldBackgroundColor: AppColor.black,
                primaryColor: AppColor.yellow,
                colorScheme: ColorScheme.fromSwatch().copyWith(
                  secondary: AppColor.yellow,
                ),
                appBarTheme: AppBarTheme(
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: HomePage(),
            );
          },
        ),
      ),
    );
  }
}
