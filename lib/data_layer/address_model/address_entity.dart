import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_entity.freezed.dart';
part 'address_entity.g.dart';

@freezed
class AddressEntity with _$AddressEntity {
  const factory AddressEntity({
    required int id,
    required String location,
    required String full_address,
    required bool isPrimary,
  }) = _AddressEntity;

  factory AddressEntity.fromJson(Map<String, Object?> json) => _$AddressEntityFromJson(json);
}
