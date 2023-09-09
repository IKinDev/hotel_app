import 'package:hotel_app/features/hotel/domain/entity/hotel.dart';

abstract class HotelState {}

class HotelEmptyState extends HotelState {}

class HotelLoadedState extends HotelState {
  final Hotel hotel;
  HotelLoadedState({required this.hotel});
}

class HotelLoadingState extends HotelState {}

class HotelErrorState extends HotelState {
  final String error;
  HotelErrorState({required this.error});
}

