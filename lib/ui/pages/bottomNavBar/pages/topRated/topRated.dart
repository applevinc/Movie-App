import 'package:flutter/material.dart';
import 'package:movie_app/ui/images.dart';
import 'package:movie_app/ui/pages/bottomNavBar/components/seachBar.dart';

class TopRatedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: _buildTopRatedSearchAppBar(),
        extendBodyBehindAppBar: true,
        body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(100, (index) {
            return GestureDetector(
              onTap: () {
                // go to movie detail
              },
              child: Image.asset(
                Images.movieBanner1,
                fit: BoxFit.fill,
              ),
            );
          }),
        ),
      ),
    );
  }

  PreferredSize _buildTopRatedSearchAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(60.0),
      child: HomeSearchAppBar(title: 'Top Rated Movies'),
    );
  }
}
