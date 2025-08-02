// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardStateImpl _$$DashboardStateImplFromJson(Map<String, dynamic> json) =>
    _$DashboardStateImpl(
      selectedIndex: (json['selectedIndex'] as num?)?.toInt() ?? 0,
      totalLength: (json['totalLength'] as num?)?.toInt() ?? 5,
    );

Map<String, dynamic> _$$DashboardStateImplToJson(
        _$DashboardStateImpl instance) =>
    <String, dynamic>{
      'selectedIndex': instance.selectedIndex,
      'totalLength': instance.totalLength,
    };
