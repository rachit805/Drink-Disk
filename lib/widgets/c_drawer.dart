import 'package:drinkdash/constants/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget cDrawer() {
  return Drawer(
        // Add Drawer to the Scaffold
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
              ),
              child: Text(
                'Drink Dash Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      );
}
