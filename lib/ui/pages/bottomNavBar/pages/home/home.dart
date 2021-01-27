import 'package:flutter/material.dart';
import 'package:movie_app/ui/pages/bottomNavBar/pages/home/layouts/doraFeatureImage.dart';
import 'package:movie_app/ui/pages/bottomNavBar/pages/home/layouts/doraInfo.dart';
import 'package:movie_app/ui/pages/bottomNavBar/pages/home/layouts/watching.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: HomeSearchAppBar(),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: Column(
              children: [
                DoraFeatureImage(),
                DoraInfo(),
                Watching(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSize buildCustomAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(60.0),
      child: HomeSearchAppBar(),
    );
  }
}

class HomeSearchAppBar extends StatelessWidget {
  const HomeSearchAppBar({
    Key key,
    this.onBackTap,
  }) : super(key: key);

  final Function onBackTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leadingWidth: 100.0,
      actions: [
        IconButton(
          icon: Icon(Icons.search, color: Colors.white),
          onPressed: () {},
        )
      ],
    );
  }
}
