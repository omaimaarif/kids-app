import 'package:another_final_kids_app/screens/activity/activity_screen.dart';
import 'package:another_final_kids_app/screens/activity/dragDrop.dart';
import 'package:another_final_kids_app/screens/activity/math_game/math_game_home.dart';
import 'package:another_final_kids_app/screens/activity/num_puzzle/board.dart';
import 'package:another_final_kids_app/screens/activity/puzzle_hack/main_puzzle.dart';
import 'package:another_final_kids_app/screens/activity/puzzle_hack/screens/puzzle_page.dart';
import 'package:another_final_kids_app/screens/activity/puzzle_hack/theme.dart';
import 'package:another_final_kids_app/screens/activity/welcome_to_activity.dart';
import 'package:another_final_kids_app/screens/art_section/drawing_page.dart';
import 'package:another_final_kids_app/screens/art_section/welcome/welcome_to_art.dart';
import 'package:another_final_kids_app/screens/chatterbox/call.dart';
import 'package:another_final_kids_app/screens/chatterbox/homecall.dart';
import 'package:another_final_kids_app/screens/chatterbox/login.dart';
import 'package:another_final_kids_app/screens/home_page/home_screen.dart';
import 'package:another_final_kids_app/screens/login_screen/login_screen.dart';
import 'package:another_final_kids_app/screens/messagin/screens_message/chat_screen.dart';
import 'package:another_final_kids_app/screens/messagin/screens_message/registration_screen.dart';
import 'package:another_final_kids_app/screens/messagin/screens_message/signin_screen.dart';
import 'package:another_final_kids_app/screens/messagin/screens_message/welcome_screen.dart';
import 'package:another_final_kids_app/screens/on_bording_screen.dart';
import 'package:another_final_kids_app/screens/side_menu/side_menu_screen.dart';
import 'package:another_final_kids_app/screens/sign_up/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
const Color kCanvasColor = Color(0xfff2f3f7);


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

      home:FirebaseAuth.instance.currentUser==null?OnBordingScreen(): MainScreen(),

      routes: {"signup": (context)  => SignUpScreen(),
        "splash": (context)  => OnBordingScreen(),

        "sign_up": (context)  => SignUpScreen(),
        "login": (context)  => LoginScreen(),
        "sideMenu":(context) => SideMenu(),
        "HomePage": (context)=> MainScreen(),
        "welcome_to_activity": (context) => WelcomToActivity(),
         "activity": (context) => activityScreen(),
        "draw": (context) => DrawingPage(),
        "Math": (context) => MathGame(),
        "welcome_to_art_section": (context) => WelcomToArtSection(),
        "home_call": (context) => HomeCall(),
        "chatterbox": (context) => LoginCall(),
        "welcome_chat": (context) => WelcomeScreen(),
        "sign_in_chat": (context) => SignInScreen(),
        "regestration_chat": (context) => RegistrationScreen(),
        "chat_screen": (context) => ChatScreen(),
        "puzzle_hack": (context) => ProviderScope(child: App(appTheme: AppTheme())),
        "puzzle_num": (context) => board(),



        // WelcomeScreen.screenRoute: (context) => WelcomeScreen(),
        // SignInScreen.screenRoute: (context) => SignInScreen(),
        // RegistrationScreen.screenRoute: (context) => RegistrationScreen(),
        // ChatScreen.screenRoute: (context) => ChatScreen(),

      },

    );
  }
}
//FirebaseAuth.instance.currentUser==null?OnBordingScreen(): MainScreen(),