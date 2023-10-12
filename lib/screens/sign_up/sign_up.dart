
import 'package:another_final_kids_app/screens/login_screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../login_screen/login_form_widget.dart';

class SignUpScreen extends StatefulWidget {
   SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController  = TextEditingController();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
        color: Color(0x3ADDE7E7)
      ),
        child: Form(
          child: Column(
            children: [
            SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image(image: AssetImage("lib/assets/woolly-fly.png"),
                    width: 40,height: 40,alignment: Alignment.topRight),
                  SizedBox(width: 130,),
                  Image(image: AssetImage("lib/assets/woolly-koala.png"),
                    width: 190,height: 190,alignment: Alignment.bottomLeft,),
                ],
              ),
              Expanded(child:Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(35),
                    child: Column(

                      children: [
                     //   SizedBox(height: 20,),
                        TextFormField(
                          decoration:  InputDecoration(
                            label:Text("Full name"),
                            contentPadding: EdgeInsets.symmetric(vertical: 14.0),
                            prefixIcon: Icon(Icons.person_outline_rounded),),

                        ),

                        SizedBox(height: 9,),
                        TextFormField(
                            controller: emailController,
                            decoration:  InputDecoration(
                              label:Text("Email"),
                              contentPadding: EdgeInsets.symmetric(vertical: 14.0),
                              prefixIcon: Icon(Icons.email_outlined),)
                        ),
                        SizedBox(height: 9,),
                        TextFormField(
                            decoration:  InputDecoration(
                              label:Text("Phone number"),
                              contentPadding: EdgeInsets.symmetric(vertical: 14.0),
                              prefixIcon: Icon(Icons.numbers_outlined),)
                        ),
                        SizedBox(height: 9,),
                        TextFormField(
                            controller: passwordController,
                            maxLength: 15,
                            decoration:  InputDecoration(
                              label:Text("Password"),
                              contentPadding: EdgeInsets.symmetric(vertical: 14.0),
                              prefixIcon: Icon(Icons.lock),)
                        ),
                        SizedBox(height:20,),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed:() async {
                                try {
                                  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                  Navigator.of(context).pushReplacementNamed("HomePage");

                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'weak-password') {
                                    print('The password provided is too weak.');
                                  } else if (e.code == 'email-already-in-use') {
                                    print('The account already exists for that email.');
                                  }
                                } catch (e) {
                                  print(e);
                                }

                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xDF5D7A7C),
                                  foregroundColor: Colors.white,
                                  side:  BorderSide(color: Color(0xFFA5C2C2)),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0)
                                  ),
                                  fixedSize: Size.fromHeight(45)
                              ),
                              child: Text("Sign up".toUpperCase()))

                        ),
                        Column(
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => LoginScreen()),
                                );
                              },
                              child:
                              Center(
                                child: Text.rich(TextSpan(children: [
                                  TextSpan(
                                    text: "Already have an acoount? ",
                                    style: Theme.of(context).textTheme.bodyText1,
                                  ),
                                  TextSpan(text: "Login now".toUpperCase())
                                ])),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                ),
              )
              )
              )

            ],
          ),
        ),
      ),

    );
  }
}
