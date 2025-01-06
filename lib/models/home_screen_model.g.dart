// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeScreenModelImpl _$$HomeScreenModelImplFromJson(
        Map<String, dynamic> json) =>
    _$HomeScreenModelImpl(
      rides: (json['rides'] as List<dynamic>?)
              ?.map((e) => Ride.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      clients: (json['clients'] as List<dynamic>?)
              ?.map((e) => Client.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      stuffies: (json['stuffies'] as List<dynamic>?)
              ?.map((e) => Stuffy.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isLoading: json['isLoading'] as bool? ?? false,
    );

Map<String, dynamic> _$$HomeScreenModelImplToJson(
        _$HomeScreenModelImpl instance) =>
    <String, dynamic>{
      'rides': instance.rides,
      'clients': instance.clients,
      'stuffies': instance.stuffies,
      'isLoading': instance.isLoading,
    };
