// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_description.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelDescription _$HotelDescriptionFromJson(Map<String, dynamic> json) =>
    HotelDescription(
      description: json['description'] as String,
      peculiarities: (json['peculiarities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$HotelDescriptionToJson(HotelDescription instance) =>
    <String, dynamic>{
      'description': instance.description,
      'peculiarities': instance.peculiarities,
    };
