import 'package:another_final_kids_app/home_page/home_screen.dart';
import 'package:another_final_kids_app/screens/login_screen/login_screen.dart';
import 'package:another_final_kids_app/screens/on_bording_screen.dart';
import 'package:another_final_kids_app/screens/sign_up/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';



void main() {

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBordingScreen(),
    );
  }
}