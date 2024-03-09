import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button_for_chat_screens extends StatelessWidget {
  Button_for_chat_screens({required this.color, required this.title, required this.onPressed});

  final Color color;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        elevation: 5,
        color: color,
        borderRadius: BorderRadius.circular(40),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 150,
          height: 40,
          child: Text(
            title,
            style: GoogleFonts.aBeeZee(
                color: Colors.white,
                    fontSize: 18,
              fontWeight: FontWeight.normal
            ),
          ),
        ),
      ),
    );
  }
}
