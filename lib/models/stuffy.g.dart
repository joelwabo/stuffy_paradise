// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stuffy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StuffyImpl _$$StuffyImplFromJson(Map<String, dynamic> json) => _$StuffyImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      odometer: (json['odometer'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$StuffyImplToJson(_$StuffyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'odometer': instance.odometer,
    };
