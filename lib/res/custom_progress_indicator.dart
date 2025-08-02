import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio_2025/res/theme/app_colors.dart';
import 'package:flutter_web_portfolio_2025/res/ui_helper.dart';

class CustomProgressIndicator extends StatelessWidget {
  final int totalPages;
  final int currentPage;

  const CustomProgressIndicator({super.key, 
     this.totalPages=-1,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    double progress = currentPage / totalPages;
    if(totalPages<0){
      return const SizedBox();
    }

    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: SizedBox(
            height: 10,
            width: screenWidthFraction(context, dividedBy: 7),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 10,
              backgroundColor: AppColors.white,
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
            ),
          ),
        ),
        horizontalSpaceSmall,
        Text('$currentPage/$totalPages'.toString()),
      ],
    );
    // return Container(height: 100,
    //   child: Column(
    //     children: [
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Text('Page $currentPage of $totalPages'),
    //           Text('${(progress * 100).toStringAsFixed(0)}%'),
    //         ],
    //       ),
    //       SizedBox(height: 8),
    //       LinearProgressIndicator(
    //         value: progress,
    //         minHeight: 10,
    //         backgroundColor: Colors.grey[300],
    //         valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
    //       ),
    //     ],
    //   ),
    // );
  }
}
