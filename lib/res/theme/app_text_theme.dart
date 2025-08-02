import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_web_portfolio_2025/res/theme/app_colors.dart';

class AppTextTheme {
  static TextTheme textTheme() {
    return GoogleFonts.montserratTextTheme().copyWith(
      labelSmall: GoogleFonts.montserrat(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        height: 1.65,
      ),
      labelLarge: GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
      bodySmall: GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.5,
        letterSpacing: 0.2,
      ),
      bodyLarge: GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.5,
        letterSpacing: 0.2,
      ),
      // same as bodyText1, safe to modify it if we need to
      bodyMedium: GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.5,
        letterSpacing: 0.2,
      ),
      titleMedium: GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        height: 1.3,
      ),
      titleSmall: GoogleFonts.montserrat(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.5,
      ),
      titleLarge: GoogleFonts.montserrat(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        height: 1.3,
      ),
      headlineSmall:  GoogleFonts.montserrat(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        height: 1.4,
      ),
      headlineMedium: GoogleFonts.montserrat(
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      displaySmall:  GoogleFonts.montserrat(
        fontSize: 30,
        fontWeight: FontWeight.w700,
        height: 1.2,
      ),
      displayMedium:  GoogleFonts.montserrat(
        fontSize: 38,
        fontWeight: FontWeight.w700,
      ),
      displayLarge:  GoogleFonts.montserrat(
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  static TextTheme light() {
    return textTheme().withColors(
      captionColor: AppColors.text,
      overlineColor: AppColors.text,
      buttonColor: AppColors.background,
      bodyText1Color: AppColors.text,
      bodyText2Color: AppColors.text,
      subtitle1Color: AppColors.text,
      subtitle2Color: AppColors.text,
      headline1Color: AppColors.text,
      headline2Color: AppColors.text,
      headline3Color: AppColors.text,
      headline4Color: AppColors.text,
      headline5Color: AppColors.text,
      headline6Color: AppColors.text,
    );
  }
//tobe used later
  // static TextTheme dark() {
  //   return textTheme().withColors(
  //     captionColor: AppColors.cobaltBlue60,
  //     overlineColor: AppColors.cobaltBlue60,
  //     buttonColor: AppColors.white,
  //     bodyText1Color: AppColors.white,
  //     bodyText2Color: AppColors.white,
  //     subtitle1Color: AppColors.white,
  //     subtitle2Color: AppColors.white,
  //     headline1Color: AppColors.white,
  //     headline2Color: AppColors.white,
  //     headline3Color: AppColors.white,
  //     headline4Color: AppColors.white,
  //     headline5Color: AppColors.white,
  //     headline6Color: AppColors.white,
  //   );
  // }
}

extension TextColors on TextTheme {
  TextTheme withColors({
    Color captionColor = AppColors.text,
    Color overlineColor = AppColors.text,
    Color buttonColor = AppColors.background,
    Color bodyText1Color = AppColors.text,
    Color bodyText2Color = AppColors.text,
    Color subtitle1Color = AppColors.text,
    Color subtitle2Color = AppColors.text,
    Color headline1Color = AppColors.text,
    Color headline2Color = AppColors.text,
    Color headline3Color = AppColors.text,
    Color headline4Color = AppColors.text,
    Color headline5Color = AppColors.text,
    Color headline6Color = AppColors.text,
  }) {
    return merge(TextTheme(
      labelSmall: TextStyle(color: overlineColor),
      bodySmall: TextStyle(color: captionColor),
      labelLarge: TextStyle(color: buttonColor),
      bodyLarge: TextStyle(color: bodyText1Color),
      bodyMedium: TextStyle(color: bodyText2Color),
      titleMedium: TextStyle(color: subtitle1Color),
      titleSmall: TextStyle(color: subtitle2Color),
      titleLarge: TextStyle(color: headline6Color),
      headlineSmall: TextStyle(color: headline5Color),
      headlineMedium: TextStyle(color: headline4Color),
      displaySmall: TextStyle(color: headline3Color),
      displayMedium: TextStyle(color: headline2Color),
      displayLarge: TextStyle(color: headline1Color),
    ));
  }
}
