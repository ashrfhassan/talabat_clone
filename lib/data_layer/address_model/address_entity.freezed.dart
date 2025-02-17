// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddressEntity _$AddressEntityFromJson(Map<String, dynamic> json) {
  return _AddressEntity.fromJson(json);
}

/// @nodoc
mixin _$AddressEntity {
  int get id => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get full_address => throw _privateConstructorUsedError;
  bool get isPrimary => throw _privateConstructorUsedError;

  /// Serializes this AddressEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddressEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddressEntityCopyWith<AddressEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressEntityCopyWith<$Res> {
  factory $AddressEntityCopyWith(
          AddressEntity value, $Res Function(AddressEntity) then) =
      _$AddressEntityCopyWithImpl<$Res, AddressEntity>;
  @useResult
  $Res call({int id, String location, String full_address, bool isPrimary});
}

/// @nodoc
class _$AddressEntityCopyWithImpl<$Res, $Val extends AddressEntity>
    implements $AddressEntityCopyWith<$Res> {
  _$AddressEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddressEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? location = null,
    Object? full_address = null,
    Object? isPrimary = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      full_address: null == full_address
          ? _value.full_address
          : full_address // ignore: cast_nullable_to_non_nullable
              as String,
      isPrimary: null == isPrimary
          ? _value.isPrimary
          : isPrimary // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressEntityImplCopyWith<$Res>
    implements $AddressEntityCopyWith<$Res> {
  factory _$$AddressEntityImplCopyWith(
          _$AddressEntityImpl value, $Res Function(_$AddressEntityImpl) then) =
      __$$AddressEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String location, String full_address, bool isPrimary});
}

/// @nodoc
class __$$AddressEntityImplCopyWithImpl<$Res>
    extends _$AddressEntityCopyWithImpl<$Res, _$AddressEntityImpl>
    implements _$$AddressEntityImplCopyWith<$Res> {
  __$$AddressEntityImplCopyWithImpl(
      _$AddressEntityImpl _value, $Res Function(_$AddressEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddressEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? location = null,
    Object? full_address = null,
    Object? isPrimary = null,
  }) {
    return _then(_$AddressEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      full_address: null == full_address
          ? _value.full_address
          : full_address // ignore: cast_nullable_to_non_nullable
              as String,
      isPrimary: null == isPrimary
          ? _value.isPrimary
          : isPrimary // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressEntityImpl implements _AddressEntity {
  const _$AddressEntityImpl(
      {required this.id,
      required this.location,
      required this.full_address,
      required this.isPrimary});

  factory _$AddressEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressEntityImplFromJson(json);

  @override
  final int id;
  @override
  final String location;
  @override
  final String full_address;
  @override
  final bool isPrimary;

  @override
  String toString() {
    return 'AddressEntity(id: $id, location: $location, full_address: $full_address, isPrimary: $isPrimary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.full_address, full_address) ||
                other.full_address == full_address) &&
            (identical(other.isPrimary, isPrimary) ||
                other.isPrimary == isPrimary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, location, full_address, isPrimary);

  /// Create a copy of AddressEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressEntityImplCopyWith<_$AddressEntityImpl> get copyWith =>
      __$$AddressEntityImplCopyWithImpl<_$AddressEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressEntityImplToJson(
      this,
    );
  }
}

abstract class _AddressEntity implements AddressEntity {
  const factory _AddressEntity(
      {required final int id,
      required final String location,
      required final String full_address,
      required final bool isPrimary}) = _$AddressEntityImpl;

  factory _AddressEntity.fromJson(Map<String, dynamic> json) =
      _$AddressEntityImpl.fromJson;

  @override
  int get id;
  @override
  String get location;
  @override
  String get full_address;
  @override
  bool get isPrimary;

  /// Create a copy of AddressEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddressEntityImplCopyWith<_$AddressEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
