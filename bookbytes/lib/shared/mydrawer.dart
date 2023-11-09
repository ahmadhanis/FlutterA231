import 'package:flutter/material.dart';

import '../views/mainpage.dart';
import '../views/profilepage.dart';
import '../views/sellpage.dart';
import 'EnterExitRoute.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Profile'),
          ),
          ListTile(
            leading: const Icon(Icons.money),
            title: const Text('Buy'),
            onTap: () {
              Navigator.pop(context);
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (content) => const MainPage()));
              Navigator.push(
                  context,
                  EnterExitRoute(
                      exitPage: const MainPage(), enterPage: const MainPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.sell),
            title: const Text('Sell'),
            onTap: () {
              Navigator.pop(context);
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (content) => const SellPage()));
               Navigator.push(
                  context,
                  EnterExitRoute(
                      exitPage: const SellPage(), enterPage: const SellPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.verified_user),
            title: const Text('My Profile'),
            onTap: () {
              Navigator.pop(context);
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (content) => const ProfilePage()));
               Navigator.push(
                  context,
                  EnterExitRoute(
                      exitPage: const ProfilePage(), enterPage: const ProfilePage()));
            },
          ),
          const Divider(
            color: Colors.blueGrey,
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
