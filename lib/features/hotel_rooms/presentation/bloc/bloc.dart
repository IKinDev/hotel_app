import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/repository.dart';
import 'event.dart';
import 'state.dart';

class HotelRoomsBloc extends Bloc<HotelRoomsEvent, HotelRoomsState> {
  final HotelRoomsRepository hotelRoomsRepository;

  HotelRoomsBloc({required this.hotelRoomsRepository}) : super(HotelRoomsInitialState()) {
    on<GetHotelRoomsEvent>((event, emit) async {
      emit(HotelRoomsLoadingState());
      try {
        final hotelRooms = await hotelRoomsRepository.getHotelRoomsInfo();
        emit(HotelRoomsLoadedState(hotel: hotelRooms));
      } catch (e) {
        emit(HotelRoomsErrorState(error: e.toString()));
        
      }
    });
  }
}
