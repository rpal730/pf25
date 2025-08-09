import 'package:flutter/material.dart';

const _appLogo = 'assets/images/splash/app_logo.png';

class AppImage extends Image {
  AppImage(super.name, {super.key, super.width, super.height}) : super.asset();

  AppImage.appLogo({Key? key, double? width, double? height})
    : super.asset(
        _appLogo,
        key: key,
        width: width ?? 321,
        height: height ?? 75,
      );
}
