import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Auth extends ChangeNotifier {
  FirebaseAuth _instance;
  Auth() {
    _instance = FirebaseAuth.instance;
  }
  FirebaseAuth get instance {
    return _instance;
  }
}