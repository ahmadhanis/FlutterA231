//Profile page

import 'package:bookbytes/shared/mydrawer.dart';
import 'package:bookbytes/views/registrationpage.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //CircleAvatar(backgroundImage: AssetImage('')),
                Text(
                  "My Profile",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
              ],
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1.0),
              child: Container(
                color: Colors.grey,
                height: 1.0,
              ),
            )),
        drawer: const MyDrawer(),
        body: Center(
          child: Column(children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (content) => const RegistrationPage()));
                },
                child: Text("Register"))
          ]),
        ));
  }
}
