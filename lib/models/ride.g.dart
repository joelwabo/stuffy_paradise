// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ride.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RideImpl _$$RideImplFromJson(Map<String, dynamic> json) => _$RideImpl(
      id: (json['id'] as num?)?.toInt() ?? -1,
      clientId: (json['clientId'] as num?)?.toInt(),
      stuffyId: (json['stuffyId'] as num?)?.toInt(),
      isComplete: json['isComplete'] as bool? ?? false,
      isPay: json['isPay'] as bool? ?? false,
      startTime: json['startTime'] == null
          ? null
          : DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
      duration: (json['duration'] as num?)?.toInt() ?? 0,
      cost: (json['cost'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$RideImplToJson(_$RideImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clientId': instance.clientId,
      'stuffyId': instance.stuffyId,
      'isComplete': instance.isComplete,
      'isPay': instance.isPay,
      'startTime': instance.startTime?.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
      'duration': instance.duration,
      'cost': instance.cost,
    };
