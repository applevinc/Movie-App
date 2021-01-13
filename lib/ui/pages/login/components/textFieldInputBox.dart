import 'package:flutter/material.dart';

class TextFieldInputBox extends StatelessWidget {
  const TextFieldInputBox({
    Key key,
    this.hintText,
    this.suffixText,
    this.obscureText,
  }) : super(key: key);

  final String hintText;
  final String suffixText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 15, right: 15),
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(color: Color(0xffA2A2A2)),
        suffix: InkWell(
          onTap: () {},
          child: Text(
            suffixText,
            style: TextStyle(
              fontSize: 11,
              color: Colors.black,
            ),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
