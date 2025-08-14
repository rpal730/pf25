// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_section_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrdersSectionState _$OrdersSectionStateFromJson(Map<String, dynamic> json) =>
    _OrdersSectionState(
      orders:
          (json['orders'] as List<dynamic>?)
              ?.map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      fetchingMoreOrders: json['fetchingMoreOrders'] as bool? ?? false,
      hasMoreOrders: json['hasMoreOrders'] as bool? ?? false,
    );

Map<String, dynamic> _$OrdersSectionStateToJson(_OrdersSectionState instance) =>
    <String, dynamic>{
      'orders': instance.orders,
      'fetchingMoreOrders': instance.fetchingMoreOrders,
      'hasMoreOrders': instance.hasMoreOrders,
    };
