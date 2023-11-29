import 'package:flutter/material.dart';

abstract class AppColors {
  static const boardBackgroundColor = Color(0xFFFFFFFF);
  static const backgroundColor =  Colors.white;
  static const highlight = Color(0xFF265073);
  static const lightBlue = Color(0xFF54C5F8);
  static const darkBlue = Color(0xFF01579B);
}

class AppTheme {
  final _darkBase = ThemeData.dark();

  ThemeData get darkTheme => _darkBase.copyWith(
        backgroundColor: AppColors.backgroundColor,
        highlightColor: AppColors.highlight,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(
              AppColors.highlight,
            ),
          ),
        ),
        sliderTheme: _darkBase.sliderTheme.copyWith(
          overlayColor: AppColors.darkBlue,
          thumbColor: AppColors.highlight,
          activeTrackColor: AppColors.lightBlue,
        ),
        dialogBackgroundColor: AppColors.boardBackgroundColor,
      );
}
