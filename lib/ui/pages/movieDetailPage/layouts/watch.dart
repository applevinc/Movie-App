import 'package:flutter/material.dart';

class WatchMovie extends StatelessWidget {
  const WatchMovie({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Color(0xffFFBB3B),
      onPressed: () {
        //open streaming video window
      },
      child: Text('WATCH NOW'),
    );
  }
}
