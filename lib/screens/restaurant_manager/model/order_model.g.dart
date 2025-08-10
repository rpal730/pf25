// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => _OrderModel(
  id: json['id'] as String?,
  customerName: json['customer_name'] as String?,
  phoneNumber: json['customer_phone'] as String?,
  paymentMode: json['payment_mode'] as String?,
  totalAmount: json['total_amount'] as String?,
  orderStatus: json['order_status'] as String?,
  items: _itemsFromJson(json['items'] as List?),
  createdAt: _timestampOrStringToIsoString(json['created_at']),
  updatedAt: _timestampOrStringToIsoString(json['updated_at']),
);

Map<String, dynamic> _$OrderModelToJson(_OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customer_name': instance.customerName,
      'customer_phone': instance.phoneNumber,
      'payment_mode': instance.paymentMode,
      'total_amount': instance.totalAmount,
      'order_status': instance.orderStatus,
      'items': _itemsToJson(instance.items),
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
