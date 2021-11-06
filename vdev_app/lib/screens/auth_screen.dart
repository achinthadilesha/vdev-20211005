import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/widgets/widgets.dart';
import '/services/services.dart';

class AuthScreen extends StatefulWidget {
  static const routeName = '/authscreen';

  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isFormValid = false;
  bool isValidEmail(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {
        if (isValidEmail(_emailController.text) &&
            _passwordController.text.length >= 5) {
          _isFormValid = true;
        } else {
          _isFormValid = false;
        }
      });
    });
    _passwordController.addListener(() {
      setState(() {
        if (isValidEmail(_emailController.text) &&
            _passwordController.text.length >= 5) {
          _isFormValid = true;
        } else {
          _isFormValid = false;
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          LoginInputField(
            textController: _emailController,
            inputfieldName: 'Email',
            isTextSecure: false,
          ),
          LoginInputField(
            textController: _passwordController,
            inputfieldName: 'Password',
            isTextSecure: true,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text('Sign-in'),
                onPressed: (_isFormValid)
                    ? () {
                        authService.authenticateUser(
                            username: _emailController.text,
                            password: _passwordController.text);
                      }
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
