// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stuffy.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Stuffy _$StuffyFromJson(Map<String, dynamic> json) {
  return _Stuffy.fromJson(json);
}

/// @nodoc
mixin _$Stuffy {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get odometer => throw _privateConstructorUsedError;

  /// Serializes this Stuffy to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Stuffy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StuffyCopyWith<Stuffy> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StuffyCopyWith<$Res> {
  factory $StuffyCopyWith(Stuffy value, $Res Function(Stuffy) then) =
      _$StuffyCopyWithImpl<$Res, Stuffy>;
  @useResult
  $Res call({int id, String name, double odometer});
}

/// @nodoc
class _$StuffyCopyWithImpl<$Res, $Val extends Stuffy>
    implements $StuffyCopyWith<$Res> {
  _$StuffyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Stuffy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? odometer = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      odometer: null == odometer
          ? _value.odometer
          : odometer // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StuffyImplCopyWith<$Res> implements $StuffyCopyWith<$Res> {
  factory _$$StuffyImplCopyWith(
          _$StuffyImpl value, $Res Function(_$StuffyImpl) then) =
      __$$StuffyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, double odometer});
}

/// @nodoc
class __$$StuffyImplCopyWithImpl<$Res>
    extends _$StuffyCopyWithImpl<$Res, _$StuffyImpl>
    implements _$$StuffyImplCopyWith<$Res> {
  __$$StuffyImplCopyWithImpl(
      _$StuffyImpl _value, $Res Function(_$StuffyImpl) _then)
      : super(_value, _then);

  /// Create a copy of Stuffy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? odometer = null,
  }) {
    return _then(_$StuffyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      odometer: null == odometer
          ? _value.odometer
          : odometer // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StuffyImpl extends _Stuffy {
  const _$StuffyImpl(
      {required this.id, required this.name, this.odometer = 0.0})
      : super._();

  factory _$StuffyImpl.fromJson(Map<String, dynamic> json) =>
      _$$StuffyImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey()
  final double odometer;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StuffyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.odometer, odometer) ||
                other.odometer == odometer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, odometer);

  /// Create a copy of Stuffy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StuffyImplCopyWith<_$StuffyImpl> get copyWith =>
      __$$StuffyImplCopyWithImpl<_$StuffyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StuffyImplToJson(
      this,
    );
  }
}

abstract class _Stuffy extends Stuffy {
  const factory _Stuffy(
      {required final int id,
      required final String name,
      final double odometer}) = _$StuffyImpl;
  const _Stuffy._() : super._();

  factory _Stuffy.fromJson(Map<String, dynamic> json) = _$StuffyImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  double get odometer;

  /// Create a copy of Stuffy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StuffyImplCopyWith<_$StuffyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
