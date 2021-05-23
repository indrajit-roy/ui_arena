import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ui_arena/Instagram/Pages/SignInView.dart';

import 'SignUpView.dart';

class AuthView extends StatefulWidget {
  AuthView({Key key}) : super(key: key);

  @override
  _AuthViewState createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  bool isSignIn = true;
  @override
  Widget build(BuildContext context) {
    print('Auth View');
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              isSignIn ? SignInView() : SignUpView(),
              TextButton(
                child: Text(
                  isSignIn ? 'Create an account' : 'Sign In Instead',
                ),
                onPressed: () {
                  setState(() {
                    isSignIn = !isSignIn;
                  });
                },
              )
            ]),
      ),
    );
  }
}
