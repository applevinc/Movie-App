import 'package:flutter/material.dart';

class ForgotPasswordText extends StatelessWidget {
  const ForgotPasswordText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'FORGOT PASSWORD?',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 5),
        Text(
          'Enter the email address you used to create your account and we will email you a link to reset your password',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ],
    );
  }
}
