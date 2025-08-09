import 'dart:developer';

import 'package:flutter_web_portfolio_2025/res/base_hydrated_cubit.dart';
import 'package:flutter_web_portfolio_2025/screens/dashboard/cubit/dashboard_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class DashboardCubit extends BaseHydratedCubit<DashboardState> {
  DashboardCubit() : super(const DashboardState());

  selectIndex(int value) {
    emit(state.copyWith(selectedIndex: value));
  }

  @override
  DashboardState? fromJson(Map<String, dynamic> json) {
    try {
      return DashboardState.fromJson(json);
    } catch (e) {
      log("Error deserializing AppState: $e");
      return null; // Return null if deserialization fails
    }
  }

  @override
  Map<String, dynamic>? toJson(DashboardState state) {
    try {
      return state.toJson();
    } catch (e) {
      log("Error serializing AppState: $e");
      return null; // Return null if serialization fails
    }
  }
}
