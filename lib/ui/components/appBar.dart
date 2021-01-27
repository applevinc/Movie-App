import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
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
            Icon(Icons.arrow_back, color: Colors.white),
            SizedBox(width: 5),
            Text(
              'BACK',
              style: TextStyle(
                color: Colors.white,
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
