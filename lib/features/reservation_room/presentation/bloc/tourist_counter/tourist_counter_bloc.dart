import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/features/reservation_room/data/repository/tourist_repository.dart';

class TouristCounterBloc extends Bloc<TouristCounterEvent, int> {
  final TouristRepository touristRepository;

  TouristCounterBloc({required this.touristRepository})
      : super(touristRepository.touristCounter) {
    on<Increment>((event, emit) { 
       touristRepository.addTextFieldData(state);
      emit(state + 1);
    
    });
  }
}

class TouristCounterEvent {}

class Increment extends TouristCounterEvent {}
