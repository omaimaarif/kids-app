import 'package:another_final_kids_app/screens/activity/activity_screen.dart';
import 'package:another_final_kids_app/screens/activity/dragDrop.dart';

import 'package:another_final_kids_app/screens/activity/welcome_to_activity.dart';
import 'package:another_final_kids_app/screens/home_page/home_screen.dart';
import 'package:another_final_kids_app/screens/login_screen/login_screen.dart';
import 'package:another_final_kids_app/screens/on_bording_screen.dart';
import 'package:another_final_kids_app/screens/side_menu/side_menu_screen.dart';
import 'package:another_final_kids_app/screens/sign_up/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('************* User is currently signed out!');
      } else {
        print('************* User is signed in!');
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:FirebaseAuth.instance.currentUser==null?OnBordingScreen(): HomeScreen(),
      routes: {"signup": (context)  => SignUpScreen(),
        "login": (context)  => LoginScreen(),
        "sideMenu":(context) => SideMenu(),
        "HomePage": (context)=> HomeScreen(),
        "welcome_to_activity": (context) => WelcomToActivity(),
         "activity": (context) => activityScreen(),
      },

    );
  }
}
//FirebaseAuth.instance.currentUser==null?OnBordingScreen(): HomeScreen(),