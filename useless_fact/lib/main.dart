import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String uselessfact = "";
  String source = "";
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Useless Fact")),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                  onPressed: getData, child: const Text("Get Useless Fact")),
              Visibility(
                  visible: status, child: const CircularProgressIndicator()),
              Text(
                uselessfact,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                "Source: $source",
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              )
            ]),
          ),
        ),
      ),
    );
  }

  Future<void> getData() async {
    status = true;
    setState(() {});
    var url = Uri.parse('https://uselessfacts.jsph.pl/api/v2/facts/random');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var parsedJson = json.decode(response.body);
      uselessfact = parsedJson['text'];
      source = parsedJson['source'];
      status = false;
      setState(() {});

      print(response.body);
    } else {
      print("Error");
    }
  }
}
