
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_item_model.freezed.dart';
part 'menu_item_model.g.dart';

@freezed
abstract class MenuItemModel with _$MenuItemModel {
  const MenuItemModel._();

  const factory MenuItemModel({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'price') double? price,
    @JsonKey(name: 'quantity') int? quantity,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'available_units') int? availableUnits,
  }) = _MenuItemModel;

  factory MenuItemModel.fromJson(Map<String, dynamic> json) =>
      _$MenuItemModelFromJson(json);
}
