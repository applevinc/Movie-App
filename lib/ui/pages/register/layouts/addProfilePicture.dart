import 'package:flutter/material.dart';
import 'package:movie_app/ui/images.dart';

class AddProfilePicture extends StatelessWidget {
  const AddProfilePicture({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 50,
          child: ClipOval(
            child: Image.asset(
              Images.user,
              height: 70,
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Add a profile picture',
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
