import 'package:flutter/material.dart';
import 'package:movie_app/ui/pages/bottomNavBar/components/seachBar.dart';
import 'package:movie_app/ui/pages/bottomNavBar/pages/topRated/layouts/body.dart';

class TopRatedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildTopRatedSearchAppBar(),
      extendBodyBehindAppBar: true,
      body: TopRatedBody(),
    );
  }

  PreferredSize _buildTopRatedSearchAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(60.0),
      child: HomeSearchAppBar(title: 'Top Rated Movies'),
    );
  }
}
