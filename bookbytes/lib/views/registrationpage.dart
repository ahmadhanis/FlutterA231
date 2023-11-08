import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _emailditingController = TextEditingController();
  final TextEditingController _passEditingController = TextEditingController();
  final TextEditingController _pass2EditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String eula = "";
  bool _isChecked = false;
  get onChanged => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Registration Form")),
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              Image.asset("assets/images/register.jpg"),
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
                          "User Registration",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                          controller: _nameEditingController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            labelText: 'Name',
                            icon: Icon(Icons.person),
                          ),
                          validator: (val) => val!.isEmpty || (val.length < 3)
                              ? "name must be longer than 3"
                              : null,
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
                                  val.contains(".")
                              ? "enter a valid email"
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
                          validator: (val) => validatePassword(val.toString()),
                        ),
                        TextFormField(
                          controller: _pass2EditingController,
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Re-enter Password',
                            icon: Icon(Icons.lock),
                          ),
                          validator: (val) => validatePassword(val.toString()),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Checkbox(
                              value: _isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked = value!;
                                });
                              },
                            ),
                            GestureDetector(
                                onTap: _showEULA,
                                child: const Text("Agree with terms?")),
                            ElevatedButton(
                                onPressed: _registerUserDialog,
                                child: const Text("Register"))
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

  String? validatePassword(String value) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$';
    RegExp regex = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid password';
      } else {
        return null;
      }
    }
  }

  void _registerUserDialog() {}

  loadEula() async {
    eula = await rootBundle.loadString('assets/eula.txt');
  }

  void _showEULA() {
    loadEula();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "EULA",
            style: TextStyle(),
          ),
          content: SizedBox(
            height: 400,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                      child: RichText(
                    softWrap: true,
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.black
                        ),
                        text: eula),
                  )),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "Close",
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}
