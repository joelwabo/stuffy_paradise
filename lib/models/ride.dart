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
    @Default(0) double cost,
  }) = _Ride;

  const Ride._();

  factory Ride.fromJson(Map<String, dynamic> json) =>
      _$RideFromJson(json);

  String durationToString() {
    final minutes = duration ~/ 60; // Integer division
    final seconds = duration % 60; // Remainder
    return "Ride duration is $minutes minutes and $seconds seconds.";
  }
}