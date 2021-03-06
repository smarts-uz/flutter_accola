import 'package:accoola/contsant.dart';
import 'package:accoola/pages/login/login_page.dart';
import 'package:accoola/pages/storage/stroge_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
