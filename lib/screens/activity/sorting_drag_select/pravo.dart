import 'package:flutter/material.dart';

class win extends StatefulWidget {
  const win({Key? key}) : super(key: key);

  @override
  State<win> createState() => _winState();
}

class _winState extends State<win> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 0, left: 0),
          child: Image(
            image: AssetImage("lib/assets/p (2).png"),
          ),
        ),
        SizedBox(height: 40,),
        Column(
          children: [
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      'Congratulations!',
                      style: TextStyle(
                          fontFamily: 'TitanOne',
                          fontSize: 32,
                          color: Colors.amber
                      ),
                    ),),
            Text("You have completed the test\n Your score is ")
          ],
        )
      ],
    );
  }
}
