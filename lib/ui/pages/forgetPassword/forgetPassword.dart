import 'package:flutter/material.dart';
import 'package:movie_app/ui/components/appBar.dart';
import 'package:movie_app/ui/components/button.dart';
import 'package:movie_app/ui/components/textFieldInputBox.dart';
import 'package:movie_app/ui/images.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xfff5f5f5),
        appBar: buildCustomAppBar(context),
        body: SafeArea(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(Images.logoPNG, height: 120),
                    SizedBox(height: 20),
                    Text('FORGOT PASSWORD?', textAlign: TextAlign.center),
                    Text(
                      'Enter the email address you used to create your account and we will email you a link to reset your password',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xff7E7E7E)),
                    ),
                    SizedBox(height: 50),
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
                        // go to home
                      },
                      title: 'SEND EMAIL',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSize buildCustomAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(60.0),
      child: CustomAppBar(
        arrowIconColor: Color(0xff7c7c7c),
        backColor: Color(0xff7c7c7c),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
