import 'package:hotel_app/features/hotel/domain/entity/hotel_description.dart';
import 'package:json_annotation/json_annotation.dart';
part 'hotel.g.dart';

@JsonSerializable()
class Hotel {
  final int id;
  final String name;
  final String adress;
  final int minimalPrice;
  final String priceForIt;
  final int rating;
  final String ratingName;
  final List<String> imageUrls;
  final HotelDescription aboutTheHotel; 


  Hotel(    {
    required this.id,
    required this.name,
    required this.adress,
    required this.minimalPrice,
    required this.priceForIt,
    required this.rating,
    required this.ratingName,
    required this.imageUrls,
    required this.aboutTheHotel,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(      
      id: json['id'],
      name: json['name'],
      adress: json['adress'],
      minimalPrice: json['minimal_price'],
      priceForIt: json['price_for_it'],
      rating: json['rating'],
      ratingName: json['rating_name'],
      imageUrls: List<String>.from(json['image_urls']),
      aboutTheHotel: HotelDescription.fromJson(json['about_the_hotel']),
    );
  }

  Map<String,dynamic> toJson ()=> _$HotelToJson(this);
}


