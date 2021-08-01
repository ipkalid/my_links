import 'package:flutter/material.dart';

import 'package:my_tree/screens/auth_screens/signin_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 101',
      home: SignInScreen(),
    );
  }
}
