import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio_2025/res/app_dimensions.dart';
import 'package:flutter_web_portfolio_2025/res/tappable_effect.dart';
import 'package:flutter_web_portfolio_2025/res/theme/app_colors.dart';
import 'package:flutter_web_portfolio_2025/res/ui_helper.dart';

class CustomNavbarWidget extends StatelessWidget {
  final bool isSelected;
  final IconData selectedIcon;
  final IconData unSelectedIcon;
  final String label;
  final VoidCallback onTap;

  const CustomNavbarWidget({
    super.key,
    required this.isSelected,
    required this.selectedIcon,
    required this.unSelectedIcon,
    required this.onTap,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TappableEffect(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary
              : Colors.transparent,
          borderRadius: isSelected
              ? BorderRadius.circular(AppDimentions.px26)
              : null,
        ),
        child: Row(
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: Icon(
                isSelected ? selectedIcon : unSelectedIcon,
                key: ValueKey(isSelected),
                color: isSelected
                    ? AppColors.text
                    : AppColors.text,
              ),
            ),
            if (isSelected) ...[
              horizontalSpaceSmall,
              AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: isSelected ? 1.0 : 0.0,
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.text,
                        fontSize: 16,
                      ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
