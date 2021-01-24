import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key key,
    this.onTap,
    this.arrowIconColor,
    this.backColor,
  }) : super(key: key);

  final Function onTap;
  final Color arrowIconColor;
  final Color backColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leadingWidth: 100.0,
      leading: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            SizedBox(width: 20),
            Icon(Icons.arrow_back, color: arrowIconColor),
            SizedBox(width: 5),
            Text(
              'BACK',
              style: TextStyle(
                color: backColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
