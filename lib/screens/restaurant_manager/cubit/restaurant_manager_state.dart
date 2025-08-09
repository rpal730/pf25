import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/model/restaurant_model.dart';
import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/model/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant_manager_state.freezed.dart';
part 'restaurant_manager_state.g.dart';

@freezed
abstract class RestaurantManagerState with _$RestaurantManagerState {
  const RestaurantManagerState._();

  const factory RestaurantManagerState({
    String? token,
    bool? showSignInForm,
    bool? isLoading,
    String? restaurantId,
    RestaurantModel? restaurantData,
    UserModel? loggedInStaffData,
    @Default(false) bool? fetchingRestaurantDetails,
  }) = _RestaurantManagerState;

  factory RestaurantManagerState.fromJson(Map<String, dynamic> json) =>
      _$RestaurantManagerStateFromJson(json);
}
