import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio_2025/res/theme/app_colors.dart';

const _roundedShape8 = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(Radius.circular(8)),
);
const buttonMinimumSize = Size(200, 52);
const buttonSizeWhenAudio = Size(200, 250);

final outlinedButtonStyle = OutlinedButton.styleFrom(
  minimumSize: buttonMinimumSize,
  shape: _roundedShape8,
);

/*final elevatedButtonStyle = OutlinedButton.styleFrom(
  minimumSize: buttonMinimumSize,
  elevation: 0,
  shadowColor: AppColors.transparent,
  shape: _roundedShape8,
);*/

ButtonStyle elevatedButtonStyle(ColorScheme colorScheme) =>
    OutlinedButton.styleFrom(
      minimumSize: buttonMinimumSize,
      elevation: 0,
      shadowColor: AppColors.transparent,
      shape: _roundedShape8,
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      disabledBackgroundColor: colorScheme.onSurface.withOpacity(0.12),
      padding: EdgeInsets.zero,
    );

final textButtonStyle = TextButton.styleFrom(
  minimumSize: buttonMinimumSize,
  elevation: 0,
  shadowColor: AppColors.transparent,
  shape: _roundedShape8,
);

const dividerTheme = DividerThemeData(space: 0, thickness: 1);

const appBarTheme = AppBarTheme(elevation: 0);

const snackBarTheme = SnackBarThemeData(
  elevation: 0,
  behavior: SnackBarBehavior.floating,
  shape: _roundedShape8,
);

const inputDecorationTheme = InputDecorationTheme(
  filled: true,
  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
  floatingLabelBehavior: FloatingLabelBehavior.never,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(color: Colors.transparent),
  ),
);
