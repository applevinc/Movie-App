import 'package:flutter/cupertino.dart';

class TabBarState with ChangeNotifier {
  int selectedIndex = 0;

  int get getIndex => selectedIndex;

  void setIndex(int index) {
    selectedIndex = index;

    notifyListeners();
  }
}
