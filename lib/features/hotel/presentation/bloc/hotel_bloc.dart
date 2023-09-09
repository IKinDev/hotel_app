import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/features/hotel/presentation/bloc/hotel_event.dart';
import 'package:hotel_app/features/hotel/presentation/bloc/hotel_state.dart';
import 'package:hotel_app/features/hotel/data/repository/hotel_repository.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  final HotelRepository hotelRepository;

  HotelBloc({required this.hotelRepository}) : super(HotelEmptyState()) {
    on<GetHotelEvent>((event, emit) async {
      emit(HotelLoadingState());
      try {
        final hotel = await hotelRepository.getHotelInfo();
        emit(HotelLoadedState(hotel: hotel));
      } catch (e) {
        emit(HotelErrorState(error: e.toString()));
      }
    });
  }
}

