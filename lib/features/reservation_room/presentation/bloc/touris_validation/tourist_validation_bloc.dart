import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/features/reservation_room/data/repository/tourist_repository.dart';
import 'package:hotel_app/features/reservation_room/domain/entity/invalid_textfield.dart';
import 'package:hotel_app/features/reservation_room/presentation/bloc/touris_validation/tourist_validation_event.dart';
import 'package:hotel_app/features/reservation_room/presentation/bloc/touris_validation/tourist_validation_state.dart';

class TouristValidateBloc
    extends Bloc<TouristValidateEvent, TouristValidateState> {
  final TouristRepository repository;

  TouristValidateBloc({required this.repository})
      : super(TouristValidateInitialState()) {
    on<CheckValidityEvent>((event, emit) {
      _checkValidity(emit);
    });

    on<ChangeElementAtIndexEvent>((event, emit) {
      _setValue(event);
    });
    on<TouristValidateEvent>((event, emit) {});
  }

  void _setValue(ChangeElementAtIndexEvent event) {
    for (var element in repository.list) {
      if (element.textFiledName == event.name &&
          element.indexTourist == event.index) {
        element.text = event.value;
        if (element.text == '') {
          element.isValid = false;
        } else {
          element.isValid = true;
        }
      }
    }
  }

  void _checkValidity(
    Emitter<TouristValidateState> emit,
  ) {
    final bool isValid = repository.isOnlyValidData();
    if (isValid) {
      emit(TouristValidateIsValidState());
    } else {
      emit(TouristValidateInvalidState(
          invalidList: repository.getInvalidData()));
    }
  }
}
