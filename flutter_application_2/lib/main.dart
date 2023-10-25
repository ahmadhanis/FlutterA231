import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String name = "";
  String age = "";

  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _agecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _namecontroller),
            TextField(
              controller: _agecontroller,
            ),
            ElevatedButton(
                onPressed: pressMe,
                child: const Text(
                  "Press Me",
                  style: TextStyle(fontSize: 16),
                )),
            Text("$name $age Years Old", style: const TextStyle(fontSize: 24))
          ],
        ),
      )),
    );
  }

  void pressMe() {
    name = _namecontroller.text;
    age = _agecontroller.text;
    print(name);
    setState(() {});
  }
}
