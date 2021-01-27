import 'package:flutter/material.dart';
import 'package:movie_app/ui/components/button.dart';
import 'package:movie_app/ui/components/textFieldInputBox.dart';
import 'package:movie_app/ui/pages/bottomNavBar/bottomNavBar.dart';

class EmailFormField extends StatelessWidget {
  const EmailFormField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Email'.toUpperCase(), textAlign: TextAlign.start),
        SizedBox(height: 10),
        TextFieldInputBox(
          hintText: 'email here',
          suffixText: '',
          obscureText: false,
        ),
        SizedBox(height: 20),
        CustomButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavBarPage()));
          },
          title: 'SEND EMAIL',
        ),
      ],
    );
  }
}
