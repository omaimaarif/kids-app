import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../const.dart';

class Button_for_math_game extends StatelessWidget {
  final String child;
  final VoidCallback onTap;
  var buttonColor = Color(0xFF1A2933);

  Button_for_math_game({
    Key? key,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (child == 'C') {
      buttonColor = Color(0xFFBFB29E);
    } else if (child == 'DEL') {
      buttonColor = Color(0x9D1C2B35);
    } else if (child == '=') {
      buttonColor = Color(0xFF818FB4);
    }
   else if (child == 'Retry') {
  buttonColor = Color(0xFF818FB4);
  }

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Text(
              child,
              style:GoogleFonts.aBeeZee(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Colors.white,
              )
            ),
          ),
        ),
      ),
    );
  }
}
