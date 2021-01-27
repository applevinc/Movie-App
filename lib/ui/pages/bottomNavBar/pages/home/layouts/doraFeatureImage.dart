import 'package:flutter/material.dart';
import 'package:movie_app/ui/images.dart';

class DoraFeatureImage extends StatelessWidget {
  const DoraFeatureImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: MediaQuery.of(context).size.height * 0.5,
      color: Colors.red,
      child: Image.asset(
        Images.homeBgImg,
        fit: BoxFit.fitWidth,
        height: 560,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
