part of 'input_email_bloc.dart';

sealed class InputEmailState extends Equatable {
  const InputEmailState();
  
  @override
  List<Object> get props => [];
}

final class InputEmailInitial extends InputEmailState {}

final class InputEmailValid extends InputEmailState{
  final bool isValid;
  final String email;

  const InputEmailValid({required this.isValid, required this.email});

    @override
  List<Object> get props => [isValid, email];
}
final class InputEmailInvalid extends InputEmailState{
  final bool isValid;
  final String email;

  const InputEmailInvalid({required this.isValid, required this.email});

    @override
  List<Object> get props => [isValid, email];
}
