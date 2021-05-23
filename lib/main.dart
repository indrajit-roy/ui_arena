import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_arena/Instagram/Providers/Auth.dart';

import 'Instagram/Pages/AuthView.dart';
import 'Instagram/Pages/FeedView.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => Auth(),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
          future: Firebase.initializeApp(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done)
              return StreamBuilder<User>(
                  stream: Provider.of<Auth>(context, listen: true)
                      .instance
                      .authStateChanges(),
                  builder: (context, snapshot) {
                    // if (snapshot.connectionState != ConnectionState.waiting) {
                    if (snapshot.hasData) {
                      print(snapshot.data.email);
                      return FeedView();
                    } else
                      return AuthView();
                    // }
                  });
            return Container();
          }),
    );
  }
}
