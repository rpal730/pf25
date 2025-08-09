
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/model/menu_item_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';
@freezed
abstract class OrderModel with _$OrderModel {
  const OrderModel._();

  const factory OrderModel({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'customer_name') String? customerName,
    @JsonKey(name: 'customer_phone') String? phoneNumber,
    @JsonKey(name: 'payment_mode') String? paymentMode,
    @JsonKey(name: 'total_amount') String? totalAmount,
    @JsonKey(name: 'order_status') String? orderStatus,
    
    @JsonKey(
      name: 'items',
      toJson: _itemsToJson,
      fromJson: _itemsFromJson,
    )
    List<MenuItemModel>? items,

    @JsonKey(name: 'created_at') String? createdAt,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

}

// Add these functions below the class
List<Map<String, dynamic>>? _itemsToJson(List<MenuItemModel>? items) =>
    items?.map((e) => e.toJson()).toList();

List<MenuItemModel>? _itemsFromJson(List<dynamic>? items) =>
    items?.map((e) => MenuItemModel.fromJson(e as Map<String, dynamic>)).toList();