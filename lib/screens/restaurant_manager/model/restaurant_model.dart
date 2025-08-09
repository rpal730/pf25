import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/model/menu_item_model.dart';
import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/model/order_model.dart';
import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/model/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant_model.freezed.dart';
part 'restaurant_model.g.dart';

@freezed
abstract class RestaurantModel with _$RestaurantModel {
  const RestaurantModel._();

  const factory RestaurantModel({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'owned_by') String? owner,
    @JsonKey(name: 'gstin') String? gstin,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'upi_payment_id') List<String>? upiPaymentId,
    List<MenuItemModel>? menuItems,
    List<UserModel>? staffMembers,
    List<OrderModel>? orders,
  }) = _RestaurantModel;

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantModelFromJson(json);
}
