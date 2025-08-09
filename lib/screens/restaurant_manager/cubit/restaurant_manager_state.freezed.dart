// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant_manager_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RestaurantManagerState {

 String? get token; bool? get showSignInForm; bool? get isLoading; String? get restaurantId; RestaurantModel? get restaurantData; UserModel? get loggedInStaffData; bool? get fetchingRestaurantDetails;
/// Create a copy of RestaurantManagerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RestaurantManagerStateCopyWith<RestaurantManagerState> get copyWith => _$RestaurantManagerStateCopyWithImpl<RestaurantManagerState>(this as RestaurantManagerState, _$identity);

  /// Serializes this RestaurantManagerState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RestaurantManagerState&&(identical(other.token, token) || other.token == token)&&(identical(other.showSignInForm, showSignInForm) || other.showSignInForm == showSignInForm)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&(identical(other.restaurantData, restaurantData) || other.restaurantData == restaurantData)&&(identical(other.loggedInStaffData, loggedInStaffData) || other.loggedInStaffData == loggedInStaffData)&&(identical(other.fetchingRestaurantDetails, fetchingRestaurantDetails) || other.fetchingRestaurantDetails == fetchingRestaurantDetails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,showSignInForm,isLoading,restaurantId,restaurantData,loggedInStaffData,fetchingRestaurantDetails);

@override
String toString() {
  return 'RestaurantManagerState(token: $token, showSignInForm: $showSignInForm, isLoading: $isLoading, restaurantId: $restaurantId, restaurantData: $restaurantData, loggedInStaffData: $loggedInStaffData, fetchingRestaurantDetails: $fetchingRestaurantDetails)';
}


}

/// @nodoc
abstract mixin class $RestaurantManagerStateCopyWith<$Res>  {
  factory $RestaurantManagerStateCopyWith(RestaurantManagerState value, $Res Function(RestaurantManagerState) _then) = _$RestaurantManagerStateCopyWithImpl;
@useResult
$Res call({
 String? token, bool? showSignInForm, bool? isLoading, String? restaurantId, RestaurantModel? restaurantData, UserModel? loggedInStaffData, bool? fetchingRestaurantDetails
});


$RestaurantModelCopyWith<$Res>? get restaurantData;$UserModelCopyWith<$Res>? get loggedInStaffData;

}
/// @nodoc
class _$RestaurantManagerStateCopyWithImpl<$Res>
    implements $RestaurantManagerStateCopyWith<$Res> {
  _$RestaurantManagerStateCopyWithImpl(this._self, this._then);

  final RestaurantManagerState _self;
  final $Res Function(RestaurantManagerState) _then;

/// Create a copy of RestaurantManagerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = freezed,Object? showSignInForm = freezed,Object? isLoading = freezed,Object? restaurantId = freezed,Object? restaurantData = freezed,Object? loggedInStaffData = freezed,Object? fetchingRestaurantDetails = freezed,}) {
  return _then(_self.copyWith(
token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,showSignInForm: freezed == showSignInForm ? _self.showSignInForm : showSignInForm // ignore: cast_nullable_to_non_nullable
as bool?,isLoading: freezed == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool?,restaurantId: freezed == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as String?,restaurantData: freezed == restaurantData ? _self.restaurantData : restaurantData // ignore: cast_nullable_to_non_nullable
as RestaurantModel?,loggedInStaffData: freezed == loggedInStaffData ? _self.loggedInStaffData : loggedInStaffData // ignore: cast_nullable_to_non_nullable
as UserModel?,fetchingRestaurantDetails: freezed == fetchingRestaurantDetails ? _self.fetchingRestaurantDetails : fetchingRestaurantDetails // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of RestaurantManagerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RestaurantModelCopyWith<$Res>? get restaurantData {
    if (_self.restaurantData == null) {
    return null;
  }

  return $RestaurantModelCopyWith<$Res>(_self.restaurantData!, (value) {
    return _then(_self.copyWith(restaurantData: value));
  });
}/// Create a copy of RestaurantManagerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get loggedInStaffData {
    if (_self.loggedInStaffData == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.loggedInStaffData!, (value) {
    return _then(_self.copyWith(loggedInStaffData: value));
  });
}
}


/// Adds pattern-matching-related methods to [RestaurantManagerState].
extension RestaurantManagerStatePatterns on RestaurantManagerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RestaurantManagerState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RestaurantManagerState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RestaurantManagerState value)  $default,){
final _that = this;
switch (_that) {
case _RestaurantManagerState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RestaurantManagerState value)?  $default,){
final _that = this;
switch (_that) {
case _RestaurantManagerState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? token,  bool? showSignInForm,  bool? isLoading,  String? restaurantId,  RestaurantModel? restaurantData,  UserModel? loggedInStaffData,  bool? fetchingRestaurantDetails)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RestaurantManagerState() when $default != null:
return $default(_that.token,_that.showSignInForm,_that.isLoading,_that.restaurantId,_that.restaurantData,_that.loggedInStaffData,_that.fetchingRestaurantDetails);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? token,  bool? showSignInForm,  bool? isLoading,  String? restaurantId,  RestaurantModel? restaurantData,  UserModel? loggedInStaffData,  bool? fetchingRestaurantDetails)  $default,) {final _that = this;
switch (_that) {
case _RestaurantManagerState():
return $default(_that.token,_that.showSignInForm,_that.isLoading,_that.restaurantId,_that.restaurantData,_that.loggedInStaffData,_that.fetchingRestaurantDetails);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? token,  bool? showSignInForm,  bool? isLoading,  String? restaurantId,  RestaurantModel? restaurantData,  UserModel? loggedInStaffData,  bool? fetchingRestaurantDetails)?  $default,) {final _that = this;
switch (_that) {
case _RestaurantManagerState() when $default != null:
return $default(_that.token,_that.showSignInForm,_that.isLoading,_that.restaurantId,_that.restaurantData,_that.loggedInStaffData,_that.fetchingRestaurantDetails);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RestaurantManagerState extends RestaurantManagerState {
  const _RestaurantManagerState({this.token, this.showSignInForm, this.isLoading, this.restaurantId, this.restaurantData, this.loggedInStaffData, this.fetchingRestaurantDetails = false}): super._();
  factory _RestaurantManagerState.fromJson(Map<String, dynamic> json) => _$RestaurantManagerStateFromJson(json);

@override final  String? token;
@override final  bool? showSignInForm;
@override final  bool? isLoading;
@override final  String? restaurantId;
@override final  RestaurantModel? restaurantData;
@override final  UserModel? loggedInStaffData;
@override@JsonKey() final  bool? fetchingRestaurantDetails;

/// Create a copy of RestaurantManagerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RestaurantManagerStateCopyWith<_RestaurantManagerState> get copyWith => __$RestaurantManagerStateCopyWithImpl<_RestaurantManagerState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RestaurantManagerStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RestaurantManagerState&&(identical(other.token, token) || other.token == token)&&(identical(other.showSignInForm, showSignInForm) || other.showSignInForm == showSignInForm)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&(identical(other.restaurantData, restaurantData) || other.restaurantData == restaurantData)&&(identical(other.loggedInStaffData, loggedInStaffData) || other.loggedInStaffData == loggedInStaffData)&&(identical(other.fetchingRestaurantDetails, fetchingRestaurantDetails) || other.fetchingRestaurantDetails == fetchingRestaurantDetails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,showSignInForm,isLoading,restaurantId,restaurantData,loggedInStaffData,fetchingRestaurantDetails);

@override
String toString() {
  return 'RestaurantManagerState(token: $token, showSignInForm: $showSignInForm, isLoading: $isLoading, restaurantId: $restaurantId, restaurantData: $restaurantData, loggedInStaffData: $loggedInStaffData, fetchingRestaurantDetails: $fetchingRestaurantDetails)';
}


}

/// @nodoc
abstract mixin class _$RestaurantManagerStateCopyWith<$Res> implements $RestaurantManagerStateCopyWith<$Res> {
  factory _$RestaurantManagerStateCopyWith(_RestaurantManagerState value, $Res Function(_RestaurantManagerState) _then) = __$RestaurantManagerStateCopyWithImpl;
@override @useResult
$Res call({
 String? token, bool? showSignInForm, bool? isLoading, String? restaurantId, RestaurantModel? restaurantData, UserModel? loggedInStaffData, bool? fetchingRestaurantDetails
});


@override $RestaurantModelCopyWith<$Res>? get restaurantData;@override $UserModelCopyWith<$Res>? get loggedInStaffData;

}
/// @nodoc
class __$RestaurantManagerStateCopyWithImpl<$Res>
    implements _$RestaurantManagerStateCopyWith<$Res> {
  __$RestaurantManagerStateCopyWithImpl(this._self, this._then);

  final _RestaurantManagerState _self;
  final $Res Function(_RestaurantManagerState) _then;

/// Create a copy of RestaurantManagerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = freezed,Object? showSignInForm = freezed,Object? isLoading = freezed,Object? restaurantId = freezed,Object? restaurantData = freezed,Object? loggedInStaffData = freezed,Object? fetchingRestaurantDetails = freezed,}) {
  return _then(_RestaurantManagerState(
token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,showSignInForm: freezed == showSignInForm ? _self.showSignInForm : showSignInForm // ignore: cast_nullable_to_non_nullable
as bool?,isLoading: freezed == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool?,restaurantId: freezed == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as String?,restaurantData: freezed == restaurantData ? _self.restaurantData : restaurantData // ignore: cast_nullable_to_non_nullable
as RestaurantModel?,loggedInStaffData: freezed == loggedInStaffData ? _self.loggedInStaffData : loggedInStaffData // ignore: cast_nullable_to_non_nullable
as UserModel?,fetchingRestaurantDetails: freezed == fetchingRestaurantDetails ? _self.fetchingRestaurantDetails : fetchingRestaurantDetails // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of RestaurantManagerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RestaurantModelCopyWith<$Res>? get restaurantData {
    if (_self.restaurantData == null) {
    return null;
  }

  return $RestaurantModelCopyWith<$Res>(_self.restaurantData!, (value) {
    return _then(_self.copyWith(restaurantData: value));
  });
}/// Create a copy of RestaurantManagerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get loggedInStaffData {
    if (_self.loggedInStaffData == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.loggedInStaffData!, (value) {
    return _then(_self.copyWith(loggedInStaffData: value));
  });
}
}

// dart format on
