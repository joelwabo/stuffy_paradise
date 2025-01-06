import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String userName,
    String? password,
    required bool isAdmin,
  }) = _User;

  const User._();

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);
}
