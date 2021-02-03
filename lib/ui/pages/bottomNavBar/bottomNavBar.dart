import 'package:flutter/material.dart';
import 'package:movie_app/ui/pages/bottomNavBar/events/pageViewState.dart';
import 'package:provider/provider.dart';

class BottomNavBarPage extends StatefulWidget {
  @override
  _BottomNavBarPageState createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageViewState>(
      builder: (context, page, child) => Scaffold(
        extendBody: true,
        body: SizedBox(
          child: page.pages.elementAt(page.selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black.withOpacity(0.75),
          currentIndex: page.selectedIndex,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedFontSize: 14.0,
          unselectedFontSize: 14.0,
          selectedItemColor: const Color(0xffFFBB3B),
          unselectedItemColor: const Color(0xff898989),
          onTap: (index) {
            page.onPageTapped(index);
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'HOME',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.movie),
              label: 'TOP RATED',
            ),
          ],
        ),
      ),
    );
  }
}
