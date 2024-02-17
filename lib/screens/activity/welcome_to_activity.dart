import 'package:another_final_kids_app/screens/activity/sorting_drag_select/activity_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

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

          Text("Enter a realm of fun and delight, waiting just seconds away..",
            textAlign: TextAlign.center,
            style:GoogleFonts.courgette(
              fontWeight: FontWeight.normal,
              fontSize: 18.0,color:Color(0xFF688382) ,
            )),

  //
  // style:TextStyle(fontSize: 24,
  //   fontWeight: FontWeight.w500,
  //   color: Colors.blueGrey,) ,),
          SizedBox(height: 100,),
          Image(image: AssetImage("lib/assets/come-back.png"),
            width: 200,
            alignment: Alignment.bottomCenter,),
        ],
      ),

      SizedBox(height: 50,),
     SpinKitWanderingCubes
        (
       color: Color(0xFFEABE7B),
       size: 50.0,
      ),
    ],
  ),
),
    );
  }
}
