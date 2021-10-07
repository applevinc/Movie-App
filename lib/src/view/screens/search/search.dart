import 'package:flutter/material.dart';
import 'package:movie_app/src/core/constants.dart';
import 'package:movie_app/src/core/style/color.dart';
import 'package:movie_app/src/view/widgets/movie_container.dart';
import 'package:movie_app/src/view/screens/search/movie_search_results_controller.dart';

class MovieSearch extends SearchDelegate {
  final MovieSearchResultsController searchController;

  MovieSearch(this.searchController);

  @override
  ThemeData appBarTheme(BuildContext context) {
    // assert(context != null);
    // final ThemeData theme = Theme.of(context);
    // assert(theme != null);
    return Theme.of(context);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      _SearchIcons(
        icon: Icons.clear,
        onTap: () {
          query = '';

          // To remove all search suggestions(movies)
          // in view model list.
          searchController.clear();
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return _SearchIcons(
        icon: Icons.arrow_back,
        onTap: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: query.isEmpty ? null : searchController.getSearchResuts(query),
      builder: (context, snapshot) {
        var movies = searchController.movies;

        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              var movie = movies[index];

              return MovieContainer(movie: movie);
            },
          );
        }

        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColor.yellow),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: query.isEmpty ? null : searchController.getSearchResuts(query),
      builder: (context, snapshot) {
        var movies = searchController.movies;

        if (query.isEmpty) {
          return Center(
            child: Text(
              'Look for a movie',
              style: kSubHeadline,
            ),
          );
        }

        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              var movie = movies[index];

              return MovieContainer(movie: movie);
            },
          );
        }

        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColor.yellow),
          ),
        );
      },
    );
  }
}

class _SearchIcons extends StatelessWidget {
  const _SearchIcons({
    Key key,
    this.onTap,
    this.icon,
  }) : super(key: key);

  final Function onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          SizedBox(width: 20),
          Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: AppColor.darkGrey,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
