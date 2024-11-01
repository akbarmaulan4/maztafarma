part of 'm_schedule_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************


MScheduleType _$fromJson(Map<String, dynamic> json) => MScheduleType(
    id: json['id'],
    name: json['name'],
    created_at: json['created_at'],
);

Map<String, dynamic> _$toJson(MScheduleType instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'created_at': instance.created_at,
};
