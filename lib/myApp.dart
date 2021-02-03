import 'package:flutter/material.dart';
import 'package:movie_app/ui/pages/bottomNavBar/events/pageViewState.dart';
import 'package:movie_app/ui/pages/login/login.dart';
import 'package:movie_app/viewModels/movieListViewModel.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PageViewState()),
        ChangeNotifierProvider(create: (context) => MovieListViewModel()),
      ],
      child: MaterialApp(
        title: 'Photoplay',
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}
