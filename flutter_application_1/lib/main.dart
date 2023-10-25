import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String name = "Hanis";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Hello World"),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(name),
                  MaterialButton(
                    onPressed: whatevernamethatyoulikehere,
                    color: Colors.yellow,
                    child: const Text("Press ME"),
                  )
                ],
              ),
            )));
  }

//this method use to change value
  void whatevernamethatyoulikehere() {
    name = "Welcome to Flutter";
    print(name);
    setState(() {});
  }
}
