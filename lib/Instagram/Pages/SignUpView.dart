import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_arena/Instagram/Providers/Auth.dart';


class SignUpView extends StatefulWidget {
  const SignUpView({
    Key key,
  }) : super(key: key);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  String _email;
  String _password;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height / 2,
          constraints: BoxConstraints(maxWidth: 760),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.network(
            "https://cdn.iconscout.com/icon/free/png-64/instagram-61-189771.png",
            height: 60,
            width: 150,
          ),
          Image.network(
            "https://img.freepik.com/free-vector/graffiti-design-wall_1176-342.jpg?size=626&ext=jpg",
            height: 100,
            width: double.infinity,
          ),
          TextField(
            decoration: InputDecoration(hintText: 'Enter Email'),
            onChanged: (value) {
              _email = value;
            },
          ),
          TextField(
            decoration: InputDecoration(hintText: 'Enter Password'),
            onChanged: (value) {
              _password = value;
            },
          ),
          MaterialButton(
              hoverElevation: 0,
              elevation: 0,
              hoverColor: const Color(0xffFF5B95),
              highlightColor: const Color(0xffFF82AE),
              focusColor: const Color(0xffffffff),
              color: const Color(0xffFE4385),
              padding: const EdgeInsets.all(16),
              child: Text(
                'SIGN UP',
                style: TextStyle(color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              onPressed: () async {
                try {

                  final userCredential = await Provider.of<Auth>(context,listen: false).instance
                      .createUserWithEmailAndPassword(
                          email: _email, password: _password);

                  final response = await FirebaseFirestore.instance
                      .collection('users')
                      .add({
                    "uid": userCredential.user.uid,
                    "displayName": userCredential.user.displayName,
                    "email": userCredential.user.email,
                  });

                } catch (e) {
                  print("EXCEPTIIIOOOONNNN $e");
                }
              }),
          
        ],
      ),
    );
  }
}
