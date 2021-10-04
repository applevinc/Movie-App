import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/src/core/style/color.dart';
import 'package:movie_app/src/view/screens/home/tabs/popular_movies.dart';
import 'package:movie_app/src/view/screens/home/tabs/upcoming_movies.dart';
import 'package:movie_app/src/view/screens/search/search.dart';
import 'package:movie_app/src/view/widgets/seach_appbar.dart';

import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: _buildHomeSearchAppBar(context),
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

  PreferredSize _buildHomeSearchAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(15.0.h),
      child: HomeSearchAppBar(
        title: 'MOVIES',
        onPressed: () {
          showSearch(
            context: context,
            delegate: MovieSearch(),
          );
        },
        bottom: TabBar(
          indicatorColor: AppColor.yellow,
          tabs: [
            Tab(text: 'Now Popular'),
            Tab(text: 'Upcoming'),
          ],
          labelStyle: GoogleFonts.montserrat(
            color: Color(0xffC1C1C6),
            fontSize: 13.0.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
