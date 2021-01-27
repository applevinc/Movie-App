import 'package:flutter/material.dart';
import 'package:movie_app/ui/pages/bottomNavBar/events/pageViewState.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class BottomNavBarPage extends StatefulWidget {
  @override
  _BottomNavBarPageState createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  @override
  Widget build(BuildContext context) {
    return Injector(
      inject: [Inject(() => PageViewState())],
      builder: (BuildContext context) {
        final ReactiveModel<PageViewState> _page = Injector.getAsReactive<PageViewState>();

        return StateBuilder(
          observe: () => _page,
          builder: (BuildContext context, ReactiveModel model) => Scaffold(
            body: SizedBox(
              child: _page.state.pages.elementAt(_page.state.selectedIndex),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'HOME',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'SEARCH',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.file_download),
                  label: 'DOWNLOADS',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'PROFILE',
                ),
              ],
              backgroundColor: Colors.black,
              currentIndex: _page.state.selectedIndex,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedFontSize: 14.0,
              unselectedFontSize: 14.0,
              selectedItemColor: const Color(0xffFFBB3B),
              unselectedItemColor: const Color(0xff898989),
              onTap: (index) {
                _page.setState((s) => s.onPageTapped(index));
              },
            ),
          ),
        );
      },
    );
  }
}
