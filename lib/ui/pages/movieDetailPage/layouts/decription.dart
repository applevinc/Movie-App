import 'package:flutter/material.dart';

class MovieDescription extends StatelessWidget {
  const MovieDescription({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Text(
        'Having spent most of her life exploring the jungle, nothing could prepare Dora for her most dangerous adventure yet — high school.',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
