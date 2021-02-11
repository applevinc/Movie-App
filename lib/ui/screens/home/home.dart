import 'package:flutter/material.dart';
import 'package:movie_app/ui/components/seachAppBar.dart';
import 'package:movie_app/ui/screens/home/components/tabHeaderText.dart';
import 'package:movie_app/ui/screens/home/layouts/buildPopularMovies.dart';
import 'package:movie_app/ui/screens/home/layouts/buildUpcomingMovies.dart';
import 'package:movie_app/ui/settings/theme/colorTheme.dart';
import 'package:sizer/sizer.dart';

class NewHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: _buildTopRatedSearchAppBar(),
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: TabBarView(
            children: [
              BuildPopularMovies(),
              BuildUpcomingMovies(),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSize _buildTopRatedSearchAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(15.0.h),
      child: HomeSearchAppBar(
        title: 'MOVIES',
        bottom: TabBar(
          indicatorColor: kYellow,
          tabs: [
            TabHeaderText(title: 'Now Popular'),
            TabHeaderText(title: 'Upcoming'),
          ],
        ),
      ),
    );
  }
}
