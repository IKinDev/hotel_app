class TouristValidateEvent {}

class CheckValidityEvent extends TouristValidateEvent {}

class ChangeElementAtIndexEvent extends TouristValidateEvent {
  final int index;
  final String name;
  final String value;

  ChangeElementAtIndexEvent(
      {required this.index, required this.name, required this.value});
}
