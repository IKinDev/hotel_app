import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/features/reservation_room/data/repository/repository.dart';
import 'reservation_room_evets.dart';
import 'reservation_room_states.dart';

class ReservationRoomBloc extends Bloc<ReservationRoomEvent, ReservationRoomState> {
  final ReservationRoomRepository reservationRoomRepository;

  ReservationRoomBloc({required this.reservationRoomRepository}) : super(ReservationRoomInitialState()) {
    on<GetReservationRoomEvent>((event, emit) async {
      emit(ReservationRoomLoadingState());
      try {
        final reservationRoom = await reservationRoomRepository.getReservationRoomInfo();
        emit(ReservationRoomLoadedState(reservationRoom: reservationRoom));
      } catch (e) {
        emit(ReservationRoomErrorState(error: e.toString()));
      }
    });
  }
}
