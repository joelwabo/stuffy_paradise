import 'package:freezed_annotation/freezed_annotation.dart';

part 'stuffy.freezed.dart';
part 'stuffy.g.dart';

@freezed
class Stuffy with _$Stuffy {
  const factory Stuffy({
    required int id,
    required String name,
    @Default(0.0) double odometer,
  }) = _Stuffy;

  const Stuffy._();

  factory Stuffy.fromJson(Map<String, dynamic> json) =>
      _$StuffyFromJson(json);

  @override
  String toString() {
    return name;
  }

  bool filter(String query) {
    return name.toLowerCase().contains(query.toLowerCase());
  }
}
