import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SnackbarManager {
  final Map<String, ScaffoldFeatureController<SnackBar, SnackBarClosedReason>>
  _activeSnackbars = {};

  void showSnackbar(
    BuildContext context,
    SnackBar snackBar, {
    required String id,
  }) {
    if (_activeSnackbars.containsKey(id)) {
      return;
    }

    final controller = ScaffoldMessenger.of(context).showSnackBar(snackBar);

    _activeSnackbars[id] = controller;

    controller.closed.then((_) {
      _activeSnackbars.remove(id);
    });
  }

  void dismissSnackbar(String id) {
    if (_activeSnackbars.containsKey(id)) {
      _activeSnackbars[id]?.close();
      _activeSnackbars.remove(id);
    }
  }
}
