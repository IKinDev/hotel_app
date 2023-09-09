import 'package:hotel_app/features/reservation_room/domain/entity/invalid_textfield.dart';

class TouristValidateState {
  
}
class TouristValidateInitialState extends TouristValidateState {
  TouristValidateInitialState();
  
}
class TouristValidateIsValidState extends TouristValidateState {  
  TouristValidateIsValidState();

}
class TouristValidateInvalidState extends TouristValidateState {
  List<TextFieldData> invalidList;

  TouristValidateInvalidState({required this.invalidList});
}


