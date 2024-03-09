import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCard extends StatelessWidget {
  final String title;
  final color;
  final String imagePathe;
  const MyCard({
    super.key,
    required this.imagePathe,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: 200,
        padding: EdgeInsets.only(top: 40),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(16)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Image(
              image: AssetImage(imagePathe),
              height: 200,
              width: 200,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.aBeeZee(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w300
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
