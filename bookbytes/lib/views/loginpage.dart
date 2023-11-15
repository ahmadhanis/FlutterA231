import 'dart:convert';

import 'package:bookbytes/shared/myserverconfig.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailditingController = TextEditingController();
  final TextEditingController _passEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login Page"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              Image.asset("assets/images/login.jpg"),
              Container(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Card(
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                      child: Column(children: [
                        const Text(
                          "User Login",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                          controller: _emailditingController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            icon: Icon(Icons.email),
                          ),
                          validator: (val) => val!.isEmpty ||
                                  !val.contains("@") ||
                                  !val.contains(".")
                              ? "Please enter a valid email"
                              : null,
                        ),
                        TextFormField(
                          controller: _passEditingController,
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            icon: Icon(Icons.lock),
                          ),
                          validator: (val) => val!.isEmpty || (val.length < 3)
                              ? "Please enter password"
                              : null,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(children: [
                                Checkbox(
                                  value: _isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isChecked = value!;
                                    });
                                  },
                                ),
                                const Text("Remember Me"),
                              ]),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  _loginUser();
                                },
                                child: const Text("Login"))
                          ],
                        )
                      ]),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ));
  }

  void _loginUser() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    String _email = _emailditingController.text;
    String _pass = _passEditingController.text;

    http.post(
        Uri.parse("${MyServerConfig.server}/bookbytes/php/login_user.php"),
        body: {"email": _email, "password": _pass}).then((response) {
      print(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['status'] == "success") {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Login Success"),
            backgroundColor: Colors.green,
          ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Login Failed"),
            backgroundColor: Colors.red,
          ));
        }
      }
    });
  }
}
