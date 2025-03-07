import 'package:flutter/material.dart';
import 'package:locallense/gen/fonts.gen.dart';
import 'package:locallense/values/app_colors.dart';
import 'package:locallense/values/app_theme/text_style_theme.dart';
import 'package:locallense/values/app_theme/them_color.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    splashFactory: NoSplash.splashFactory,
    scaffoldBackgroundColor: AppColors.whiteColor,
    fontFamily: FontFamily.jost,
    extensions: [
      ThemeColor.light(),
      TextStyleTheme.light(),
    ],
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    fontFamily: FontFamily.jost,
    extensions: [
      ThemeColor.dark(),
      TextStyleTheme.dark(),
    ],
  );
}
