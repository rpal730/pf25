import 'dart:math';

import 'package:flutter/material.dart';

class AppColors {
  AppColors._();


  // Core extracted palette
  static const Color _lavender = Color(0xffd3b5f3);
  static const Color _mint = Color(0xffb6f0d2);
  static const Color _peach = Color(0xfff4a56a);
  static const Color _yellow = Color(0xfff5e05a);
  static const Color _darkText = Color(0xff282828);
  static const Color _lightGray = Color(0xffc8c8c8);
  static const Color _white = Color(0xffffffff);

  static Color get random {
  final colors = [
    primary,
    secondary,
    accentPeach,
    accentYellow,
    background,
  ];
  return colors[Random().nextInt(colors.length)];
}

  // Primary: Lavender
  static const MaterialColor primary = MaterialColor(
    0xffd3b5f3,
    <int, Color>{
      50: Color(0xfff3ecfd),
      100: Color(0xffe7d9fb),
      200: Color(0xffd9c5f8),
      300: Color(0xffccb2f6),
      400: Color(0xffbf9ff3),
      500: Color(0xffd3b5f3), // base
      600: Color(0xffb68fe0),
      700: Color(0xff9979cd),
      800: Color(0xff7c54b9),
      900: Color(0xff5f3ea6),
    },
  );

  // Secondary: Mint
  static const MaterialColor secondary = MaterialColor(
    0xffb6f0d2,
    <int, Color>{
      50: Color(0xffecfbf5),
      100: Color(0xffd9f7eb),
      200: Color(0xffb6f0d2), // base light
      300: Color(0xff93e8b8),
      400: Color(0xff70e09f),
      500: Color(0xff4dd786),
      600: Color(0xff3bb56f),
      700: Color(0xff2a9360),
      800: Color(0xff186f50),
      900: Color(0xff064d40),
    },
  );

  // Accent 1: Peach
  static const MaterialColor accentPeach = MaterialColor(
    0xfff4a56a,
    <int, Color>{
      50: Color(0xfffff3ec),
      100: Color(0xffffe7d9),
      200: Color(0xffffd9c5),
      300: Color(0xffffccb2),
      400: Color(0xffffbf9f),
      500: Color(0xfff4a56a), // base
      600: Color(0xffd68755),
      700: Color(0xffb86940),
      800: Color(0xff944b2b),
      900: Color(0xff6f3218),
    },
  );

  // Accent 2 / Highlight: Yellow
  static const MaterialColor accentYellow = MaterialColor(
    0xfff5e05a,
    <int, Color>{
      50: Color(0xfffffbed),
      100: Color(0xfffff7db),
      200: Color(0xfffff3c9),
      300: Color(0xffffefb7),
      400: Color(0xffffebA6),
      500: Color(0xfff5e05a), // base
      600: Color(0xffd4c34d),
      700: Color(0xffb3a640),
      800: Color(0xff928933),
      900: Color(0xff6f6d26),
    },
  );

  // Text
  static const Color textBase = _darkText;
  static const MaterialColor text = MaterialColor(
    0xff282828,
    <int, Color>{
      50: Color(0xfff2f2f2),
      100: Color(0xffe6e6e6),
      200: Color(0xffc9c9c9),
      300: Color(0xffadadad),
      400: Color(0xff919191),
      500: Color(0xff757575),
      600: Color(0xff5a5a5a),
      700: Color(0xff3f3f3f),
      800: Color(0xff242424),
      900: Color(0xff0a0a0a),
    },
  );

  // Backgrounds / neutrals
  static const Color backgroundBase = _white;
  static const MaterialColor background = MaterialColor(
    0xffffffff,
    <int, Color>{
      50: Color(0xffffffff),
      100: Color(0xffffffff),
      200: Color(0xfff9f9fa),
      300: Color(0xfff2f2f4),
      400: Color(0xffebebee),
      500: Color(0xffe4e4f0),
      600: Color(0xffd6d6e1),
      700: Color(0xffc8c8d2),
      800: Color(0xffbabac3),
      900: Color(0xffacacb4),
    },
  );

  static const Color neutralLight = _lightGray;

  // Error (fallback; you can replace with on-theme error if desired)
  static const Color errorBase = Color(0xfff24c4c);
  static const MaterialColor error = MaterialColor(
    0xfff24c4c,
    <int, Color>{
      50: Color(0xffffe6e6),
      100: Color(0xffffb3b3),
      200: Color(0xffff8080),
      300: Color(0xffff4d4d),
      400: Color(0xffff1a1a),
      500: Color(0xfff24c4c),
      600: Color(0xffcc4040),
      700: Color(0xffa63333),
      800: Color(0xff802626),
      900: Color(0xff591919),
    },
  );

  // Transparent & white
  static const Color transparent = Color(0x00000000);
  static const Color white = _white;
}