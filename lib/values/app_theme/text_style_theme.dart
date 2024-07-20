import 'package:flutter/material.dart';
import 'package:locallense/values/app_colors.dart';

class TextStyleTheme extends ThemeExtension<TextStyleTheme> {
  TextStyleTheme({
    this.heroTextStyle,
    this.headLine1,
    this.headLine2,
    this.headLine3,
    this.headLine4,
    this.headLine5,
    this.headLine6,
    this.bodyTextLarge,
    this.bodyTextMedium,
    this.bodyTextBold,
    this.bodyTextRegular,
    this.bodyTextSmall,
    this.primaryButtonText,
    this.bodyMediumRegular,
    this.bodyXLargeSemiBold,
    this.bodyMediumSemiBold,
    this.bodyXSmallMedium,
    this.bodySmallRegular,
    this.bodyLargeMedium,
    this.bodySmallMedium,
  });

  factory TextStyleTheme.light() => TextStyleTheme(
        heroTextStyle: const TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.w800,
          color: AppColors.heroTextColor,
        ),
        headLine1: const TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.w800,
          color: AppColors.heroTextColor,
        ),
        headLine2: const TextStyle(
          fontSize: 40,
          color: AppColors.heroTextColor,
        ),
        headLine3: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: AppColors.heroTextColor,
        ),
        headLine4: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w800,
          color: AppColors.heroTextColor,
        ),
        headLine5: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w800,
          color: AppColors.heroTextColor,
        ),
        headLine6: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w800,
          color: AppColors.heroTextColor,
        ),
        bodyTextLarge: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: AppColors.heroTextColor,
        ),
        bodyTextRegular: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w200,
          color: AppColors.heroTextColor,
        ),
        bodyTextMedium: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: AppColors.heroTextColor,
        ),
        bodyTextBold: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.heroTextColor,
        ),
        primaryButtonText: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          height: 1.5,
          color: AppColors.primaryButtonTextColor,
        ),
        bodyLargeMedium: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.bodyXLargeSemiBold,
          letterSpacing: 0.2,
        ),
        bodyMediumRegular: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.bodyMediumRegular,
        ),
        bodyXLargeSemiBold: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.bodyXLargeSemiBold,
        ),
        bodyMediumSemiBold: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.bodyMediumSemiBold,
        ),
        bodyXSmallMedium: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: AppColors.bodyXSmallMedium,
        ),
        bodySmallRegular: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.bodySmallRegular,
          letterSpacing: 0.4,
        ),
        bodySmallMedium: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColors.bodySmallRegular,
          letterSpacing: 0.4,
        ),
      );

  factory TextStyleTheme.dark() => TextStyleTheme();

  final TextStyle? heroTextStyle;
  final TextStyle? headLine1;
  final TextStyle? headLine2;
  final TextStyle? headLine3;
  final TextStyle? headLine4;
  final TextStyle? headLine5;
  final TextStyle? headLine6;
  final TextStyle? bodyTextLarge;
  final TextStyle? bodyTextMedium;
  final TextStyle? bodyTextBold;
  final TextStyle? bodyTextRegular;
  final TextStyle? bodyTextSmall;
  final TextStyle? bodyMediumRegular;
  final TextStyle? bodyXLargeSemiBold;
  final TextStyle? bodyMediumSemiBold;
  final TextStyle? bodyXSmallMedium;
  final TextStyle? bodySmallRegular;

  final TextStyle? primaryButtonText;
  final TextStyle? bodyLargeMedium;
  final TextStyle? bodySmallMedium;

  @override
  TextStyleTheme copyWith({
    TextStyle? heroTextStyle,
    TextStyle? headLine1,
    TextStyle? headLine2,
    TextStyle? headLine3,
    TextStyle? headLine4,
    TextStyle? headLine5,
    TextStyle? headLine6,
    TextStyle? bodyTextLarge,
    TextStyle? bodyTextMedium,
    TextStyle? bodyTextBold,
    TextStyle? bodyTextRegular,
    TextStyle? bodyTextSmall,
    TextStyle? primaryButtonText,
    TextStyle? bodyMediumRegular,
    TextStyle? bodyXLargeSemiBold,
    TextStyle? bodyMediumSemiBold,
    TextStyle? bodyXSmallMedium,
    TextStyle? bodySmallRegular,
  }) {
    return TextStyleTheme(
      heroTextStyle: heroTextStyle ?? this.heroTextStyle,
      headLine1: headLine1 ?? this.headLine1,
      headLine2: headLine2 ?? this.headLine2,
      headLine3: headLine3 ?? this.headLine3,
      headLine4: headLine4 ?? this.headLine4,
      headLine5: headLine5 ?? this.headLine5,
      headLine6: headLine6 ?? this.headLine6,
      bodyTextLarge: bodyTextLarge ?? this.bodyTextLarge,
      bodyTextMedium: bodyTextMedium ?? this.bodyTextMedium,
      bodyTextBold: bodyTextBold ?? this.bodyTextBold,
      bodyTextRegular: bodyTextRegular ?? this.bodyTextRegular,
      bodyTextSmall: bodyTextSmall ?? this.bodyTextSmall,
      primaryButtonText: primaryButtonText ?? this.primaryButtonText,
      bodyMediumRegular: bodyMediumRegular ?? this.bodyMediumRegular,
      bodyXLargeSemiBold: bodyXLargeSemiBold ?? this.bodyXLargeSemiBold,
      bodyMediumSemiBold: bodyMediumSemiBold ?? this.bodyMediumSemiBold,
      bodyXSmallMedium: bodyXSmallMedium ?? this.bodyXSmallMedium,
      bodySmallRegular: bodySmallRegular ?? this.bodySmallRegular,
    );
  }

  @override
  TextStyleTheme lerp(covariant TextStyleTheme? other, double t) {
    if (other is! TextStyleTheme) {
      return this;
    }
    return TextStyleTheme(
      heroTextStyle: TextStyle.lerp(
        heroTextStyle,
        other.heroTextStyle,
        t,
      ),
      headLine1: TextStyle.lerp(
        headLine1,
        other.headLine1,
        t,
      ),
      headLine2: TextStyle.lerp(
        headLine2,
        other.headLine2,
        t,
      ),
      headLine3: TextStyle.lerp(
        headLine3,
        other.headLine3,
        t,
      ),
      headLine4: TextStyle.lerp(
        headLine4,
        other.headLine4,
        t,
      ),
      headLine5: TextStyle.lerp(
        headLine5,
        other.headLine5,
        t,
      ),
      headLine6: TextStyle.lerp(
        headLine6,
        other.headLine6,
        t,
      ),
      bodyTextLarge: TextStyle.lerp(
        bodyTextLarge,
        other.bodyTextLarge,
        t,
      ),
      bodyTextMedium: TextStyle.lerp(
        bodyTextMedium,
        other.bodyTextMedium,
        t,
      ),
      bodyTextBold: TextStyle.lerp(
        bodyTextBold,
        other.bodyTextBold,
        t,
      ),
      bodyTextRegular: TextStyle.lerp(
        bodyTextRegular,
        other.bodyTextRegular,
        t,
      ),
      bodyTextSmall: TextStyle.lerp(
        bodyTextSmall,
        other.bodyTextSmall,
        t,
      ),
      primaryButtonText: TextStyle.lerp(
        primaryButtonText,
        other.primaryButtonText,
        t,
      ),
      bodyMediumRegular: TextStyle.lerp(
        bodyMediumRegular,
        other.bodyMediumRegular,
        t,
      ),
      bodyXLargeSemiBold: TextStyle.lerp(
        bodyXLargeSemiBold,
        other.bodyXLargeSemiBold,
        t,
      ),
      bodyMediumSemiBold: TextStyle.lerp(
        bodyMediumSemiBold,
        other.bodyMediumSemiBold,
        t,
      ),
      bodyXSmallMedium: TextStyle.lerp(
        bodyXSmallMedium,
        other.bodyXSmallMedium,
        t,
      ),
      bodySmallRegular: TextStyle.lerp(
        bodySmallRegular,
        other.bodySmallRegular,
        t,
      ),
    );
  }
}
