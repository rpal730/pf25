import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_portfolio_2025/app/cubit/app_cubit.dart';
import 'package:flutter_web_portfolio_2025/config/app_injection.dart';
import 'package:flutter_web_portfolio_2025/screens/splash/cubit/splash_enum.dart';

class SplashCubit extends Cubit<SplashEnum> {
  SplashCubit() : super(SplashEnum.unauthenticated) {
    _navigateToLogin();
  }

  void _navigateToLogin() {
    Future.delayed(const Duration(seconds: 3), () {
      try {
        var token = getIt<AppCubit>().state.token;
        if (token == null) {
          emit(SplashEnum.unauthenticated);
        } else {
          emit(SplashEnum.authenticated);
        }
      } catch (e, stackTrace) {
        onError(e, stackTrace);
      }
    });
  }

  @override
  void onChange(Change<SplashEnum> change) {
    log("State changed from ${change.currentState} to ${change.nextState}");

    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    log("Encountered error: $error");
    super.onError(error, stackTrace);
  }

  @override
  Future<void> close() {
    log("Closing $runtimeType and cleaning up resources.");
    return super.close();
  }
}
