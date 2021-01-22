import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: Text('Movies'),
            onTap: () {
              Navigator.pop(context);
              // navigate to movies page
            },
          ),
          ListTile(
            title: Text('Tv Shows'),
            onTap: () {
              Navigator.pop(context);
              // navigate to tv shows page
            },
          ),
          ListTile(
            title: Text('Anime'),
            onTap: () {
              Navigator.pop(context);
              // navigate to tv shows page
            },
          ),
        ],
      ),
    );
  }
}
