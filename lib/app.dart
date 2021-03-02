import 'package:flutter/material.dart';
import 'package:movie_app/ui/constants/color.dart';
import 'package:movie_app/ui/screens/home/home.dart';
import 'package:movie_app/viewModels/casts_view_model.dart';
import 'package:movie_app/viewModels/popular_movies_view_model.dart';
import 'package:movie_app/viewModels/upcoming_movies_view_model.dart';
import 'package:movie_app/viewModels/video_view_model.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PopularMoviesViewModel()),
        ChangeNotifierProvider(create: (context) => UpcomingMoviesViewModel()),
        ChangeNotifierProvider(create: (context) => CastsViewModel()),
        ChangeNotifierProvider(create: (context) => VideoViewModel()),
      ],
      child: LayoutBuilder(
        builder: (context, constraints) => OrientationBuilder(
          builder: (context, orientation) {
            SizerUtil().init(constraints, orientation);
            return MaterialApp(
              title: 'Photoplay',
              theme: ThemeData.dark().copyWith(
                scaffoldBackgroundColor: Colors.black,
                accentColor: kYellow,
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
