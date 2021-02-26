import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/ui/constants/color.dart';

import 'package:movie_app/ui/screens/home/tabs/buildPopularMovies.dart';
import 'package:movie_app/ui/screens/home/tabs/buildUpcomingMovies.dart';
import 'package:movie_app/ui/widgets/seachAppBar.dart';

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
        bottom: TabBar(
          indicatorColor: kYellow,
          tabs: [
            Tab(text: 'Now Popular'),
            Tab(text: 'Upcoming'),
          ],
          labelStyle: GoogleFonts.montserrat(
            color: Color(0xffC1C1C6),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
