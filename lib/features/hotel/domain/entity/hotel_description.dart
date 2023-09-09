import 'package:json_annotation/json_annotation.dart';
part 'hotel_description.g.dart';

@JsonSerializable()
class HotelDescription {
  final String description;
  final List<String> peculiarities;

  HotelDescription({
    required this.description,
    required this.peculiarities,
  });

  factory HotelDescription.fromJson(Map<String, dynamic> json) {
    return HotelDescription(
      description: json['description'],
      peculiarities: List<String>.from(json['peculiarities']),
    );
  }
  Map<String,dynamic> toJson ()=> _$HotelDescriptionToJson(this);
}