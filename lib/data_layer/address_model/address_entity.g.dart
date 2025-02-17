// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressEntityImpl _$$AddressEntityImplFromJson(Map<String, dynamic> json) =>
    _$AddressEntityImpl(
      id: (json['id'] as num).toInt(),
      location: json['location'] as String,
      full_address: json['full_address'] as String,
      isPrimary: json['isPrimary'] as bool,
    );

Map<String, dynamic> _$$AddressEntityImplToJson(_$AddressEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'location': instance.location,
      'full_address': instance.full_address,
      'isPrimary': instance.isPrimary,
    };
