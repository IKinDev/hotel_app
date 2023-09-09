part of 'input_email_bloc.dart';

sealed class InputEmailEvent extends Equatable {
  const InputEmailEvent();

  @override
  List<Object> get props => [];
}

class CheckValidateInputEmail extends InputEmailEvent {
  final String inputText;

  const CheckValidateInputEmail({required this.inputText});
}
