import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  final String IconImagePath;
  final String buttonText;

  const MyButtons({super.key,
  required this.buttonText,
  required this.IconImagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Icons
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 10,
                    spreadRadius: 4
                )
              ]),
          height: 100,
          child: Center(
            child: Image(image: AssetImage(IconImagePath),height: 50,),
          ),
        ),
        SizedBox(height: 8,),
        //text
        Text(buttonText,style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold,
            color: Colors.blueGrey[700] ),)
      ],
    );
  }
}
