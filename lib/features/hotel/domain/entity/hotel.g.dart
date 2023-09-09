// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hotel _$HotelFromJson(Map<String, dynamic> json) => Hotel(
      id: json['id'] as int,
      name: json['name'] as String,
      adress: json['adress'] as String,
      minimalPrice: json['minimalPrice'] as int,
      priceForIt: json['priceForIt'] as String,
      rating: json['rating'] as int,
      ratingName: json['ratingName'] as String,
      imageUrls:
          (json['imageUrls'] as List<dynamic>).map((e) => e as String).toList(),
      aboutTheHotel: HotelDescription.fromJson(
          json['aboutTheHotel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HotelToJson(Hotel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'adress': instance.adress,
      'minimalPrice': instance.minimalPrice,
      'priceForIt': instance.priceForIt,
      'rating': instance.rating,
      'ratingName': instance.ratingName,
      'imageUrls': instance.imageUrls,
      'aboutTheHotel': instance.aboutTheHotel,
    };
