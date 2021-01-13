import 'package:flutter/material.dart';
import 'package:movie_app/ui/images.dart';
import 'package:movie_app/ui/pages/login/layouts/form.dart';
import 'package:movie_app/ui/pages/login/layouts/socialLogins.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Images.loginBackgroundImg),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 50),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset(Images.logo),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            FormBody(),
                            SizedBox(height: 25),
                            SocialLogins(),
                            SizedBox(height: 25),
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
                              },
                              child: Text('REGISTER'),
                            ),
                            SizedBox(height: 35),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
