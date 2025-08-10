// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderModel {

@JsonKey(includeFromJson: false, includeToJson: false) DocumentSnapshot? get snapshot;@JsonKey(name: 'id') String? get id;@JsonKey(name: 'customer_name') String? get customerName;@JsonKey(name: 'customer_phone') String? get phoneNumber;@JsonKey(name: 'payment_mode') String? get paymentMode;@JsonKey(name: 'total_amount') String? get totalAmount;@JsonKey(name: 'order_status') String? get orderStatus;@JsonKey(name: 'items', toJson: _itemsToJson, fromJson: _itemsFromJson) List<MenuItemModel>? get items;@JsonKey(name: 'created_at', fromJson: _timestampOrStringToIsoString) String? get createdAt;@JsonKey(name: 'updated_at', fromJson: _timestampOrStringToIsoString) String? get updatedAt;
/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderModelCopyWith<OrderModel> get copyWith => _$OrderModelCopyWithImpl<OrderModel>(this as OrderModel, _$identity);

  /// Serializes this OrderModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderModel&&(identical(other.snapshot, snapshot) || other.snapshot == snapshot)&&(identical(other.id, id) || other.id == id)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.paymentMode, paymentMode) || other.paymentMode == paymentMode)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.orderStatus, orderStatus) || other.orderStatus == orderStatus)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,snapshot,id,customerName,phoneNumber,paymentMode,totalAmount,orderStatus,const DeepCollectionEquality().hash(items),createdAt,updatedAt);

@override
String toString() {
  return 'OrderModel(snapshot: $snapshot, id: $id, customerName: $customerName, phoneNumber: $phoneNumber, paymentMode: $paymentMode, totalAmount: $totalAmount, orderStatus: $orderStatus, items: $items, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $OrderModelCopyWith<$Res>  {
  factory $OrderModelCopyWith(OrderModel value, $Res Function(OrderModel) _then) = _$OrderModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeFromJson: false, includeToJson: false) DocumentSnapshot? snapshot,@JsonKey(name: 'id') String? id,@JsonKey(name: 'customer_name') String? customerName,@JsonKey(name: 'customer_phone') String? phoneNumber,@JsonKey(name: 'payment_mode') String? paymentMode,@JsonKey(name: 'total_amount') String? totalAmount,@JsonKey(name: 'order_status') String? orderStatus,@JsonKey(name: 'items', toJson: _itemsToJson, fromJson: _itemsFromJson) List<MenuItemModel>? items,@JsonKey(name: 'created_at', fromJson: _timestampOrStringToIsoString) String? createdAt,@JsonKey(name: 'updated_at', fromJson: _timestampOrStringToIsoString) String? updatedAt
});




}
/// @nodoc
class _$OrderModelCopyWithImpl<$Res>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._self, this._then);

  final OrderModel _self;
  final $Res Function(OrderModel) _then;

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? snapshot = freezed,Object? id = freezed,Object? customerName = freezed,Object? phoneNumber = freezed,Object? paymentMode = freezed,Object? totalAmount = freezed,Object? orderStatus = freezed,Object? items = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
snapshot: freezed == snapshot ? _self.snapshot : snapshot // ignore: cast_nullable_to_non_nullable
as DocumentSnapshot?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,paymentMode: freezed == paymentMode ? _self.paymentMode : paymentMode // ignore: cast_nullable_to_non_nullable
as String?,totalAmount: freezed == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as String?,orderStatus: freezed == orderStatus ? _self.orderStatus : orderStatus // ignore: cast_nullable_to_non_nullable
as String?,items: freezed == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<MenuItemModel>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderModel].
extension OrderModelPatterns on OrderModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeFromJson: false, includeToJson: false)  DocumentSnapshot? snapshot, @JsonKey(name: 'id')  String? id, @JsonKey(name: 'customer_name')  String? customerName, @JsonKey(name: 'customer_phone')  String? phoneNumber, @JsonKey(name: 'payment_mode')  String? paymentMode, @JsonKey(name: 'total_amount')  String? totalAmount, @JsonKey(name: 'order_status')  String? orderStatus, @JsonKey(name: 'items', toJson: _itemsToJson, fromJson: _itemsFromJson)  List<MenuItemModel>? items, @JsonKey(name: 'created_at', fromJson: _timestampOrStringToIsoString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _timestampOrStringToIsoString)  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
return $default(_that.snapshot,_that.id,_that.customerName,_that.phoneNumber,_that.paymentMode,_that.totalAmount,_that.orderStatus,_that.items,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeFromJson: false, includeToJson: false)  DocumentSnapshot? snapshot, @JsonKey(name: 'id')  String? id, @JsonKey(name: 'customer_name')  String? customerName, @JsonKey(name: 'customer_phone')  String? phoneNumber, @JsonKey(name: 'payment_mode')  String? paymentMode, @JsonKey(name: 'total_amount')  String? totalAmount, @JsonKey(name: 'order_status')  String? orderStatus, @JsonKey(name: 'items', toJson: _itemsToJson, fromJson: _itemsFromJson)  List<MenuItemModel>? items, @JsonKey(name: 'created_at', fromJson: _timestampOrStringToIsoString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _timestampOrStringToIsoString)  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _OrderModel():
return $default(_that.snapshot,_that.id,_that.customerName,_that.phoneNumber,_that.paymentMode,_that.totalAmount,_that.orderStatus,_that.items,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeFromJson: false, includeToJson: false)  DocumentSnapshot? snapshot, @JsonKey(name: 'id')  String? id, @JsonKey(name: 'customer_name')  String? customerName, @JsonKey(name: 'customer_phone')  String? phoneNumber, @JsonKey(name: 'payment_mode')  String? paymentMode, @JsonKey(name: 'total_amount')  String? totalAmount, @JsonKey(name: 'order_status')  String? orderStatus, @JsonKey(name: 'items', toJson: _itemsToJson, fromJson: _itemsFromJson)  List<MenuItemModel>? items, @JsonKey(name: 'created_at', fromJson: _timestampOrStringToIsoString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _timestampOrStringToIsoString)  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
return $default(_that.snapshot,_that.id,_that.customerName,_that.phoneNumber,_that.paymentMode,_that.totalAmount,_that.orderStatus,_that.items,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderModel extends OrderModel {
  const _OrderModel({@JsonKey(includeFromJson: false, includeToJson: false) this.snapshot, @JsonKey(name: 'id') this.id, @JsonKey(name: 'customer_name') this.customerName, @JsonKey(name: 'customer_phone') this.phoneNumber, @JsonKey(name: 'payment_mode') this.paymentMode, @JsonKey(name: 'total_amount') this.totalAmount, @JsonKey(name: 'order_status') this.orderStatus, @JsonKey(name: 'items', toJson: _itemsToJson, fromJson: _itemsFromJson) final  List<MenuItemModel>? items, @JsonKey(name: 'created_at', fromJson: _timestampOrStringToIsoString) this.createdAt, @JsonKey(name: 'updated_at', fromJson: _timestampOrStringToIsoString) this.updatedAt}): _items = items,super._();
  factory _OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);

@override@JsonKey(includeFromJson: false, includeToJson: false) final  DocumentSnapshot? snapshot;
@override@JsonKey(name: 'id') final  String? id;
@override@JsonKey(name: 'customer_name') final  String? customerName;
@override@JsonKey(name: 'customer_phone') final  String? phoneNumber;
@override@JsonKey(name: 'payment_mode') final  String? paymentMode;
@override@JsonKey(name: 'total_amount') final  String? totalAmount;
@override@JsonKey(name: 'order_status') final  String? orderStatus;
 final  List<MenuItemModel>? _items;
@override@JsonKey(name: 'items', toJson: _itemsToJson, fromJson: _itemsFromJson) List<MenuItemModel>? get items {
  final value = _items;
  if (value == null) return null;
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'created_at', fromJson: _timestampOrStringToIsoString) final  String? createdAt;
@override@JsonKey(name: 'updated_at', fromJson: _timestampOrStringToIsoString) final  String? updatedAt;

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderModelCopyWith<_OrderModel> get copyWith => __$OrderModelCopyWithImpl<_OrderModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderModel&&(identical(other.snapshot, snapshot) || other.snapshot == snapshot)&&(identical(other.id, id) || other.id == id)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.paymentMode, paymentMode) || other.paymentMode == paymentMode)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.orderStatus, orderStatus) || other.orderStatus == orderStatus)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,snapshot,id,customerName,phoneNumber,paymentMode,totalAmount,orderStatus,const DeepCollectionEquality().hash(_items),createdAt,updatedAt);

@override
String toString() {
  return 'OrderModel(snapshot: $snapshot, id: $id, customerName: $customerName, phoneNumber: $phoneNumber, paymentMode: $paymentMode, totalAmount: $totalAmount, orderStatus: $orderStatus, items: $items, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$OrderModelCopyWith<$Res> implements $OrderModelCopyWith<$Res> {
  factory _$OrderModelCopyWith(_OrderModel value, $Res Function(_OrderModel) _then) = __$OrderModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeFromJson: false, includeToJson: false) DocumentSnapshot? snapshot,@JsonKey(name: 'id') String? id,@JsonKey(name: 'customer_name') String? customerName,@JsonKey(name: 'customer_phone') String? phoneNumber,@JsonKey(name: 'payment_mode') String? paymentMode,@JsonKey(name: 'total_amount') String? totalAmount,@JsonKey(name: 'order_status') String? orderStatus,@JsonKey(name: 'items', toJson: _itemsToJson, fromJson: _itemsFromJson) List<MenuItemModel>? items,@JsonKey(name: 'created_at', fromJson: _timestampOrStringToIsoString) String? createdAt,@JsonKey(name: 'updated_at', fromJson: _timestampOrStringToIsoString) String? updatedAt
});




}
/// @nodoc
class __$OrderModelCopyWithImpl<$Res>
    implements _$OrderModelCopyWith<$Res> {
  __$OrderModelCopyWithImpl(this._self, this._then);

  final _OrderModel _self;
  final $Res Function(_OrderModel) _then;

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? snapshot = freezed,Object? id = freezed,Object? customerName = freezed,Object? phoneNumber = freezed,Object? paymentMode = freezed,Object? totalAmount = freezed,Object? orderStatus = freezed,Object? items = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_OrderModel(
snapshot: freezed == snapshot ? _self.snapshot : snapshot // ignore: cast_nullable_to_non_nullable
as DocumentSnapshot?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,paymentMode: freezed == paymentMode ? _self.paymentMode : paymentMode // ignore: cast_nullable_to_non_nullable
as String?,totalAmount: freezed == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as String?,orderStatus: freezed == orderStatus ? _self.orderStatus : orderStatus // ignore: cast_nullable_to_non_nullable
as String?,items: freezed == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<MenuItemModel>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
