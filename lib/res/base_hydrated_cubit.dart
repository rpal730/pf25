import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

abstract class BaseHydratedCubit<T> extends HydratedCubit<T> {
  BaseHydratedCubit(super.initialState) {
    if (kDebugMode) {
      logStateSize();
    }
  }
  void logStateSize() {
    final stateSize = utf8.encode(jsonEncode(state)).length;
    log("State size: $stateSize bytes");
  }




  @override
  T? fromJson(Map<String, dynamic> json);

  @override
  Map<String, dynamic>? toJson(T state);
}
