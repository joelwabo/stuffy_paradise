// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ride.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Ride _$RideFromJson(Map<String, dynamic> json) {
  return _Ride.fromJson(json);
}

/// @nodoc
mixin _$Ride {
  int get id => throw _privateConstructorUsedError;
  int? get clientId => throw _privateConstructorUsedError;
  int? get stuffyId => throw _privateConstructorUsedError;
  bool get isComplete => throw _privateConstructorUsedError;
  bool get isPay => throw _privateConstructorUsedError;
  DateTime? get startTime => throw _privateConstructorUsedError;
  DateTime? get endTime => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  int get cost => throw _privateConstructorUsedError;

  /// Serializes this Ride to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Ride
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RideCopyWith<Ride> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RideCopyWith<$Res> {
  factory $RideCopyWith(Ride value, $Res Function(Ride) then) =
      _$RideCopyWithImpl<$Res, Ride>;
  @useResult
  $Res call(
      {int id,
      int? clientId,
      int? stuffyId,
      bool isComplete,
      bool isPay,
      DateTime? startTime,
      DateTime? endTime,
      int duration,
      int cost});
}

/// @nodoc
class _$RideCopyWithImpl<$Res, $Val extends Ride>
    implements $RideCopyWith<$Res> {
  _$RideCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Ride
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? clientId = freezed,
    Object? stuffyId = freezed,
    Object? isComplete = null,
    Object? isPay = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? duration = null,
    Object? cost = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      clientId: freezed == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as int?,
      stuffyId: freezed == stuffyId
          ? _value.stuffyId
          : stuffyId // ignore: cast_nullable_to_non_nullable
              as int?,
      isComplete: null == isComplete
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      isPay: null == isPay
          ? _value.isPay
          : isPay // ignore: cast_nullable_to_non_nullable
              as bool,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RideImplCopyWith<$Res> implements $RideCopyWith<$Res> {
  factory _$$RideImplCopyWith(
          _$RideImpl value, $Res Function(_$RideImpl) then) =
      __$$RideImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int? clientId,
      int? stuffyId,
      bool isComplete,
      bool isPay,
      DateTime? startTime,
      DateTime? endTime,
      int duration,
      int cost});
}

/// @nodoc
class __$$RideImplCopyWithImpl<$Res>
    extends _$RideCopyWithImpl<$Res, _$RideImpl>
    implements _$$RideImplCopyWith<$Res> {
  __$$RideImplCopyWithImpl(_$RideImpl _value, $Res Function(_$RideImpl) _then)
      : super(_value, _then);

  /// Create a copy of Ride
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? clientId = freezed,
    Object? stuffyId = freezed,
    Object? isComplete = null,
    Object? isPay = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? duration = null,
    Object? cost = null,
  }) {
    return _then(_$RideImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      clientId: freezed == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as int?,
      stuffyId: freezed == stuffyId
          ? _value.stuffyId
          : stuffyId // ignore: cast_nullable_to_non_nullable
              as int?,
      isComplete: null == isComplete
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      isPay: null == isPay
          ? _value.isPay
          : isPay // ignore: cast_nullable_to_non_nullable
              as bool,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RideImpl implements _Ride {
  const _$RideImpl(
      {this.id = -1,
      this.clientId,
      this.stuffyId,
      this.isComplete = false,
      this.isPay = false,
      this.startTime,
      this.endTime,
      this.duration = 0,
      this.cost = 0});

  factory _$RideImpl.fromJson(Map<String, dynamic> json) =>
      _$$RideImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  final int? clientId;
  @override
  final int? stuffyId;
  @override
  @JsonKey()
  final bool isComplete;
  @override
  @JsonKey()
  final bool isPay;
  @override
  final DateTime? startTime;
  @override
  final DateTime? endTime;
  @override
  @JsonKey()
  final int duration;
  @override
  @JsonKey()
  final int cost;

  @override
  String toString() {
    return 'Ride(id: $id, clientId: $clientId, stuffyId: $stuffyId, isComplete: $isComplete, isPay: $isPay, startTime: $startTime, endTime: $endTime, duration: $duration, cost: $cost)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RideImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.stuffyId, stuffyId) ||
                other.stuffyId == stuffyId) &&
            (identical(other.isComplete, isComplete) ||
                other.isComplete == isComplete) &&
            (identical(other.isPay, isPay) || other.isPay == isPay) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.cost, cost) || other.cost == cost));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, clientId, stuffyId,
      isComplete, isPay, startTime, endTime, duration, cost);

  /// Create a copy of Ride
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RideImplCopyWith<_$RideImpl> get copyWith =>
      __$$RideImplCopyWithImpl<_$RideImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RideImplToJson(
      this,
    );
  }
}

abstract class _Ride implements Ride {
  const factory _Ride(
      {final int id,
      final int? clientId,
      final int? stuffyId,
      final bool isComplete,
      final bool isPay,
      final DateTime? startTime,
      final DateTime? endTime,
      final int duration,
      final int cost}) = _$RideImpl;

  factory _Ride.fromJson(Map<String, dynamic> json) = _$RideImpl.fromJson;

  @override
  int get id;
  @override
  int? get clientId;
  @override
  int? get stuffyId;
  @override
  bool get isComplete;
  @override
  bool get isPay;
  @override
  DateTime? get startTime;
  @override
  DateTime? get endTime;
  @override
  int get duration;
  @override
  int get cost;

  /// Create a copy of Ride
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RideImplCopyWith<_$RideImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
