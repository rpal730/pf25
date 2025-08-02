import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio_2025/res/theme/app_colors.dart';
import 'package:flutter_web_portfolio_2025/res/ui_helper.dart';

@RoutePage()
class Screen4Screen extends StatelessWidget {
  const Screen4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: AppColors.accentPeach,
        width: figmaScreenWidth,
        height: figmaScreenHeight,
      ),
    );
  }
}
