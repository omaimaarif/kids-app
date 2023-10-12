
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../conistants/sizes.dart';
import '../../conistants/text_string.dart';
import '../forget_password/forget_password_btn_widget.dart';
import '../forget_password/forget_password_mail.dart';
import 'package:get/get.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController email_login = TextEditingController();
    final TextEditingController password_login  = TextEditingController();

    GlobalKey<FormState> formState=GlobalKey<FormState>();
    return Form(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: email_login,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0x8BFFFFFF),
                  prefixIcon: Icon(Icons.person_outline),
                  labelText: "Email",
                  hintText: "Enter your email",
                  contentPadding: EdgeInsets.symmetric(vertical: 9.0),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              TextFormField(
                controller: password_login,
                maxLength: 15,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0x8BFFFFFF),
                  prefixIcon: Icon(Icons.fingerprint),
                  labelText: "Password",
                  hintText: "Enter your password",
                  contentPadding: EdgeInsets.symmetric(vertical: 14.0),
               //   border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
                  suffixIcon: IconButton(
                      onPressed: null,
                      icon: Icon(Icons.remove_red_eye_sharp) ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      showModalBottomSheet(context: context,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                        builder: (context) => Container(
                          padding: EdgeInsets.all(tDefaultSize),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Make selection!", style: Theme.of(context).textTheme.headlineMedium,),
                              Text("Choose a recovery method for your account",style: Theme.of(context).textTheme.bodyMedium,),
                              SizedBox(height: 30.0,),
                              ForgetPasswordBtnWidget(
                                btnIcon:Icons.mail_outline_rounded ,
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ForgetPasswordMailScreen()),
                                  );
                                }
                                , title: "Recover via Email",
                                subTitle:"Recover Password via Email" ,
                              ),
                              SizedBox(height: 30.0,),

                              ForgetPasswordBtnWidget(
                                btnIcon:Icons.mobile_friendly_rounded ,
                                onTap:(){} ,
                                title: "Recover via Phone Number",
                                subTitle:"Recover Password via Phone Number" ,
                              )

                            ],
                          ),

                        ),
                      );
                    }, child: Text("Forget password?")),
              ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () async {
                           try {
                             final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                 email: email_login.text,
                                 password: password_login.text
                             );
                             Navigator.of(context).pushReplacementNamed("HomePage");
                           } on FirebaseAuthException catch (e) {
                             if (e.code == 'user-not-found') {

                               Get.defaultDialog();
                             } else if (e.code == 'wrong-password') {
                               Get.defaultDialog();
                             }
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
                    child: Text(tLogin.toUpperCase())),
              )
              ,SizedBox(height: 2,)
            ],
          ),
        ));
  }
}


