import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:my_tree/screens/auth_screens/signin_screen.dart';
import 'package:my_tree/screens/auth_screens/signup_screen.dart';
import 'package:my_tree/screens/home_screens/home_screen.dart';

FirebaseAuth auth = FirebaseAuth.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 101',
      home: (auth.currentUser == null) ? SignUpScreen() : MyHomePage(),
    );
  }
}
