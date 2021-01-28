import 'package:flutter/material.dart';
import 'package:movie_app/ui/pages/bottomNavBar/components/seachBar.dart';
import 'package:movie_app/ui/pages/bottomNavBar/pages/home/layouts/doraFeatureImage.dart';
import 'package:movie_app/ui/pages/bottomNavBar/pages/home/layouts/doraInfo.dart';
import 'package:movie_app/ui/pages/bottomNavBar/pages/home/layouts/watching.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: buildCustomAppBar(),
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
      child: HomeSearchAppBar(title: ''),
    );
  }
}
