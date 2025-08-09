import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio_2025/res/theme/app_colors.dart';

class BrutalismContainer extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final bool topBorderBold;
  final bool bottomBorderBold;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final bool showShadow;
  final VoidCallback? onTap;

  const BrutalismContainer({
    super.key,
    this.child,
    this.color,
    this.topBorderBold = false,
    this.bottomBorderBold = false,
    this.borderRadius = 12.0,
    this.padding = const EdgeInsets.all(16),
    this.margin = const EdgeInsets.all(0),
    this.showShadow = true, this.onTap,
  });

  Border _buildBorder() {
    // base thin border for all sides
    const baseSide = BorderSide(width: 2, color: Colors.black);
    // bold edges
    final top =
        topBorderBold
            ? const BorderSide(width: 6, color: Colors.black)
            : baseSide;
    final bottom =
        bottomBorderBold
            ? const BorderSide(width: 6, color: Colors.black)
            : baseSide;

    return Border(top: top, bottom: bottom, left: baseSide, right: baseSide);
  }

  @override
  Widget build(BuildContext context) {
    final Color bg =
        color ??
        AppColors.primary; // MaterialColor will downgrade to default shade
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          color: bg,
          border: _buildBorder(),
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow:
              showShadow
                  ? [
                    // offset “blocky” shadow for brutalism
                    const BoxShadow(
                      color: Colors.black87,
                      offset: Offset(6, 6),
                      blurRadius: 0,
                      spreadRadius: 0,
                    ),
                    // slight highlight to look layered
                    const BoxShadow(
                      color: Colors.white24,
                      offset: Offset(-2, -2),
                      blurRadius: 0,
                      spreadRadius: 0,
                      // note: Flutter doesn't support inset natively; use package if needed
                    ),
                  ]
                  : null,
        ),
        child: child,
      ),
    );
  }
}
