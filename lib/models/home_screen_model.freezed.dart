// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_screen_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HomeScreenModel _$HomeScreenModelFromJson(Map<String, dynamic> json) {
  return _HomeScreenModel.fromJson(json);
}

/// @nodoc
mixin _$HomeScreenModel {
  List<Ride> get rides => throw _privateConstructorUsedError;
  List<Client> get clients => throw _privateConstructorUsedError;
  List<Stuffy> get stuffies => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  /// Serializes this HomeScreenModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HomeScreenModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeScreenModelCopyWith<HomeScreenModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeScreenModelCopyWith<$Res> {
  factory $HomeScreenModelCopyWith(
          HomeScreenModel value, $Res Function(HomeScreenModel) then) =
      _$HomeScreenModelCopyWithImpl<$Res, HomeScreenModel>;
  @useResult
  $Res call(
      {List<Ride> rides,
      List<Client> clients,
      List<Stuffy> stuffies,
      bool isLoading});
}

/// @nodoc
class _$HomeScreenModelCopyWithImpl<$Res, $Val extends HomeScreenModel>
    implements $HomeScreenModelCopyWith<$Res> {
  _$HomeScreenModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeScreenModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rides = null,
    Object? clients = null,
    Object? stuffies = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      rides: null == rides
          ? _value.rides
          : rides // ignore: cast_nullable_to_non_nullable
              as List<Ride>,
      clients: null == clients
          ? _value.clients
          : clients // ignore: cast_nullable_to_non_nullable
              as List<Client>,
      stuffies: null == stuffies
          ? _value.stuffies
          : stuffies // ignore: cast_nullable_to_non_nullable
              as List<Stuffy>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeScreenModelImplCopyWith<$Res>
    implements $HomeScreenModelCopyWith<$Res> {
  factory _$$HomeScreenModelImplCopyWith(_$HomeScreenModelImpl value,
          $Res Function(_$HomeScreenModelImpl) then) =
      __$$HomeScreenModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Ride> rides,
      List<Client> clients,
      List<Stuffy> stuffies,
      bool isLoading});
}

/// @nodoc
class __$$HomeScreenModelImplCopyWithImpl<$Res>
    extends _$HomeScreenModelCopyWithImpl<$Res, _$HomeScreenModelImpl>
    implements _$$HomeScreenModelImplCopyWith<$Res> {
  __$$HomeScreenModelImplCopyWithImpl(
      _$HomeScreenModelImpl _value, $Res Function(_$HomeScreenModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeScreenModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rides = null,
    Object? clients = null,
    Object? stuffies = null,
    Object? isLoading = null,
  }) {
    return _then(_$HomeScreenModelImpl(
      rides: null == rides
          ? _value._rides
          : rides // ignore: cast_nullable_to_non_nullable
              as List<Ride>,
      clients: null == clients
          ? _value._clients
          : clients // ignore: cast_nullable_to_non_nullable
              as List<Client>,
      stuffies: null == stuffies
          ? _value._stuffies
          : stuffies // ignore: cast_nullable_to_non_nullable
              as List<Stuffy>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeScreenModelImpl implements _HomeScreenModel {
  const _$HomeScreenModelImpl(
      {final List<Ride> rides = const [],
      final List<Client> clients = const [],
      final List<Stuffy> stuffies = const [],
      this.isLoading = false})
      : _rides = rides,
        _clients = clients,
        _stuffies = stuffies;

  factory _$HomeScreenModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeScreenModelImplFromJson(json);

  final List<Ride> _rides;
  @override
  @JsonKey()
  List<Ride> get rides {
    if (_rides is EqualUnmodifiableListView) return _rides;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rides);
  }

  final List<Client> _clients;
  @override
  @JsonKey()
  List<Client> get clients {
    if (_clients is EqualUnmodifiableListView) return _clients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_clients);
  }

  final List<Stuffy> _stuffies;
  @override
  @JsonKey()
  List<Stuffy> get stuffies {
    if (_stuffies is EqualUnmodifiableListView) return _stuffies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stuffies);
  }

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'HomeScreenModel(rides: $rides, clients: $clients, stuffies: $stuffies, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeScreenModelImpl &&
            const DeepCollectionEquality().equals(other._rides, _rides) &&
            const DeepCollectionEquality().equals(other._clients, _clients) &&
            const DeepCollectionEquality().equals(other._stuffies, _stuffies) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_rides),
      const DeepCollectionEquality().hash(_clients),
      const DeepCollectionEquality().hash(_stuffies),
      isLoading);

  /// Create a copy of HomeScreenModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeScreenModelImplCopyWith<_$HomeScreenModelImpl> get copyWith =>
      __$$HomeScreenModelImplCopyWithImpl<_$HomeScreenModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeScreenModelImplToJson(
      this,
    );
  }
}

abstract class _HomeScreenModel implements HomeScreenModel {
  const factory _HomeScreenModel(
      {final List<Ride> rides,
      final List<Client> clients,
      final List<Stuffy> stuffies,
      final bool isLoading}) = _$HomeScreenModelImpl;

  factory _HomeScreenModel.fromJson(Map<String, dynamic> json) =
      _$HomeScreenModelImpl.fromJson;

  @override
  List<Ride> get rides;
  @override
  List<Client> get clients;
  @override
  List<Stuffy> get stuffies;
  @override
  bool get isLoading;

  /// Create a copy of HomeScreenModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeScreenModelImplCopyWith<_$HomeScreenModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
