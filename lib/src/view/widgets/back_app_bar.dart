import 'package:flutter/material.dart';
import 'package:movie_app/src/core/style/color.dart';

class BackAppBar extends StatelessWidget {
  const BackAppBar({
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
      leading: InkWell(
        onTap: onBackTap,
        child: Row(
          children: [
            SizedBox(width: 20),
            Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: AppColor.darkGrey,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

