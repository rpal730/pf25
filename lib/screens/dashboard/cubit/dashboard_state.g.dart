// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DashboardState _$DashboardStateFromJson(Map<String, dynamic> json) =>
    _DashboardState(
      selectedIndex: (json['selectedIndex'] as num?)?.toInt() ?? 0,
      totalLength: (json['totalLength'] as num?)?.toInt() ?? 5,
    );

Map<String, dynamic> _$DashboardStateToJson(_DashboardState instance) =>
    <String, dynamic>{
      'selectedIndex': instance.selectedIndex,
      'totalLength': instance.totalLength,
    };
