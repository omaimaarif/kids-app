import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../conistants/sizes.dart';
import '../../conistants/text_string.dart';
import '../forget_password/forget_password_btn_widget.dart';
import '../forget_password/forget_password_mail.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0x8BFFFFFF),
                  prefixIcon: Icon(Icons.person_outline),
                  labelText: "Email",
                  hintText: "Enter your email",
                  contentPadding: EdgeInsets.symmetric(vertical: 14.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0)),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              TextFormField(
                maxLength: 15,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0x8BFFFFFF),
                  prefixIcon: Icon(Icons.fingerprint),
                  labelText: "Password",
                  hintText: "Enter your password",
                  contentPadding: EdgeInsets.symmetric(vertical: 14.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
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
                              Text("any thing",style: Theme.of(context).textTheme.bodyMedium,),
                              SizedBox(height: 30.0,),
                              ForgetPasswordBtnWidget(
                                btnIcon:Icons.mail_outline_rounded ,
                                onTap:(){
                                  Navigator.pop(context);
                                  Get.to(()=> ForgetPasswordMailScreen());}
                                , title: "Make selection",
                                subTitle:"Reset via E-mail verification" ,
                              ),
                              SizedBox(height: 30.0,),

                              ForgetPasswordBtnWidget(
                                btnIcon:Icons.mobile_friendly_rounded ,
                                onTap:(){} ,
                                title: "Phone no",
                                subTitle:"Reset via phone verification" ,
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
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xCBA5C2C2),
                      foregroundColor: Colors.white,
                      side:  BorderSide(color: Color(0xFFA5C2C2)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)
                      ),
                      fixedSize: Size.fromHeight(40)
                    ),
                    child: Text(tLogin.toUpperCase())),
              )
              ,SizedBox(height: 5,)
            ],
          ),
        ));
  }
}

