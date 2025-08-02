import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final double size;
  final double stroke;
  final Color? color;
  const Loading({super.key, this.size = 32, this.stroke = 4, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          strokeWidth: stroke,
          color:
              color ?? Theme.of(context).colorScheme.primary.withOpacity(0.5),
        ),
      ),
    );
  }
}
