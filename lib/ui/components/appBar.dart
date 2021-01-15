import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({this.onTap});
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBar(
        backgroundColor: const Color(0xfff5f5f5),
        elevation: 0.0,
        leadingWidth: 100.0,
        leading: InkWell(
          onTap: onTap,
          child: Row(
            children: [
              SizedBox(width: 20),
              Icon(Icons.arrow_back, color: Color(0xff7c7c7c)),
              SizedBox(width: 5),
              Text(
                'BACK',
                style: TextStyle(
                  color: Color(0xff7c7c7c),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
