import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio_2025/res/theme/app_colors.dart';
import 'package:flutter_web_portfolio_2025/res/theme/app_text_theme.dart';
import 'package:flutter_web_portfolio_2025/res/theme/app_widgets_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData light() {
    final textTheme = AppTextTheme.light();
    final colorScheme = const ColorScheme.light().copyWith(
      brightness: Brightness.light,
      surfaceContainer: AppColors.text,
      surface: AppColors.background,
      onSurface: AppColors.text,
      primary: AppColors.primary,
      onPrimary: AppColors.white,
      secondary: AppColors.secondary,
      onSecondary: AppColors.white,
      error: AppColors.error,
      onError: AppColors.white,
      inversePrimary: AppColors.primary.withOpacity(0.2),
      inverseSurface: AppColors.primary,
      onInverseSurface: AppColors.white,
      
    );

    return ThemeData.from(
      colorScheme: colorScheme,
      textTheme: textTheme,
    ).copyWith(
      splashColor: Colors.transparent,
      dividerTheme: dividerTheme.copyWith(
        color: colorScheme.onSurface.withOpacity(0.2),
      ),
      appBarTheme: appBarTheme.copyWith(
        iconTheme: IconThemeData(color: colorScheme.onSurface),
        color: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        surfaceTintColor: colorScheme.surface,
        titleTextStyle:
            textTheme.displayLarge!.copyWith(color: colorScheme.onSurface),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: colorScheme.surface,
        surfaceTintColor: colorScheme.surface,
      ),
      snackBarTheme: snackBarTheme.copyWith(
        backgroundColor: colorScheme.surface,
        contentTextStyle: textTheme.bodyLarge!.copyWith(color: AppColors.white),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: outlinedButtonStyle.merge(OutlinedButton.styleFrom(
          foregroundColor: colorScheme.onSurface,
          side: BorderSide(color: colorScheme.onSurface.withOpacity(0.4)),
        )),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: elevatedButtonStyle(colorScheme),
      ),
      textButtonTheme: TextButtonThemeData(
        style: textButtonStyle,
      ),
      inputDecorationTheme: inputDecorationTheme.copyWith(
        fillColor: colorScheme.onSurface.withOpacity(0.05),
        helperStyle: textTheme.bodySmall,
        hintStyle: textTheme.titleMedium!.copyWith(
          color: textTheme.bodySmall!.color,
        ),
      ),
    );
  }

  
  //DARK theme is not required right now may be used in future then work will be done here
  // static ThemeData dark() {
  //   final textTheme = AppTextTheme.dark();
  //   final colorScheme = const ColorScheme.dark().copyWith(
  //     brightness: Brightness.dark,
  //     background: AppColors.black,
  //     surfaceContainer: AppColors.black,
  //     onBackground: AppColors.white,
  //     surface: AppColors.grey.shade900,
  //     onSurface: AppColors.white,
  //     primary: AppColors.cobaltBlue.shade400,
  //     onPrimary: AppColors.white,
  //     secondary: AppColors.cobaltBlue.shade400,
  //     onSecondary: AppColors.white,
  //     error: AppColors.negativeRed,
  //     onError: AppColors.white,
  //     inversePrimary: AppColors.white,
  //     inverseSurface: AppColors.cobaltBlue.shade400.withOpacity(0.32),
  //     onInverseSurface: AppColors.white,
  //   );

  //   return ThemeData.from(
  //     colorScheme: colorScheme,
  //     textTheme: textTheme,
  //   ).copyWith(
  //     splashColor: Colors.transparent,
  //     applyElevationOverlayColor: false,
  //     dividerTheme: dividerTheme.copyWith(
  //       color: colorScheme.onSurface.withOpacity(0.2),
  //     ),
  //     dialogTheme: DialogTheme(
  //       backgroundColor: colorScheme.surface,
  //       surfaceTintColor: colorScheme.surface,
  //     ),
  //     appBarTheme: appBarTheme.copyWith(
  //       color: colorScheme.surface,
  //       foregroundColor: colorScheme.onSurface,
  //       surfaceTintColor: colorScheme.surface,
  //     ),
  //     snackBarTheme: snackBarTheme.copyWith(
  //       backgroundColor: AppColors.greyShade700,
  //       contentTextStyle: textTheme.bodyLarge!.copyWith(color: AppColors.white),
  //     ),
  //     outlinedButtonTheme: OutlinedButtonThemeData(
  //       style: outlinedButtonStyle.merge(OutlinedButton.styleFrom(
  //         foregroundColor: colorScheme.onSurface,
  //         side: BorderSide(color: colorScheme.onSurface.withOpacity(0.4)),
  //       )),
  //     ),
  //     elevatedButtonTheme: ElevatedButtonThemeData(
  //       style: elevatedButtonStyle(colorScheme),
  //     ),
  //     textButtonTheme: TextButtonThemeData(
  //       style: textButtonStyle,
  //     ),
  //     inputDecorationTheme: inputDecorationTheme.copyWith(
  //       fillColor: colorScheme.onSurface.withOpacity(0.05),
  //       helperStyle: textTheme.bodySmall,
  //       hintStyle: textTheme.titleMedium!.copyWith(
  //         color: textTheme.bodySmall!.color,
  //       ),
  //     ),
  //   );
  // }
}
