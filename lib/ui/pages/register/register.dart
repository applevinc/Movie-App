import 'package:flutter/material.dart';
import 'package:movie_app/ui/components/appBar.dart';
import 'package:movie_app/ui/images.dart';
import 'package:movie_app/ui/pages/register/layouts/form.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xfff5f5f5),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: CustomAppBar(
            onTap: () => Navigator.pop(context),
          ),
        ),
        body: SafeArea(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50,
                    child: ClipOval(
                      child: Image.asset(
                        Images.user,
                        height: 70,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('Add a profile picture', style: TextStyle(fontSize: 15)),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: RegisterForm(),
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
