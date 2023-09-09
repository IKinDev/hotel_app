part of 'input_phone_bloc.dart';

sealed class InputPhoneState extends Equatable {
   
  const InputPhoneState();

  @override
  List<Object> get props => [];
}

final class InputPhoneInitial extends InputPhoneState {
  final bool isValid;
  final String text;

  const InputPhoneInitial( {required this.isValid,required this.text,});
 
}

final class InputPhoneChangeMaskState extends InputPhoneState {
  final String mask;

  const InputPhoneChangeMaskState( {required this.mask});
 
}