import 'package:flutter/material.dart';
import 'package:movie_app/ui/components/button.dart';
import 'package:movie_app/ui/components/textFieldInputBox.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('first name'.toUpperCase()),
        SizedBox(height: 10),
        TextFieldInputBox(
          hintText: 'first name here',
          suffixText: '',
          obscureText: false,
        ),
        SizedBox(height: 20),
        Text('last name'.toUpperCase()),
        SizedBox(height: 10),
        TextFieldInputBox(
          hintText: 'last name here',
          suffixText: '',
          obscureText: false,
        ),
        SizedBox(height: 20),
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
          suffixText: '',
          obscureText: true,
        ),
        SizedBox(height: 20),
        Text('confirm password'.toUpperCase()),
        SizedBox(height: 10),
        TextFieldInputBox(
          hintText: 'confirm password here',
          suffixText: '',
          obscureText: true,
        ),
        SizedBox(height: 20),
        CustomButton(
          onPressed: () {
            // go to home
          },
          title: 'REGISTER',
        ),
      ],
    );
  }
}
