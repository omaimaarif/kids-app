import 'package:another_final_kids_app/screens/activity/category_activity.dart';
import 'package:another_final_kids_app/screens/activity/sections_of_activity/education_activity.dart';
import 'package:another_final_kids_app/screens/activity/sections_of_activity/sorting_and_drag.dart';
import 'package:another_final_kids_app/screens/activity/sorting_drag_select/activity_screen.dart';
import 'package:another_final_kids_app/screens/activity/sorting_drag_select/dragDrop.dart';
import 'package:another_final_kids_app/screens/activity/math_game/math_game_home.dart';
import 'package:another_final_kids_app/screens/activity/memory_game/managers/game_manager.dart';
import 'package:another_final_kids_app/screens/activity/memory_game/models/word.dart';
import 'package:another_final_kids_app/screens/activity/memory_game/pages/game_page.dart';
import 'package:another_final_kids_app/screens/activity/memory_game/pages/main_of_memory_game.dart';
import 'package:another_final_kids_app/screens/activity/memory_game/theme/app_theme.dart';
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
import 'package:another_final_kids_app/screens/emotions/emotions_detection/main_emotions_detection.dart';
import 'package:another_final_kids_app/screens/emotions/main_emotions.dart';
import 'package:another_final_kids_app/screens/home_page/home_screen.dart';
import 'package:another_final_kids_app/screens/login_screen/login_screen.dart';
import 'package:another_final_kids_app/screens/messagin/screens_message/chat_screen.dart';
import 'package:another_final_kids_app/screens/on_bording_screen.dart';
import 'package:another_final_kids_app/screens/side_menu/side_menu_screen.dart';
import 'package:another_final_kids_app/screens/sign_up/sign_up.dart';
import 'package:another_final_kids_app/screens/spell/controller.dart';
import 'package:another_final_kids_app/screens/spell/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart' as meem;

List<Word> sourceWords = [];
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.landscapeLeft,
  //   DeviceOrientation.landscapeRight
  // ]);

  runApp(const MyApp());
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
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
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
      home: FirebaseAuth.instance.currentUser == null
          ? OnBordingScreen()
          : MainScreen(),
      routes: {
        "signup": (context) => SignUpScreen(),
        "splash": (context) => OnBordingScreen(),
        "emotions": (context) => EmotionsPage(),
        "facedetector": (context) => EmotionFaceDetector(),
        "sign_up": (context) => SignUpScreen(),
        "login": (context) => LoginScreen(),
        "sideMenu": (context) => SideMenu(),
        "HomePage": (context) => MainScreen(),
        "welcome_to_activity": (context) => WelcomToActivity(),
        "activity": (context) => activityScreen(),
        "draw": (context) => DrawingPage(),
        "Math": (context) => MathGame(),
        "CategoryActivity": (context) => CategoryActivity(),
        "welcome_to_art_section": (context) => WelcomToArtSection(),
        "home_call": (context) => HomeCall(),
        "chatterbox": (context) => LoginCall(),
        "chat_screen": (context) => ChatScreen(),
        "puzzle_hack": (context) =>
            ProviderScope(child: App(appTheme: AppTheme())),
        "puzzle_num": (context) => board(),
        "memory_game": (context) => Material(
              child: meem.ChangeNotifierProvider(
                  create: (_) => GameManager(),
                  child: const Main_of_memory_game()),
            ),
        "spell": (context) => meem.ChangeNotifierProvider(
            create: (_) => Controller(), child: const HomeSpell())
      },
    );
  }
}
//FirebaseAuth.instance.currentUser==null?OnBordingScreen(): MainScreen(),
//Material(child:meem.ChangeNotifierProvider(create: (_) => GameManager(), child: const GamePage())),

// WelcomeScreen.screenRoute: (context) => WelcomeScreen(),
// SignInScreen.screenRoute: (context) => SignInScreen(),
// RegistrationScreen.screenRoute: (context) => RegistrationScreen(),
// ChatScreen.screenRoute: (context) => ChatScreen(),

// Future<int> populateSourceWords() async {
//   final ref = FirebaseStorage.instance.ref();
//   final all = await ref.listAll();
//
//   for (var item in all.items) {
//     sourceWords.add(Word(
//         text: item.name.substring(0, item.name.indexOf('.')),
//         url: await item.getDownloadURL(),
//         displayText: false));
//   }
//
//   return 1;
// }

//
// GetMaterialApp(
// debugShowCheckedModeBanner: false,
// home: FirebaseAuth.instance.currentUser == null
// ? OnBordingScreen()
//     : MainScreen(),
