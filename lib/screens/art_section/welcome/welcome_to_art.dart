import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../activity/category_activity.dart';
import '../drawing_page.dart';


class WelcomToArtSection extends StatefulWidget {
  const WelcomToArtSection({super.key});
  @override
  State<WelcomToArtSection> createState() => _WelcomToArtSectionState();
}

class _WelcomToArtSectionState extends State<WelcomToArtSection> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value){
      Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (ctx)=> const DrawingPage()));
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

                Text("Start your artistic adventure\n And enjoy your time in the world of colors",
                  textAlign: TextAlign.center,
                  style:TextStyle(fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey,) ,),

                SizedBox(height: 100,),
                Image(image: AssetImage("lib/assets/images_paint/drawing (3).png"),
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
