import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'phone') String? phoneNumber,
    @JsonKey(name: 'username') String? username,
    @JsonKey(name: 'restaurant_id') String? restaurantId,
    @JsonKey(name: 'role') String? role,

    @JsonKey(
      name: 'created_at',
      fromJson: _timestampOrStringToIsoString,
    )
    String? createdAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  bool get canAddStaff =>
      role?.toLowerCase() == 'owner' || role?.toLowerCase() == 'manager';
}

// Converts Firestore Timestamp or String → String
String? _timestampOrStringToIsoString(dynamic value) {
  if (value == null) return null;
  if (value is Timestamp) {
    return value.toDate().toIso8601String();
  }
  if (value is String) {
    return value;
  }
  return null;
}

// Always send server timestamp when saving
dynamic _stringToServerTimestamp(String? value) {
  return FieldValue.serverTimestamp();
}