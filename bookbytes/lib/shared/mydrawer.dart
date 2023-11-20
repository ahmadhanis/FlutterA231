import 'package:flutter/material.dart';

import '../models/user.dart';
import '../views/mainpage.dart';
import '../views/profilepage.dart';
import '../views/orderpage.dart';
import 'EnterExitRoute.dart';

class MyDrawer extends StatefulWidget {
  final String page;
  final User userdata;
  const MyDrawer({Key? key, required this.page, required this.userdata})
      : super(key: key);

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
            title: const Text('Books'),
            onTap: () {
              Navigator.pop(context);
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (content) => const MainPage()));
              print(widget.page.toString());
              if (widget.page.toString() == "books") {
                //  Navigator.pop(context);
                return;
              }
              Navigator.pop(context);
              Navigator.push(
                  context,
                  EnterExitRoute(
                      exitPage: MainPage(
                        userdata: widget.userdata,
                      ),
                      enterPage: MainPage(userdata: widget.userdata)));
            },
          ),
          ListTile(
            leading: const Icon(Icons.sell),
            title: const Text('Orders and Sales'),
            onTap: () {
              Navigator.pop(context);
              print(widget.page.toString());
              if (widget.page.toString() == "seller") {
                // Navigator.pop(context);
                return;
              }
              Navigator.pop(context);

              // Navigator.push(context,
              //     MaterialPageRoute(builder: (content) => const SellPage()));
              Navigator.push(
                  context,
                  EnterExitRoute(
                      exitPage:  OrderPage(userdata: widget.userdata,),
                      enterPage:  OrderPage(userdata: widget.userdata,)));
            },
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Community'),
            onTap: () {
              print(widget.page.toString());
              Navigator.pop(context);
              if (widget.page.toString() == "Community") {
                //  Navigator.pop(context);
                return;
              }
              Navigator.pop(context);

              // Navigator.push(context,
              //     MaterialPageRoute(builder: (content) => const ProfilePage()));
              Navigator.push(
                  context,
                  EnterExitRoute(
                      exitPage:  ProfilePage(userdata: widget.userdata),
                      enterPage: ProfilePage(userdata: widget.userdata)));
            },
          ),
          ListTile(
            leading: const Icon(Icons.verified_user),
            title: const Text('My Account'),
            onTap: () {
              print(widget.page.toString());
              Navigator.pop(context);
              if (widget.page.toString() == "account") {
                //  Navigator.pop(context);
                return;
              }
              Navigator.pop(context);

              // Navigator.push(context,
              //     MaterialPageRoute(builder: (content) => const ProfilePage()));
              Navigator.push(
                  context,
                  EnterExitRoute(
                      exitPage:  ProfilePage(userdata: widget.userdata),
                      enterPage:  ProfilePage(userdata: widget.userdata)));
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
