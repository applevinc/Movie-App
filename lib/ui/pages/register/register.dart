import 'package:flutter/material.dart';
import 'package:movie_app/ui/components/appBar.dart';
import 'package:movie_app/ui/pages/register/layouts/addProfilePicture.dart';
import 'package:movie_app/ui/pages/register/layouts/form.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: _buildPreferredSizeAppBar(context),
        body: SafeArea(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AddProfilePicture(),
                  RegisterForm(),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSize _buildPreferredSizeAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: CustomAppBar(
        onBackTap: () => Navigator.pop(context),
      ),
    );
  }
}
