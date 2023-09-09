part of 'input_phone_bloc.dart';

sealed class InputPhoneEvent extends Equatable {
  const InputPhoneEvent();

  @override
  List<Object> get props => [];
}

class InputPhoneNumberEvent extends InputPhoneEvent {
  final String input;
  final String previousText;

  const InputPhoneNumberEvent(this.input, this.previousText);
}
class RemovePhoneNumberEvent extends InputPhoneEvent {
  final String input;

  const RemovePhoneNumberEvent(this.input);
}

