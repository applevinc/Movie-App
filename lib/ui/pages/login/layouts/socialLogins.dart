import 'package:flutter/material.dart';

class SocialLogins extends StatelessWidget {
  const SocialLogins({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: horizontalLine(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'Social Logins',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Expanded(
                child: horizontalLine(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialIcon(
                iconName: 'F',
                onTap: () {
                  //Login with facebook
                },
              ),
              SizedBox(width: 20),
              SocialIcon(
                iconName: 'G',
                onTap: () {
                  //login with gmail
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container horizontalLine() {
    return Container(
      height: 1,
      color: const Color(0xff898989),
      child: Text(''),
    );
  }
}

class SocialIcon extends StatelessWidget {
  const SocialIcon({
    Key key,
    this.iconName,
    this.onTap,
  }) : super(key: key);

  final String iconName;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(color: const Color(0xffFFBB3B), shape: BoxShape.circle),
        child: Text(
          iconName,
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
