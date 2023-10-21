import 'package:another_final_kids_app/screens/activity/activity_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'category_activity.dart';

class WelcomToActivity extends StatefulWidget {
  const WelcomToActivity({super.key});
  @override
  State<WelcomToActivity> createState() => _WelcomToActivityState();
}

class _WelcomToActivityState extends State<WelcomToActivity> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value){
      Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (ctx)=> const CategoryActivity()));
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: SizedBox(
  width: double.infinity,
  child: Column(
    children: [
      Column(
crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 150,),
          Text("Step into a world of play and enjoyment right here..",
            textAlign: TextAlign.center,
            style:TextStyle(fontSize: 24,
            color: Colors.blueGrey,) ,),

          SizedBox(height: 50,),
          Image(image: AssetImage("lib/assets/activity_screen.png"),
            width: 200,
            alignment: Alignment.bottomCenter,),
        ],
      ),

      SizedBox(height: 50,),
     SpinKitWanderingCubes
        (
       color: Color(0xFFD5A5A8),
       size: 50.0,
      ),
    ],
  ),
),
    );
  }
}
