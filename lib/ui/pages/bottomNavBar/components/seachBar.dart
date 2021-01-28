import 'package:flutter/material.dart';

class HomeSearchAppBar extends StatelessWidget {
  const HomeSearchAppBar({
    Key key,
    this.onBackTap,
    this.title,
  }) : super(key: key);

  final Function onBackTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leadingWidth: 100.0,
      title: Text(title, style: TextStyle(color: Colors.white)),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // show search page
            },
          ),
        )
      ],
    );
  }
}
