import 'package:hotel_app/features/hotel_rooms/domain/entity/room.dart';

class HotelRoomsState {
}

class HotelRoomsInitialState extends HotelRoomsState {}

class HotelRoomsLoadedState extends HotelRoomsState {
  final RoomList hotel;
  HotelRoomsLoadedState({required this.hotel});
}

class HotelRoomsLoadingState extends HotelRoomsState {}

class HotelRoomsErrorState extends HotelRoomsState {
  final String error;
  HotelRoomsErrorState({required this.error});
}

