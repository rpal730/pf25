import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/model/order_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'orders_section_state.freezed.dart';
part 'orders_section_state.g.dart';

@freezed
abstract class OrdersSectionState with _$OrdersSectionState {
  const OrdersSectionState._();

  const factory OrdersSectionState({
    List<OrderModel>? orders,
    @Default(false) bool fetchingMoreOrders,
    @Default(false) bool hasMoreOrders,
  }) = _OrdersSectionState;

  factory OrdersSectionState.fromJson(Map<String, dynamic> json) =>
      _$OrdersSectionStateFromJson(json);
}
