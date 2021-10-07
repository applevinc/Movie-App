import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class HomeSearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeSearchAppBar({
    Key key,
    this.onSearchIconTap,
    @required this.title,
    this.bottom,
    this.onPressed,
    @required this.height,
  }) : super(key: key);

  final Function onSearchIconTap;
  final String title;
  final TabBar bottom;
  final Function onPressed;
  final double height;

  @override
  Size get preferredSize => Size.fromHeight(height);

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
          fontSize: 20.0.sp,
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
            onPressed: onPressed,
          ),
        )
      ],
      bottom: bottom,
    );
  }
}
