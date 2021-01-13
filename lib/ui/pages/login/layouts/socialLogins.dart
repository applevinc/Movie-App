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
                child: Text('Social Logins'),
              ),
              Expanded(
                child: horizontalLine(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              socialIcon(
                iconName: 'F',
                onTap: () {
                  // login with facebook
                },
              ),
              SizedBox(width: 20),
              socialIcon(
                iconName: 'G',
                onTap: () {
                  // login with gmail
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

  InkWell socialIcon({String iconName, Function onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(color: const Color(0xffFFBB3B), shape: BoxShape.circle),
        child: Text(
          iconName,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
