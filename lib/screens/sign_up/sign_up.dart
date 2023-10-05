import 'package:another_final_kids_app/home_page/home_screen.dart';
import 'package:another_final_kids_app/screens/login_screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../login_screen/login_form_widget.dart';

class SignUpScreen extends StatelessWidget {
   SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                            onPressed:(){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => HomePageScreen()),
                              );
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

    );
  }
}
