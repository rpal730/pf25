// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders_section_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrdersSectionState {

 List<OrderModel>? get orders; bool get fetchingMoreOrders; bool get hasMoreOrders;
/// Create a copy of OrdersSectionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrdersSectionStateCopyWith<OrdersSectionState> get copyWith => _$OrdersSectionStateCopyWithImpl<OrdersSectionState>(this as OrdersSectionState, _$identity);

  /// Serializes this OrdersSectionState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrdersSectionState&&const DeepCollectionEquality().equals(other.orders, orders)&&(identical(other.fetchingMoreOrders, fetchingMoreOrders) || other.fetchingMoreOrders == fetchingMoreOrders)&&(identical(other.hasMoreOrders, hasMoreOrders) || other.hasMoreOrders == hasMoreOrders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(orders),fetchingMoreOrders,hasMoreOrders);

@override
String toString() {
  return 'OrdersSectionState(orders: $orders, fetchingMoreOrders: $fetchingMoreOrders, hasMoreOrders: $hasMoreOrders)';
}


}

/// @nodoc
abstract mixin class $OrdersSectionStateCopyWith<$Res>  {
  factory $OrdersSectionStateCopyWith(OrdersSectionState value, $Res Function(OrdersSectionState) _then) = _$OrdersSectionStateCopyWithImpl;
@useResult
$Res call({
 List<OrderModel>? orders, bool fetchingMoreOrders, bool hasMoreOrders
});




}
/// @nodoc
class _$OrdersSectionStateCopyWithImpl<$Res>
    implements $OrdersSectionStateCopyWith<$Res> {
  _$OrdersSectionStateCopyWithImpl(this._self, this._then);

  final OrdersSectionState _self;
  final $Res Function(OrdersSectionState) _then;

/// Create a copy of OrdersSectionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orders = freezed,Object? fetchingMoreOrders = null,Object? hasMoreOrders = null,}) {
  return _then(_self.copyWith(
orders: freezed == orders ? _self.orders : orders // ignore: cast_nullable_to_non_nullable
as List<OrderModel>?,fetchingMoreOrders: null == fetchingMoreOrders ? _self.fetchingMoreOrders : fetchingMoreOrders // ignore: cast_nullable_to_non_nullable
as bool,hasMoreOrders: null == hasMoreOrders ? _self.hasMoreOrders : hasMoreOrders // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [OrdersSectionState].
extension OrdersSectionStatePatterns on OrdersSectionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrdersSectionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrdersSectionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrdersSectionState value)  $default,){
final _that = this;
switch (_that) {
case _OrdersSectionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrdersSectionState value)?  $default,){
final _that = this;
switch (_that) {
case _OrdersSectionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<OrderModel>? orders,  bool fetchingMoreOrders,  bool hasMoreOrders)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrdersSectionState() when $default != null:
return $default(_that.orders,_that.fetchingMoreOrders,_that.hasMoreOrders);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<OrderModel>? orders,  bool fetchingMoreOrders,  bool hasMoreOrders)  $default,) {final _that = this;
switch (_that) {
case _OrdersSectionState():
return $default(_that.orders,_that.fetchingMoreOrders,_that.hasMoreOrders);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<OrderModel>? orders,  bool fetchingMoreOrders,  bool hasMoreOrders)?  $default,) {final _that = this;
switch (_that) {
case _OrdersSectionState() when $default != null:
return $default(_that.orders,_that.fetchingMoreOrders,_that.hasMoreOrders);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrdersSectionState extends OrdersSectionState {
  const _OrdersSectionState({final  List<OrderModel>? orders, this.fetchingMoreOrders = false, this.hasMoreOrders = false}): _orders = orders,super._();
  factory _OrdersSectionState.fromJson(Map<String, dynamic> json) => _$OrdersSectionStateFromJson(json);

 final  List<OrderModel>? _orders;
@override List<OrderModel>? get orders {
  final value = _orders;
  if (value == null) return null;
  if (_orders is EqualUnmodifiableListView) return _orders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey() final  bool fetchingMoreOrders;
@override@JsonKey() final  bool hasMoreOrders;

/// Create a copy of OrdersSectionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrdersSectionStateCopyWith<_OrdersSectionState> get copyWith => __$OrdersSectionStateCopyWithImpl<_OrdersSectionState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrdersSectionStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrdersSectionState&&const DeepCollectionEquality().equals(other._orders, _orders)&&(identical(other.fetchingMoreOrders, fetchingMoreOrders) || other.fetchingMoreOrders == fetchingMoreOrders)&&(identical(other.hasMoreOrders, hasMoreOrders) || other.hasMoreOrders == hasMoreOrders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_orders),fetchingMoreOrders,hasMoreOrders);

@override
String toString() {
  return 'OrdersSectionState(orders: $orders, fetchingMoreOrders: $fetchingMoreOrders, hasMoreOrders: $hasMoreOrders)';
}


}

/// @nodoc
abstract mixin class _$OrdersSectionStateCopyWith<$Res> implements $OrdersSectionStateCopyWith<$Res> {
  factory _$OrdersSectionStateCopyWith(_OrdersSectionState value, $Res Function(_OrdersSectionState) _then) = __$OrdersSectionStateCopyWithImpl;
@override @useResult
$Res call({
 List<OrderModel>? orders, bool fetchingMoreOrders, bool hasMoreOrders
});




}
/// @nodoc
class __$OrdersSectionStateCopyWithImpl<$Res>
    implements _$OrdersSectionStateCopyWith<$Res> {
  __$OrdersSectionStateCopyWithImpl(this._self, this._then);

  final _OrdersSectionState _self;
  final $Res Function(_OrdersSectionState) _then;

/// Create a copy of OrdersSectionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orders = freezed,Object? fetchingMoreOrders = null,Object? hasMoreOrders = null,}) {
  return _then(_OrdersSectionState(
orders: freezed == orders ? _self._orders : orders // ignore: cast_nullable_to_non_nullable
as List<OrderModel>?,fetchingMoreOrders: null == fetchingMoreOrders ? _self.fetchingMoreOrders : fetchingMoreOrders // ignore: cast_nullable_to_non_nullable
as bool,hasMoreOrders: null == hasMoreOrders ? _self.hasMoreOrders : hasMoreOrders // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
