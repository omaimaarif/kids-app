
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ForgetPasswordMailScreen extends StatelessWidget {
   ForgetPasswordMailScreen({super.key, required this.email_forget});
  final String email_forget;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Image(
                image:
                AssetImage("lib/assets/forget.png"),width: 150,height: 150,),
              SizedBox(height: 20),
              Text("Yo! Forgot your password?", style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text("No worries! Enter your email and we will send you a reset", style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center),

              SizedBox(height: 20),
              Form(child: Column(
                children: [

                  TextFormField(
                    decoration: InputDecoration(
                      label: Text(email_forget),
                      hintText: "Email",
                      prefixIcon: Icon(Icons.mail_outline_rounded),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: ()async {

                      if(email_forget==""){
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.warning,
                          animType: AnimType.rightSlide,
                          title: 'Something wrong!',
                          desc: 'Please enter your email',
                        ).show();
                        return;
                      }
                      try{
                        await FirebaseAuth.instance.sendPasswordResetEmail(
                            email:email_forget);

                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.success,
                          animType: AnimType.rightSlide,
                          title: 'Done!',
                          desc: 'Your request is being processed, Please check your email',
                        ).show();
                      }catch(e){
                        print(e);
                      }
                    },
                      child: Text("Send request"),

                    ),
                  )

                ],
              ))
            ],

          ),
        ),
      ),
    );
  }
}
