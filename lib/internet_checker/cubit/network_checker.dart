import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class NetworkCheckerCubit extends Cubit<bool> {
  NetworkCheckerCubit() : super(true);

  // Timer for periodically checking internet connectivity
  Timer? _timer;
  final Duration _interval = const Duration(seconds: 10);

  // Start checking the internet connectivity at a specified interval
  void startInternetCheck() async {
    bool isConnected = await hasInternetAccess();
    log("Internet Initial check: $isConnected");
    emit(( isConnected));
    if (isConnected) return;

    _timer = Timer.periodic(_interval, (timer) async {
      bool isConnected = await hasInternetAccess();
      log("Internet check: $isConnected");

      // Emit new state with updated isInternetAvailable value
      emit(isConnected);
      if (isConnected) stopInternetCheck();
    });
  }

  // Stop the periodic internet check
  void stopInternetCheck() {
    _timer?.cancel();
  }

  Future<bool> hasInternetAccess() async {
    try {
      log("Checking internet access...");
      final response = await Dio().get('https://www.google.com');
      return response.statusCode == 200; // If response is OK
    } catch (e) {
      log("Error checking internet access: $e");
      return false;
    }
  }




  
}
