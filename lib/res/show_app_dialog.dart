import 'package:flutter/material.dart';

Future<T?> showAppDialog<T extends Object?>(
  BuildContext context, {
  bool barrierDismissible = true,
  Color barrierColor = Colors.transparent,
  required Widget Function(BuildContext context) builder,
}) {
  return showGeneralDialog<T>(
    
    barrierColor: barrierColor,

    transitionDuration: const Duration(milliseconds: 200),
    context: context,
    transitionBuilder: (_, anim, __, child) {
      return FadeTransition(
        opacity: anim,
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.9, end: 1.0).animate(
            CurvedAnimation(parent: anim, curve: Curves.easeOut),
          ),
          child: child,
        ),
      );
    },
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierDismissible: barrierDismissible,
    // provide app theme as showGeneralDialog builder doesn't share the same context with the place it was called from
    pageBuilder: (_, __, ___) => Dialog(
      insetPadding: const EdgeInsets.all(20.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 360),
        child: builder(context),
      ),
    ),
  );
}
