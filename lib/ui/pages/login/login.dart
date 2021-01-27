import 'package:flutter/material.dart';
import 'package:movie_app/ui/images.dart';
import 'package:movie_app/ui/pages/login/layouts/dontHaveAccount.dart';
import 'package:movie_app/ui/pages/login/layouts/form.dart';
import 'package:movie_app/ui/pages/login/layouts/socialLogins.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: backgroundImage(),
            child: Column(
              children: [
                SizedBox(height: 50),
                Image.asset(Images.logoPNG),
                SizedBox(height: 20),
                FormAndBottomArea(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration backgroundImage() {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage(Images.loginBackgroundImg),
        colorFilter: ColorFilter.mode(Colors.black, BlendMode.lighten),
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
      ),
    );
  }
}

class FormAndBottomArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: gradientBoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: [
              FormBody(),
              SizedBox(height: 25),
              SocialLogins(),
              SizedBox(height: 25),
              ClickToRegister(),
              SizedBox(height: 35),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration gradientBoxDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.black.withOpacity(0.0), Colors.black],
        stops: [0, 0.4],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }
}
