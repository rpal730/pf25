// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RestaurantModel _$RestaurantModelFromJson(Map<String, dynamic> json) =>
    _RestaurantModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      owner: json['owned_by'] as String?,
      gstin: json['gstin'] as String?,
      createdAt: json['created_at'] as String?,
      upiPaymentId:
          (json['upi_payment_id'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      menuItems:
          (json['menuItems'] as List<dynamic>?)
              ?.map((e) => MenuItemModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      staffMembers:
          (json['staffMembers'] as List<dynamic>?)
              ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      orders:
          (json['orders'] as List<dynamic>?)
              ?.map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$RestaurantModelToJson(_RestaurantModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'owned_by': instance.owner,
      'gstin': instance.gstin,
      'created_at': instance.createdAt,
      'upi_payment_id': instance.upiPaymentId,
      'menuItems': instance.menuItems,
      'staffMembers': instance.staffMembers,
      'orders': instance.orders,
    };
