// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String?,
  name: json['name'] as String?,
  phoneNumber: json['phone'] as String?,
  username: json['username'] as String?,
  restaurantId: json['restaurant_id'] as String?,
  role: json['role'] as String?,
  createdAt: _timestampOrStringToIsoString(json['created_at']),
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phoneNumber,
      'username': instance.username,
      'restaurant_id': instance.restaurantId,
      'role': instance.role,
      'created_at': instance.createdAt,
    };
