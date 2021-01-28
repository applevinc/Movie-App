import 'package:flutter/material.dart';
import 'package:movie_app/ui/pages/bottomNavBar/pages/home/home.dart';
import 'package:movie_app/ui/pages/bottomNavBar/pages/topRated/topRated.dart';

class PageViewState {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  static List<Widget> _pages = <Widget>[
    HomePage(),
    TopRatedPage(),
  ];
  List<Widget> get pages => _pages;

  void onPageTapped(int index) {
    _selectedIndex = index;
  }
}
