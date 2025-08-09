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
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

bool get canAddStaff =>
      role?.toLowerCase() == 'owner' || role?.toLowerCase() == 'manager';

}
