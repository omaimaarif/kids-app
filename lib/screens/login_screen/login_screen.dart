import 'package:another_final_kids_app/screens/sign_up/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../conistants/sizes.dart';
import 'login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
        color: Color(0x3ADDE7E7)
        ),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           SizedBox(height: 5),
           Row(
             children: [
               Image(image: AssetImage("lib/assets/heart.png"),
                 width: 30,height: 30,alignment: Alignment.topLeft,),

               Image(image: AssetImage("lib/assets/bird.png"),
                 width: 150,height: 150,alignment: Alignment.bottomLeft,),
             ],
           ),
            SizedBox(height: 10,),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                padding: EdgeInsets.only(top: 30),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hello again!", style: GoogleFonts.courgette(
                                color: Color(0x385D7A7C) ,
                                fontWeight: FontWeight.bold,
                            fontSize: 35)),
                        SizedBox(height: 25,)
                        ,LoginForm(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Or", style:TextStyle(
                              color: Color(0x9B28292B)
                            ),),
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton.icon(
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: Color(0xDF5D7A7C)),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                    fixedSize: Size.fromHeight(45)
                                ),
                                icon: Image(
                                  image: AssetImage("lib/assets/google.png"),
                                  width: 20.0,
                                ),
                                onPressed: () {},
                                label: Text("Sign in with Google"),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 10.0),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                                );
                              },
                              child: Text.rich(
                                TextSpan(
                                  text: "Don't have an account?",
                                  style: Theme.of(context).textTheme.bodyText1,
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