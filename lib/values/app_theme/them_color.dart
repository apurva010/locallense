import 'package:flutter/material.dart';
import 'package:locallense/values/app_colors.dart';

class ThemeColor extends ThemeExtension<ThemeColor> {
  ThemeColor({
    this.primaryColor,
    this.primaryColor2,
    this.secondaryColor1,
    this.scaffoldBackGroundColor,
    this.naturalBorderColor,
    this.whiteColor,
    this.unFilledProgressColor,
    this.textFieldLabelColor,
    this.appbarBackgroundColor,
    this.preferenceChipBorderColor,
    this.blackColor,
  });

  factory ThemeColor.light() => ThemeColor(
        primaryColor: AppColors.primaryColor,
        primaryColor2: AppColors.primaryColor2,
        secondaryColor1: AppColors.secondaryColor1,
        scaffoldBackGroundColor: AppColors.whiteColor,
        naturalBorderColor: AppColors.neutrals11,
        whiteColor: AppColors.whiteColor,
        unFilledProgressColor: AppColors.unFilledProgressColor,
        textFieldLabelColor: AppColors.textFieldLabelColor,
        appbarBackgroundColor: AppColors.whiteColor,
        preferenceChipBorderColor: AppColors.preferenceChipBorderColor,
        blackColor: AppColors.blackColor,
      );

  factory ThemeColor.dark() => ThemeColor(
        primaryColor: AppColors.primaryColor,
        primaryColor2: AppColors.primaryColor2,
        secondaryColor1: AppColors.secondaryColor1,
        whiteColor: AppColors.whiteColor,
        unFilledProgressColor: AppColors.unFilledProgressColor,
        textFieldLabelColor: AppColors.textFieldLabelColor,
        scaffoldBackGroundColor: AppColors.blackColor,
        naturalBorderColor: AppColors.neutrals11,
        preferenceChipBorderColor: AppColors.preferenceChipBorderColor,
        blackColor: AppColors.blackColor,
      );

  final Color? primaryColor;
  final Color? primaryColor2;
  final Color? secondaryColor1;
  final Color? preferenceChipBorderColor;
  final Color? scaffoldBackGroundColor;
  final Color? naturalBorderColor;
  final Color? unFilledProgressColor;
  final Color? textFieldLabelColor;
  final Color? appbarBackgroundColor;

  final Color? whiteColor;
  final Color? blackColor;

  @override
  ThemeExtension<ThemeColor> copyWith({
    Color? primaryColor,
    Color? primaryColor2,
    Color? secondaryColor1,
    Color? whiteColor,
    Color? unFilledProgressColor,
    Color? textFieldLabelColor,
    Color? preferenceChipBorderColor,
    Color? blackColor,
  }) {
    return ThemeColor(
      primaryColor: primaryColor ?? this.primaryColor,
      primaryColor2: primaryColor2 ?? this.primaryColor2,
      secondaryColor1: secondaryColor1 ?? this.secondaryColor1,
      whiteColor: whiteColor ?? this.whiteColor,
      unFilledProgressColor:
          unFilledProgressColor ?? this.unFilledProgressColor,
      textFieldLabelColor: textFieldLabelColor ?? this.textFieldLabelColor,
      preferenceChipBorderColor:
          preferenceChipBorderColor ?? this.preferenceChipBorderColor,
      blackColor: blackColor ?? this.blackColor,
    );
  }

  @override
  ThemeExtension<ThemeColor> lerp(
    covariant ThemeExtension<ThemeColor>? other,
    double t,
  ) {
    if (other is! ThemeColor) {
      return this;
    }
    return ThemeColor(
      primaryColor: Color.lerp(
        primaryColor,
        other.primaryColor,
        t,
      ),
      primaryColor2: Color.lerp(
        primaryColor2,
        other.primaryColor2,
        t,
      ),
      secondaryColor1: Color.lerp(
        secondaryColor1,
        other.secondaryColor1,
        t,
      ),
      whiteColor: Color.lerp(
        whiteColor,
        other.whiteColor,
        t,
      ),
      unFilledProgressColor: Color.lerp(
        unFilledProgressColor,
        other.unFilledProgressColor,
        t,
      ),
      textFieldLabelColor: Color.lerp(
        textFieldLabelColor,
        other.textFieldLabelColor,
        t,
      ),
      preferenceChipBorderColor: Color.lerp(
        preferenceChipBorderColor,
        other.preferenceChipBorderColor,
        t,
      ),
    );
  }
}
