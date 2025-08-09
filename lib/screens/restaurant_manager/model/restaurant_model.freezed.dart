// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RestaurantModel {

@JsonKey(name: 'id') String? get id;@JsonKey(name: 'name') String? get name;@JsonKey(name: 'owned_by') String? get owner;@JsonKey(name: 'gstin') String? get gstin;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'upi_payment_id') List<String>? get upiPaymentId; List<MenuItemModel>? get menuItems; List<UserModel>? get staffMembers; List<OrderModel>? get orders;
/// Create a copy of RestaurantModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RestaurantModelCopyWith<RestaurantModel> get copyWith => _$RestaurantModelCopyWithImpl<RestaurantModel>(this as RestaurantModel, _$identity);

  /// Serializes this RestaurantModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RestaurantModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.gstin, gstin) || other.gstin == gstin)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.upiPaymentId, upiPaymentId)&&const DeepCollectionEquality().equals(other.menuItems, menuItems)&&const DeepCollectionEquality().equals(other.staffMembers, staffMembers)&&const DeepCollectionEquality().equals(other.orders, orders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,owner,gstin,createdAt,const DeepCollectionEquality().hash(upiPaymentId),const DeepCollectionEquality().hash(menuItems),const DeepCollectionEquality().hash(staffMembers),const DeepCollectionEquality().hash(orders));

@override
String toString() {
  return 'RestaurantModel(id: $id, name: $name, owner: $owner, gstin: $gstin, createdAt: $createdAt, upiPaymentId: $upiPaymentId, menuItems: $menuItems, staffMembers: $staffMembers, orders: $orders)';
}


}

/// @nodoc
abstract mixin class $RestaurantModelCopyWith<$Res>  {
  factory $RestaurantModelCopyWith(RestaurantModel value, $Res Function(RestaurantModel) _then) = _$RestaurantModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'name') String? name,@JsonKey(name: 'owned_by') String? owner,@JsonKey(name: 'gstin') String? gstin,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'upi_payment_id') List<String>? upiPaymentId, List<MenuItemModel>? menuItems, List<UserModel>? staffMembers, List<OrderModel>? orders
});




}
/// @nodoc
class _$RestaurantModelCopyWithImpl<$Res>
    implements $RestaurantModelCopyWith<$Res> {
  _$RestaurantModelCopyWithImpl(this._self, this._then);

  final RestaurantModel _self;
  final $Res Function(RestaurantModel) _then;

/// Create a copy of RestaurantModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? owner = freezed,Object? gstin = freezed,Object? createdAt = freezed,Object? upiPaymentId = freezed,Object? menuItems = freezed,Object? staffMembers = freezed,Object? orders = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,owner: freezed == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as String?,gstin: freezed == gstin ? _self.gstin : gstin // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,upiPaymentId: freezed == upiPaymentId ? _self.upiPaymentId : upiPaymentId // ignore: cast_nullable_to_non_nullable
as List<String>?,menuItems: freezed == menuItems ? _self.menuItems : menuItems // ignore: cast_nullable_to_non_nullable
as List<MenuItemModel>?,staffMembers: freezed == staffMembers ? _self.staffMembers : staffMembers // ignore: cast_nullable_to_non_nullable
as List<UserModel>?,orders: freezed == orders ? _self.orders : orders // ignore: cast_nullable_to_non_nullable
as List<OrderModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [RestaurantModel].
extension RestaurantModelPatterns on RestaurantModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RestaurantModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RestaurantModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RestaurantModel value)  $default,){
final _that = this;
switch (_that) {
case _RestaurantModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RestaurantModel value)?  $default,){
final _that = this;
switch (_that) {
case _RestaurantModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String? id, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'owned_by')  String? owner, @JsonKey(name: 'gstin')  String? gstin, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'upi_payment_id')  List<String>? upiPaymentId,  List<MenuItemModel>? menuItems,  List<UserModel>? staffMembers,  List<OrderModel>? orders)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RestaurantModel() when $default != null:
return $default(_that.id,_that.name,_that.owner,_that.gstin,_that.createdAt,_that.upiPaymentId,_that.menuItems,_that.staffMembers,_that.orders);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String? id, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'owned_by')  String? owner, @JsonKey(name: 'gstin')  String? gstin, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'upi_payment_id')  List<String>? upiPaymentId,  List<MenuItemModel>? menuItems,  List<UserModel>? staffMembers,  List<OrderModel>? orders)  $default,) {final _that = this;
switch (_that) {
case _RestaurantModel():
return $default(_that.id,_that.name,_that.owner,_that.gstin,_that.createdAt,_that.upiPaymentId,_that.menuItems,_that.staffMembers,_that.orders);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  String? id, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'owned_by')  String? owner, @JsonKey(name: 'gstin')  String? gstin, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'upi_payment_id')  List<String>? upiPaymentId,  List<MenuItemModel>? menuItems,  List<UserModel>? staffMembers,  List<OrderModel>? orders)?  $default,) {final _that = this;
switch (_that) {
case _RestaurantModel() when $default != null:
return $default(_that.id,_that.name,_that.owner,_that.gstin,_that.createdAt,_that.upiPaymentId,_that.menuItems,_that.staffMembers,_that.orders);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RestaurantModel extends RestaurantModel {
  const _RestaurantModel({@JsonKey(name: 'id') this.id, @JsonKey(name: 'name') this.name, @JsonKey(name: 'owned_by') this.owner, @JsonKey(name: 'gstin') this.gstin, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'upi_payment_id') final  List<String>? upiPaymentId, final  List<MenuItemModel>? menuItems, final  List<UserModel>? staffMembers, final  List<OrderModel>? orders}): _upiPaymentId = upiPaymentId,_menuItems = menuItems,_staffMembers = staffMembers,_orders = orders,super._();
  factory _RestaurantModel.fromJson(Map<String, dynamic> json) => _$RestaurantModelFromJson(json);

@override@JsonKey(name: 'id') final  String? id;
@override@JsonKey(name: 'name') final  String? name;
@override@JsonKey(name: 'owned_by') final  String? owner;
@override@JsonKey(name: 'gstin') final  String? gstin;
@override@JsonKey(name: 'created_at') final  String? createdAt;
 final  List<String>? _upiPaymentId;
@override@JsonKey(name: 'upi_payment_id') List<String>? get upiPaymentId {
  final value = _upiPaymentId;
  if (value == null) return null;
  if (_upiPaymentId is EqualUnmodifiableListView) return _upiPaymentId;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<MenuItemModel>? _menuItems;
@override List<MenuItemModel>? get menuItems {
  final value = _menuItems;
  if (value == null) return null;
  if (_menuItems is EqualUnmodifiableListView) return _menuItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<UserModel>? _staffMembers;
@override List<UserModel>? get staffMembers {
  final value = _staffMembers;
  if (value == null) return null;
  if (_staffMembers is EqualUnmodifiableListView) return _staffMembers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<OrderModel>? _orders;
@override List<OrderModel>? get orders {
  final value = _orders;
  if (value == null) return null;
  if (_orders is EqualUnmodifiableListView) return _orders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of RestaurantModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RestaurantModelCopyWith<_RestaurantModel> get copyWith => __$RestaurantModelCopyWithImpl<_RestaurantModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RestaurantModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RestaurantModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.gstin, gstin) || other.gstin == gstin)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._upiPaymentId, _upiPaymentId)&&const DeepCollectionEquality().equals(other._menuItems, _menuItems)&&const DeepCollectionEquality().equals(other._staffMembers, _staffMembers)&&const DeepCollectionEquality().equals(other._orders, _orders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,owner,gstin,createdAt,const DeepCollectionEquality().hash(_upiPaymentId),const DeepCollectionEquality().hash(_menuItems),const DeepCollectionEquality().hash(_staffMembers),const DeepCollectionEquality().hash(_orders));

@override
String toString() {
  return 'RestaurantModel(id: $id, name: $name, owner: $owner, gstin: $gstin, createdAt: $createdAt, upiPaymentId: $upiPaymentId, menuItems: $menuItems, staffMembers: $staffMembers, orders: $orders)';
}


}

/// @nodoc
abstract mixin class _$RestaurantModelCopyWith<$Res> implements $RestaurantModelCopyWith<$Res> {
  factory _$RestaurantModelCopyWith(_RestaurantModel value, $Res Function(_RestaurantModel) _then) = __$RestaurantModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'name') String? name,@JsonKey(name: 'owned_by') String? owner,@JsonKey(name: 'gstin') String? gstin,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'upi_payment_id') List<String>? upiPaymentId, List<MenuItemModel>? menuItems, List<UserModel>? staffMembers, List<OrderModel>? orders
});




}
/// @nodoc
class __$RestaurantModelCopyWithImpl<$Res>
    implements _$RestaurantModelCopyWith<$Res> {
  __$RestaurantModelCopyWithImpl(this._self, this._then);

  final _RestaurantModel _self;
  final $Res Function(_RestaurantModel) _then;

/// Create a copy of RestaurantModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? owner = freezed,Object? gstin = freezed,Object? createdAt = freezed,Object? upiPaymentId = freezed,Object? menuItems = freezed,Object? staffMembers = freezed,Object? orders = freezed,}) {
  return _then(_RestaurantModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,owner: freezed == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as String?,gstin: freezed == gstin ? _self.gstin : gstin // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,upiPaymentId: freezed == upiPaymentId ? _self._upiPaymentId : upiPaymentId // ignore: cast_nullable_to_non_nullable
as List<String>?,menuItems: freezed == menuItems ? _self._menuItems : menuItems // ignore: cast_nullable_to_non_nullable
as List<MenuItemModel>?,staffMembers: freezed == staffMembers ? _self._staffMembers : staffMembers // ignore: cast_nullable_to_non_nullable
as List<UserModel>?,orders: freezed == orders ? _self._orders : orders // ignore: cast_nullable_to_non_nullable
as List<OrderModel>?,
  ));
}


}

// dart format on
