import 'package:flutter/material.dart';
import 'package:movie_app/ui/components/appBar.dart';
import 'package:movie_app/ui/images.dart';
import 'package:movie_app/ui/pages/forgetPassword/layouts/emailFormField.dart';
import 'package:movie_app/ui/pages/forgetPassword/layouts/text.dart';

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                  ForgotPasswordText(),
                  SizedBox(height: 20),
                  EmailFormField(),
                ],
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
        onBackTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
