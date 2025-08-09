import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_portfolio_2025/config/app_injection.dart';
import 'package:flutter_web_portfolio_2025/internet_checker/cubit/network_checker.dart';
import 'package:flutter_web_portfolio_2025/res/base_snackbar_manager.dart';

class NoInternetConnectionDisclaimer extends StatelessWidget {
  const NoInternetConnectionDisclaimer({super.key});

  // Utility method to create SnackBars
  SnackBar _buildSnackBar({
    required String content,
    required Color backgroundColor,
    IconData? icon,
    bool showProgress = false,
    Duration duration = const Duration(seconds: 2),
  }) {
    return SnackBar(
      content: Row(
        children: [
          if (icon != null) Icon(icon),
          if (showProgress) const CircularProgressIndicator.adaptive(),
          const SizedBox(width: 10),
          Text(content),
        ],
      ),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      duration: duration,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NetworkCheckerCubit>(),
      child: BlocListener<NetworkCheckerCubit, bool>(
        listenWhen: (previous, current) {
          log("listenWhen: $previous != $current");
          return previous != current;
        },
        listener: (context, state) {
          final snackbarManager = getIt<SnackbarManager>();

          snackbarManager.dismissSnackbar('no_internet_connection');
          snackbarManager.dismissSnackbar('internet_connection_online');

          if (state) {
            WidgetsBinding.instance.addPostFrameCallback(
              (_) => snackbarManager.showSnackbar(
                context,
                _buildSnackBar(
                  content: 'You are back online!',
                  backgroundColor: Colors.green,
                ),
                id: 'internet_connection_online',
              ),
            );
            return;
          } else {
            // If there's no internet connection
            WidgetsBinding.instance.addPostFrameCallback(
              (_) => snackbarManager.showSnackbar(
                context,
                _buildSnackBar(
                  content: 'We are looking for active internet connection.',
                  backgroundColor: Colors.deepOrangeAccent,
                  showProgress: true,
                  duration: const Duration(seconds: 9999),
                ),
                id: 'no_internet_connection',
              ),
            );
          }
        },
        child: const SizedBox(),
      ),
    );
  }
}
