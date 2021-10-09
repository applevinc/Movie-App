import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/src/core/style/color.dart';
import 'package:movie_app/src/locator.dart';
import 'package:movie_app/src/view/screens/home/controllers/tmbd_genre_list_controller.dart';
import 'package:movie_app/src/view/screens/home/tabs/popular_movies.dart';
import 'package:movie_app/src/view/screens/home/tabs/upcoming_movies.dart';
import 'package:movie_app/src/view/screens/search/movie_search_results_controller.dart';
import 'package:movie_app/src/view/screens/search/search.dart';
import 'package:movie_app/src/view/widgets/seach_appbar.dart';
import 'package:provider/provider.dart';

import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<GenreListController>().fetchGenreList();
  }

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: HomeSearchAppBar(
          title: 'MOVIES',
          height: 15.0.h,
          onPressed: () {
            showSearch(
              context: context,
              delegate: MovieSearch(backend<MovieSearchResultsController>()),
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
}
