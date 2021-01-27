import 'package:flutter/material.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({
    Key key,
    this.onBackTap,
    this.actions,
  }) : super(key: key);

  final Function onBackTap;
  final List<Widget> actions;

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
      actions: actions,
    );
  }
}
