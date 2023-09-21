import 'package:flutter/material.dart';
import '../../conistants/sizes.dart';
import 'login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
        color: Color(0xFFE9EDEE)
        ),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           SizedBox(height: 20),
           Row(
             children: [
               Image(image: AssetImage("lib/assets/heart.png"),
                 width: 30,height: 30,alignment: Alignment.topLeft,),

               Image(image: AssetImage("lib/assets/bird.png"),
                 width: 150,height: 150,alignment: Alignment.bottomLeft,),
             ],
           ),
            SizedBox(height: 20,),
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
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hello again!", style: TextStyle(
                          color: Color(0xFFA5C2C2) ,
                            fontWeight: FontWeight.bold,fontSize: 35)),
                        SizedBox(height: 30,)
                        ,LoginForm(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Or"),
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton.icon(
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: Color(0xFFA5C2C2)),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                    fixedSize: Size.fromHeight(40)
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
                              padding: EdgeInsets.only(bottom: 19.0),
                            ),
                            TextButton(
                              onPressed: () {},
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