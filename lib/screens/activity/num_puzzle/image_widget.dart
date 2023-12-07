import 'package:flutter/material.dart';

class ImageDisplay extends StatelessWidget {
  String imagePath;
   ImageDisplay(this.imagePath,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath,),

        )
      ),
    );
  }
}
