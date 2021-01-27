import 'package:flutter/material.dart';

class TextFieldInputBox extends StatelessWidget {
  const TextFieldInputBox({
    Key key,
    this.hintText,
    this.suffixText,
    this.obscureText,
    this.suffixFunction,
  }) : super(key: key);

  final String hintText;
  final String suffixText;
  final bool obscureText;
  final Function suffixFunction;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(25),
      child: TextField(
        style: TextStyle(color: Colors.white),
        obscureText: obscureText,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 15, right: 15),
          filled: true,
          fillColor: Color(0xff212121),
          hintText: hintText,
          hintStyle: TextStyle(color: Color(0xffA2A2A2)),
          suffix: InkWell(
            onTap: suffixFunction,
            child: Text(
              suffixText,
              style: TextStyle(
                fontSize: 11,
                color: Colors.white,
              ),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
