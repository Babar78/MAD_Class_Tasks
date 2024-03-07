import 'package:flutter/material.dart';
import './stopwatch.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _runnerController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final _emailRegExp = RegExp(
    r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
  );

  bool _isEmailValid = true;
  bool _isRunnerNameFilled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _runnerController,
                decoration: InputDecoration(
                  labelText: 'Runner',
                  hintText: 'Enter your runner name',
                ),
                onChanged: (value) {
                  setState(() {
                    _isRunnerNameFilled = value.isNotEmpty;
                  });
                },
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  errorText: _isEmailValid ? null : 'Enter a valid email',
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  setState(() {
                    _isEmailValid = _emailRegExp.hasMatch(value);
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_isEmailValid && _isRunnerNameFilled) {
                    // Email is valid and Runner name is filled, navigate to StopwatchScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StopWatch(
                          runnerName: _runnerController.text,
                          email: _emailController.text,
                        ),
                      ),
                    );
                  } else {
                    // Show an error message or handle invalid cases
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Error'),
                          content: const Text(
                              'Please enter valid Runner name and Email.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: const Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
