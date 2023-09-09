import 'package:hotel_app/features/reservation_room/domain/entity/reservation_room.dart';

class ReservationRoomState {}

class ReservationRoomInitialState extends ReservationRoomState {}

class ReservationRoomLoadingState extends ReservationRoomState {}

class ReservationRoomLoadedState extends ReservationRoomState {
  final ReservationRoom reservationRoom;
  ReservationRoomLoadedState({required this.reservationRoom});
}

class ReservationRoomErrorState extends ReservationRoomState {
  final String error;
  ReservationRoomErrorState({required this.error});
}
