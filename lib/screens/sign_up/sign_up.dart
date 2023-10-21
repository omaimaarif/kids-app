
import 'package:another_final_kids_app/screens/login_screen/login_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../login_screen/login_form_widget.dart';

class SignUpScreen extends StatefulWidget {
   SignUpScreen({super.key, this.validator});
   final String? Function(String?)? validator;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> formState=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController  = TextEditingController();


    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
        color: Color(0x3ADDE7E7)
      ),
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

                    child: Form(
                      key: formState,
                      child: Column(
                        children: [
                       //   SizedBox(height: 20,),
                          TextFormField(
                            validator: (val){if(val==""){
                              return"This field cannot be left blank";
                            }},
                            decoration:  InputDecoration(
                              label:Text("Full name"),
                              contentPadding: EdgeInsets.symmetric(vertical: 14.0),
                              prefixIcon: Icon(Icons.person_outline_rounded),),

                          ),

                          SizedBox(height: 9,),
                          TextFormField(
                              validator: (val){if(val==""){
                                return"This field cannot be left blank";
                              }},
                              controller: emailController,
                              decoration:  InputDecoration(
                                label:Text("Full name"),
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
                              validator: (val){if(val==""){
                                return"This field cannot be left blank";
                              }},
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
                               if(formState.currentState!.validate()){
                                  try {
                                    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                    Navigator.of(context).pushReplacementNamed("HomePage");

                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'weak-password') {

                                      ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(

                                            content: Container(
                                                padding: EdgeInsets.all(16),
                                                height: 80,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                                  color: Color(0xFFBE5C56),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Oops!",style: TextStyle(
                                                        fontSize: 18,color: Colors.white, fontWeight: FontWeight.bold),),
                                                    Text("The password provided is too weak",style: TextStyle(
                                                        fontSize: 15, color: Colors.white),
                                                      maxLines: 2,
                                                      overflow: TextOverflow.ellipsis,),
                                                  ],
                                                )),
                                            behavior:SnackBarBehavior.floating,
                                            backgroundColor: Colors.transparent,
                                            elevation: 0,

                                          )

                                      );
                                    }
                                    else if (e.code == 'email-already-in-use') {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(

                                            content: Container(
                                                padding: EdgeInsets.all(16),
                                                height: 80,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                                  color: Color(0xFFBE5C56),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Warning!",style: TextStyle(
                                                        fontSize: 18,color: Colors.white, fontWeight: FontWeight.bold),),
                                                    Text("The account already exists for that email",style: TextStyle(
                                                        fontSize: 15, color: Colors.white),
                                                      maxLines: 2,
                                                      overflow: TextOverflow.ellipsis,),
                                                  ],
                                                )),
                                            behavior:SnackBarBehavior.floating,
                                            backgroundColor: Colors.transparent,
                                            elevation: 0,

                                          )
                                      );
                                    }
                                  } catch (e) {
                                    print(e);
                                  }
                                }

                                }
                               , style: ElevatedButton.styleFrom(
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
                ),
              )
              )
              )

            ],
          ),

      ),

    );
  }
}
