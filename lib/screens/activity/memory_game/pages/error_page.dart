import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../theme/app_theme.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      child: Center(
        child: Text(
          'Error :( \n Check your internet connection',
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.center,
          style: textStyle,
        ),
      ),
    );
  }

}
final appTheme = ThemeData(
    textTheme: TextTheme(
      bodyText2: textStyle,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: Colors.blueAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      titleTextStyle: textStyle,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            primary: Colors.lightBlue,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            textStyle: textStyle.copyWith(fontSize: 50))));

final textStyle = TextStyle(
    fontFamily: GoogleFonts.bubblegumSans().fontFamily,
    fontSize: 40,
    color: Colors.white);

