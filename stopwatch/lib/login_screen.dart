import 'package:flutter/material.dart';

import 'stopwatch.dart';

class LoginScreen extends StatefulWidget {
  static const route = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // bool loggedIn = false;
  late String name;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      // body: Center(
      //   child: loggedIn ? _buildSuccess() : _buildLoginForm(),
      // ),
      body: Center(
        child: _buildLoginForm(),
      ),
    );
  }

  // Widget _buildSuccess() {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: <Widget>[
  //       Icon(Icons.check, color: Colors.orangeAccent),
  //       Text('Hi $name')
  //     ],
  //   );
  // }

  Widget _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Runner'),
              validator: (text) =>
                  text!.isEmpty ? 'Enter the runner\'s name.' : null,
            ),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'Email'),
              validator: (text) {
                if (text!.isEmpty) {
                  return 'Enter the runner\'s email.';
                }
                final regex = RegExp('[^@]+@[^.]+..+');
                if (!regex.hasMatch(text)) {
                  return 'Enter a valid email';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Continue'),
              onPressed: _validate,
            ),
          ],
        ),
      ),
    );
  }

  void _validate() {
    final form = _formKey.currentState;
    if (!form!.validate()) {
      return;
    }
    // setState(() {
    //   loggedIn = true;
    //   name = _nameController.text;
    // });

    // final name = _nameController.text;
    // final email = _emailController.text;
    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(
    //     builder: (_) => StopWatch(name: name, email: email),
    //   ),
    // );

    final name = _nameController.text;
    Navigator.of(context).pushReplacementNamed(
      StopWatch.route,
      arguments: name,
    );
  }
}
