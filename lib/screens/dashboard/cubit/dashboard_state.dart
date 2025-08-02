

import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_state.freezed.dart';
part 'dashboard_state.g.dart';


@freezed
class DashboardState with _$DashboardState {
  const DashboardState._();

  const factory DashboardState({
    @Default(0) int selectedIndex,
    @Default(5) int totalLength,
    

  }) = _DashboardState;

  factory DashboardState.fromJson(Map<String, dynamic> json) =>
      _$DashboardStateFromJson(json);
}