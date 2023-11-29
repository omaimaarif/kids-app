import 'package:another_final_kids_app/screens/messagin/screens_message/registration_screen.dart';
import 'package:another_final_kids_app/screens/messagin/screens_message/signin_screen.dart';
import 'package:another_final_kids_app/screens/messagin/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class WelcomeScreen extends StatefulWidget {
  static const String screenRoute = 'welcome_screen';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Container(
                  height: 240,
                  child: Image.asset('lib/assets/communication.png'),
                ),
                SizedBox(height: 50,),
                Text(
                  ' Thanks for joining us!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 3,),
                Text(
                      "To access the messaging area, please select one of the following options",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),


              ],
            ),
            SizedBox(height: 30),
            Button_for_chat_screens(
              color: Color(0xFF6898A2),
              title: 'Sign in',
              onPressed: () {
                Navigator.of(context).pushNamed('login');
              },
            ),
            Button_for_chat_screens(
              color: Colors.grey,
              title: 'register',
              onPressed: () {
                Navigator.of(context).pushNamed('sign_up');
              },
            )
          ],
        ),
      ),
    );
  }
}
