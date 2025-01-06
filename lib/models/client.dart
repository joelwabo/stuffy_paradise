import 'package:freezed_annotation/freezed_annotation.dart';

part 'client.freezed.dart';
part 'client.g.dart';

@freezed
class Client with _$Client {
  const factory Client({
    required int id,
    required String firstName,
    required String lastName,
    String? email,
    String? phone,
  }) = _Client;

  const Client._();

  factory Client.fromJson(Map<String, dynamic> json) =>
      _$ClientFromJson(json);

  @override
  String toString() {
    return '$firstName $lastName';
  }

  bool filter(String query) {
    return '$firstName $lastName'.toLowerCase().contains(query.toLowerCase());
  }
}
