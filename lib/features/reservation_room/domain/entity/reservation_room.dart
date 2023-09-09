import 'package:json_annotation/json_annotation.dart';

part'reservation_room.g.dart';

@JsonSerializable()
class ReservationRoom {
  final int id;
  final String hotelName;
  final String hotelAddress;
  final int rating;
  final String ratingName;
  final String departure;
  final String arrivalCountry;
  final String tourDateStart;
  final String tourDateStop;
  final int numberOfNights;
  final String room;
  final String nutrition;
  final int tourPrice;
  final int fuelCharge;
  final int serviceCharge;

  ReservationRoom({
    required this.id,
    required this.hotelName,
    required this.hotelAddress,
    required this.rating,
    required this.ratingName,
    required this.departure,
    required this.arrivalCountry,
    required this.tourDateStart,
    required this.tourDateStop,
    required this.numberOfNights,
    required this.room,
    required this.nutrition,
    required this.tourPrice,
    required this.fuelCharge,
    required this.serviceCharge,
  });

  factory ReservationRoom.fromJson(Map<String, dynamic> json) {
    return ReservationRoom(
      id: json['id'],
      hotelName: json['hotel_name'],
      hotelAddress: json['hotel_adress'],
      rating: json['horating'],
      ratingName: json['rating_name'],
      departure: json['departure'],
      arrivalCountry: json['arrival_country'],
      tourDateStart: json['tour_date_start'],
      tourDateStop: json['tour_date_stop'],
      numberOfNights: json['number_of_nights'],
      room: json['room'],
      nutrition: json['nutrition'],
      tourPrice: json['tour_price'],
      fuelCharge: json['fuel_charge'],
      serviceCharge: json['service_charge'],
    );
  }  

  Map<String,dynamic> toJson ()=> _$ReservationRoomToJson(this);
}