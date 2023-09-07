import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          DrawerHeader(
            decoration: BoxDecoration(color: CupertinoColors.systemOrange),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: Text('Dashboard'),
          ),
          ListTile(
            title: Text('Favorites'),
          ),
          ListTile(
            title: Text('Settings'),
          ),
          ListTile(
            title: Text('About Us'),
          ),
        ],
      ),
    );
  }
}
