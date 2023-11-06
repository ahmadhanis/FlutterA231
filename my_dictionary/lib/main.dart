import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Dictionary',
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
  TextEditingController textEditingController = TextEditingController();
  String definition = "";
  String example = "";
  late double screenHeight, screenWidth;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextField(
              controller: textEditingController,
            ),
            ElevatedButton(onPressed: onPressed, child: const Text("Search")),
            SizedBox(
              width: screenWidth,
              height: screenHeight / 2,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text(
                        "Meaning:",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(definition, style: const TextStyle(fontSize: 16)),
                      const Text("Example",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(example, style: const TextStyle(fontSize: 16))
                    ],
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }

  Future<void> onPressed() async {
    ProgressDialog progressDialog = ProgressDialog(context,
        message: const Text("Dictionary"), title: const Text("Searching..."));
    progressDialog.show();

    String text = textEditingController.text;
    var url =
        Uri.parse('https://api.dictionaryapi.dev/api/v2/entries/en/$text');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var parsedJson = json.decode(response.body);
      definition = parsedJson[0]['meanings'][0]['definitions'][0]['definition']
          .toString();
      example =
          parsedJson[0]['meanings'][0]['definitions'][0]['example'].toString();
      setState(() {});
      log(definition);
      Fluttertoast.showToast(
          msg: "Found!!!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      definition = "";
      example = "";
      setState(() {});
      Fluttertoast.showToast(
          msg: "Not Found",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    progressDialog.dismiss();
  }
}
