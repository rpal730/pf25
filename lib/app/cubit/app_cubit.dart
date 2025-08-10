import 'dart:developer';
import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/model/user_model.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_web_portfolio_2025/app/cubit/app_state.dart';
import 'package:flutter_web_portfolio_2025/res/base_hydrated_cubit.dart';

@lazySingleton
class AppCubit extends BaseHydratedCubit<AppState> {
  AppCubit() : super(const AppState());

  // Method to update the token
  void setToken(String value) {
    emit(state.copyWith(token: value));
  }

  void setUserData(UserModel data) {
    emit(state.copyWith(userData: data!.copyWith(createdAt: null)));
  }

  // Handle serialization and deserialization
  @override
  AppState? fromJson(Map<String, dynamic> json) {
    try {
      return AppState.fromJson(json);
    } catch (e) {
      log("Error deserializing AppState: $e");
      return null; // Return null if deserialization fails
    }
  }

  @override
  Map<String, dynamic>? toJson(AppState state) {
    try {
      return state.toJson();
    } catch (e) {
      log("Error serializing AppState: $e");
      return null; // Return null if serialization fails
    }
  }
}
