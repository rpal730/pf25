import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio_2025/res/theme/app_colors.dart';
import 'package:flutter_web_portfolio_2025/res/ui_helper.dart';
import 'package:flutter_web_portfolio_2025/screens/screen3/tic_tac_toe_game.dart';

@RoutePage()
class Screen3Screen extends StatelessWidget {
  const Screen3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: AppColors.secondary,
        width: figmaScreenWidth,
        height: figmaScreenHeight,
        child: TicTacToeGame(),
      ),
    );
  }
}





