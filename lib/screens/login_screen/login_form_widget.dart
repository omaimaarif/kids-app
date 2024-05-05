import 'package:another_final_kids_app/screens/messagin/widgets/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../conistants/sizes.dart';
import '../../conistants/text_string.dart';
import '../forget_password/forget_password_btn_widget.dart';
import '../forget_password/forget_password_mail.dart';
import 'package:get/get.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key? key, required this.validator}) : super(key: key);
  final String? Function(String?)? validator;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController email_login = TextEditingController();
    final TextEditingController password_login = TextEditingController();

    GlobalKey<FormState> formState = GlobalKey<FormState>();
    return Form(
        key: formState,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                validator: widget.validator,
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
                validator: widget.validator,
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
                      onPressed: null, icon: Icon(Icons.remove_red_eye_sharp)),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      builder: (context) => Container(

                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              "Make selection!",
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                fontWeight: FontWeight.bold,
                                fontSize: 30
                              )
                             ,
                            ),
                            Text(
                              "Choose a recovery method for your account",
                              style: GoogleFonts.aBeeZee(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15
                              ),
                            ),
                            SizedBox(
                              height: 40.0,
                            ),
                            ForgetPasswordBtnWidget(
                              btnIcon: Icons.mail_outline_rounded,
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ForgetPasswordMailScreen(
                                            email_forget: email_login.text,
                                          )),
                                );
                              },
                              title: "Recover via Email",
                              subTitle: "Recover Password via Email",
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            ForgetPasswordBtnWidget(
                              btnIcon: Icons.mobile_friendly_rounded,
                              onTap: () {},
                              title: "Recover via Phone Number",
                              subTitle: "Recover Password Phone Number",
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  child: Text("Forget password?",
                      style: TextStyle(color: Color(0xFF599099))),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              SizedBox(
                width: double.infinity,
                child: Button_for_chat_screens(
                  onPressed: () async {
                    if (formState.currentState!.validate()) {
                      try {
                        final credential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: email_login.text,
                                password: password_login.text);
                        Navigator.of(context).pushReplacementNamed("HomePage");
                      } on FirebaseAuthException catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Container(
                              padding: EdgeInsets.all(16),
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Color(0xFFBE5C56),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Something wrong!",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "No user found for that email",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              )),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ));
                        if (e.code == 'user-not-found') {
                        } else if (e.code == 'wrong-password') {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.error,
                            animType: AnimType.rightSlide,
                            title: 'Error',
                            desc: 'Wrong password provider for that user',
                          ).show();
                        }
                      }
                    } else {
                      print("Not valid");
                    }
                  },
                  color: Color(0xFF599099),
                  title: 'Login',
                ),
              ),
              SizedBox(
                height: 2,
              )
            ],
          ),
        ));
  }
}
