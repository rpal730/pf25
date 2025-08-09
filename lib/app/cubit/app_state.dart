import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/model/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@freezed
abstract class AppState with _$AppState {
  const AppState._();

  const factory AppState({String? token, UserModel? userData}) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);
}
