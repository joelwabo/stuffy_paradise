import 'package:freezed_annotation/freezed_annotation.dart';

part 'ride.freezed.dart';
part 'ride.g.dart';

@freezed
class Ride with _$Ride {
  const factory Ride({
    @Default(-1) int id,
    int? clientId,
    int? stuffyId,

    @Default(false) bool isComplete,
    @Default(false) bool isPay,
    DateTime? startTime,
    DateTime? endTime,
    @Default(0) int duration,
    @Default(0) int cost,
  }) = _Ride;

  factory Ride.fromJson(Map<String, dynamic> json) =>
      _$RideFromJson(json);
}