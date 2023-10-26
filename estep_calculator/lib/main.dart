import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              'assets/images/ender.jpg',
              scale: 2.5,
            ),
            const Text(
              "E-STEP Calculator",
              style: TextStyle(
                  fontSize: 32, fontWeight: FontWeight.bold, color: Colors.red),
            )
          ]),
        ),
      ),
    );
  }
}
