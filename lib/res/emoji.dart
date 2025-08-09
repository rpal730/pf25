import 'package:flutter/material.dart';

class Emoji extends StatelessWidget {
  final String value;
  final double size;
  final TextAlign textAlign;

  const Emoji(
    this.value, {
    super.key,
    this.size = 38,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Text(value, style: TextStyle(fontSize: size));
  }
}
