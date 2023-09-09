import 'package:hotel_app/features/reservation_room/domain/entity/invalid_textfield.dart';
import 'package:hotel_app/core/utils/strings.dart';

class TouristRepository {
  int touristCounter = 1;
  final List<TextFieldData> list = [];

  TouristRepository._privateConstructor() {
    addTextFieldData(0);
  }

  static final TouristRepository _instance =
      TouristRepository._privateConstructor();

  factory TouristRepository() {
    return _instance;
  }

  List<TextFieldData> getInvalidData(){
    return list.where((element) => element.isValid == false).toList();
  }

  bool isOnlyValidData (){
    final list = getInvalidData();
    if(list.isEmpty){
      return true;
    }
    return false; 
  }

  List<TextFieldData> getTourist(int index, String name) => list
      .where((element) =>
          (element.indexTourist == index && element.textFiledName == name))
      .toList();

  TextFieldData getTouristItem(int index, String name) => list
      .where((element) =>
          (element.indexTourist == index && element.textFiledName == name))
      .single;

  void addTextFieldData(int index) => list.addAll({
        TextFieldData(index, AppSettings.textFiledNameText, '', false),
        TextFieldData(index, AppSettings.textFiledSurnameText, '', false),
        TextFieldData(index, AppSettings.textFiledBornDateText, '', false),
        TextFieldData(index, AppSettings.textFiledNationalityText, '', false),
        TextFieldData(
            index, AppSettings.textFiledInternationalPassportText, '', false),
        TextFieldData(index,
            AppSettings.textFiledValidInternationalPassportText, '', false),
      });
}
