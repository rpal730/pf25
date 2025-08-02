import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio_2025/config/routes/app_router.dart';
import 'package:flutter_web_portfolio_2025/res/brutalism_container.dart';
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
        child: Column(
          children: [
            InkWell(onTap: () => context.router.push(TicTacToeGameRoute()), child: BrutalismContainer(child: Text('Tic Tac Toe', style: TextStyle(color: AppColors.text, fontSize: 20)))),
            SizedBox(height: 16),
            InkWell(onTap: () => context.router.push(HangmanGameRoute()), child: BrutalismContainer(child: Text('Hangman', style: TextStyle(color: AppColors.text, fontSize: 20)))),
          ],
        ),
      ),
    );
  }
}
