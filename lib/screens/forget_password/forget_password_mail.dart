
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({super.key});

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
              Text("Forget password", style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text("Select one of the option given below to reset your password", style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center),

              SizedBox(height: 20),
              Form(child: Column(
                children: [

                  TextFormField(
                    decoration: InputDecoration(
                      label: Text("Email"),
                      hintText: "Email",
                      prefixIcon: Icon(Icons.mail_outline_rounded),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: (){},
                      child: Text("Next"),

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
