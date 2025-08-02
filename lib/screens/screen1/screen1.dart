import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio_2025/res/brutalism_container.dart';
import 'package:flutter_web_portfolio_2025/res/theme/app_colors.dart';
import 'package:flutter_web_portfolio_2025/res/ui_helper.dart';

@RoutePage()
class Screen1Screen extends StatelessWidget {
  const Screen1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: AppColors.secondary,
        width: figmaScreenWidth,
        height: figmaScreenHeight,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(color: AppColors.primary, width: figmaScreenWidth, height: figmaScreenHeight * 0.5),
              BrutalismContainer(topBorderBold: true, bottomBorderBold: false, child: const Text('RAHUL PAL, FLUTTER DEVELOPER', style: TextStyle(fontWeight: FontWeight.bold))),
            ],
          ),
        ),
      ),
    );
  }
}
