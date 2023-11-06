import 'dart:async';

import 'package:flutter/material.dart';

import 'mainpage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (content) => const MainPage())));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "BookBytes",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          CircularProgressIndicator(),
          Text("Version 0.1")
        ],
      )),
    );
  }
}
