import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeSearchAppBar extends StatelessWidget {
  const HomeSearchAppBar({
    Key key,
    this.onBackTap,
    this.title,
    this.bottom,
  }) : super(key: key);

  final Function onBackTap;
  final String title;
  final TabBar bottom;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leadingWidth: 100.0,
      title: Text(
        title,
        style: GoogleFonts.rammettoOne(
          color: Colors.white,
          fontSize: 27,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              // show search page
            },
          ),
        )
      ],
      bottom: bottom,
    );
  }
}
