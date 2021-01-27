import 'package:flutter/material.dart';
import 'package:movie_app/ui/pages/register/register.dart';

class ClickToRegister extends StatelessWidget {
  const ClickToRegister({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Don\'t have an account?',
          style: TextStyle(
            fontSize: 14,
            color: Color(0xff6F6F6F),
          ),
        ),
        SizedBox(height: 5),
        InkWell(
          onTap: () {
            // go to create account page
            Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
          },
          child: Text(
            'REGISTER',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
