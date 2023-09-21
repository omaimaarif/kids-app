import 'package:another_final_kids_app/screens/on_bording_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  Widget build(BuildContext context) {
    return const MaterialApp(
debugShowCheckedModeBanner: false,
      home: OnBordingScreen(),
    );
  }
}