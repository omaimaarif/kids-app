import 'package:another_final_kids_app/screens/sign_up/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../conistants/sizes.dart';
import 'package:get/get.dart';
import 'login_form_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  Future  signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  if(googleUser== null){
    return;
  }
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
     await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.of(context).pushNamedAndRemoveUntil("HomePage", (route) => false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0x3ADDE7E7),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
                  "Hello again!",
                  style: GoogleFonts.courgette(
                    color: Color(0x385D7A7C),
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),),
        ),

            SizedBox(
              height: 20,),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                padding: EdgeInsets.only(top: 20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        LoginForm(validator: (val){if(val==""){
                            return"This field cannot be left blank";
                          }
                        }),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 2,),
                            Text(
                              "Or",
                              style: TextStyle(color: Color(0x9B28292B)),
                            ),
                            SizedBox(height: 2,),
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton.icon(
                                style: OutlinedButton.styleFrom(
                                    side: BorderSide(color: Color(0xFF6898A2)),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    fixedSize: Size.fromHeight(45)),
                                icon: Image(
                                  image: AssetImage("lib/assets/google.png"),
                                  width: 20.0,
                                ),
                                onPressed: () {
                                  signInWithGoogle();


                                },
                                label: Text("Sign in with Google"),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 10.0),
                            ),

                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed("signup");
                      },
                    child: Text.rich(
                      TextSpan(
                        text: "Don't have an account?",
                        style: TextStyle(
                          color: Colors.black45
                        ),
                        children: [
                          TextSpan(
                            text: "Sign up",
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),

                  ),
                    ),
                  ],
                ),
                ],
              ),
            ),
      ),
    ),
    ),
    ],
    ),
    ),
    );
  }
}