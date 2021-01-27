import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key key,
    this.title,
    this.onPressed,
  }) : super(key: key);

  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: FlatButton(
        color: const Color(0xffFFBB3B),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
