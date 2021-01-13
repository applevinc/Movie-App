import 'package:flutter/material.dart';
import 'package:movie_app/ui/components/button.dart';
import 'package:movie_app/ui/pages/login/components/textFieldInputBox.dart';

class FormBody extends StatefulWidget {
  @override
  _FormBodyState createState() => _FormBodyState();
}

class _FormBodyState extends State<FormBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Email'.toUpperCase()),
        SizedBox(height: 10),
        TextFieldInputBox(
          hintText: 'email here',
          suffixText: '',
          obscureText: false,
        ),
        SizedBox(height: 20),
        Text('password'.toUpperCase()),
        SizedBox(height: 10),
        TextFieldInputBox(
          hintText: 'password here',
          suffixText: 'FORGOT?',
          obscureText: true,
        ),
        SizedBox(height: 20),
        CustomButton(
          onPressed: () {
            // go to home
          },
          title: 'LOGIN',
        ),
      ],
    );
  }
}
