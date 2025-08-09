// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_manager_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RestaurantManagerState _$RestaurantManagerStateFromJson(
  Map<String, dynamic> json,
) => _RestaurantManagerState(
  token: json['token'] as String?,
  showSignInForm: json['showSignInForm'] as bool?,
  isLoading: json['isLoading'] as bool?,
  restaurantId: json['restaurantId'] as String?,
  restaurantData:
      json['restaurantData'] == null
          ? null
          : RestaurantModel.fromJson(
            json['restaurantData'] as Map<String, dynamic>,
          ),
  loggedInStaffData:
      json['loggedInStaffData'] == null
          ? null
          : UserModel.fromJson(
            json['loggedInStaffData'] as Map<String, dynamic>,
          ),
  fetchingRestaurantDetails:
      json['fetchingRestaurantDetails'] as bool? ?? false,
);

Map<String, dynamic> _$RestaurantManagerStateToJson(
  _RestaurantManagerState instance,
) => <String, dynamic>{
  'token': instance.token,
  'showSignInForm': instance.showSignInForm,
  'isLoading': instance.isLoading,
  'restaurantId': instance.restaurantId,
  'restaurantData': instance.restaurantData,
  'loggedInStaffData': instance.loggedInStaffData,
  'fetchingRestaurantDetails': instance.fetchingRestaurantDetails,
};
