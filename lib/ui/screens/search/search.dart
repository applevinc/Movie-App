import 'package:flutter/material.dart';
import 'package:movie_app/ui/constants/color.dart';
import 'package:movie_app/ui/constants/text.dart';
import 'package:movie_app/ui/widgets/movieContainer.dart';
import 'package:movie_app/viewModels/searchViewModel.dart';

class MovieSearch extends SearchDelegate {
  SearchViewModel _searchViewModel = SearchViewModel();

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme.copyWith(
      primaryColor: Colors.black,
      primaryColorBrightness: Brightness.dark,
    );
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
          _searchViewModel.clear();
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
      future: query.isEmpty ? null : _searchViewModel.getSearchResuts(query),
      builder: (context, snapshot) {
        var movies = _searchViewModel.movies;

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
            valueColor: AlwaysStoppedAnimation<Color>(kYellow),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: query.isEmpty ? null : _searchViewModel.getSearchResuts(query),
      builder: (context, snapshot) {
        var movies = _searchViewModel.movies;

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
            valueColor: AlwaysStoppedAnimation<Color>(kYellow),
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
              color: kContainerColor,
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
