import 'package:flutter/material.dart';

class TappableEffect extends StatefulWidget {
  const TappableEffect({
    super.key,
    this.onTap,
    required this.child,
    this.borderRadius = 10,
  });

  final VoidCallback? onTap;
  final Widget child;
  final double borderRadius;

  @override
  TappableEffectState createState() => TappableEffectState();
}

class TappableEffectState extends State<TappableEffect>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  static final scaleTween = Tween<double>(begin: 1.0, end: 0.97);

  final Color _backgroundColor = Colors.transparent;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.onTap == null) return widget.child;

    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      child: GestureDetector(
        onTapDown: (details) => _animationController.forward(),
        onTapCancel: () => _animationController.reverse(),
        onTapUp: (details) => _animationController.reverse(),
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          color: _backgroundColor,
          child: ScaleTransition(
            scale: scaleTween.animate(_animationController),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
