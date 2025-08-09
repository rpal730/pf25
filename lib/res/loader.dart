import 'dart:async';

import 'package:flutter/material.dart';

class CustomLoaderBar extends StatelessWidget {
  const CustomLoaderBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: ColoredBlockProgressBar());
  }
}

class ColoredBlockProgressBar extends StatefulWidget {
  const ColoredBlockProgressBar({super.key});

  @override
  State<ColoredBlockProgressBar> createState() =>
      _ColoredBlockProgressBarState();
}

class _ColoredBlockProgressBarState extends State<ColoredBlockProgressBar> {
  final List<Color> baseColors = const [
    Color(0xFF3F2AFF),
    Color(0xFF3F2AFF),
    Color(0xFF7A4DFF),
    Color(0xFFC96FFF),
    Color(0xFFFF9BCE),
    Color(0xFFFFB6B6),
    Color(0xFFFFC49B),
    Color(0xFFFFC078),
    Color(0xFFFFB84F),
    Color(0xFFFFAA00),
  ];

  int activeIndex = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 150), (timer) {
      setState(() {
        activeIndex = (activeIndex + 1) % baseColors.length;
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children:
            baseColors.asMap().entries.map((entry) {
              final index = entry.key;
              final color = entry.value;
              final isActive = index == activeIndex;

              return AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 16,
                height: isActive ? 40 : 32,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  color: color,
                  border:
                      isActive
                          ? Border.all(color: Colors.black, width: 1)
                          : null,
                ),
              );
            }).toList(),
      ),
    );
  }
}
