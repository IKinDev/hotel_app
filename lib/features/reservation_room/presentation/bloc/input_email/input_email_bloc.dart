import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'input_email_event.dart';
part 'input_email_state.dart';

class InputEmailBloc extends Bloc<InputEmailEvent, InputEmailState> {
  bool _isValidEmail(String email) {
    // Регулярное выражение для проверки почты
    final emailRegex = RegExp(
      '^[a-zA-Z0-9.-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$',
      caseSensitive: false, // Нечувствительно к регистру
    );

    return emailRegex.hasMatch(email) && !email.contains(RegExp(r'[а-яА-Я]'));
  }

  InputEmailBloc() : super(InputEmailInitial()) {
    on<CheckValidateInputEmail>((event, emit) {
      final isValid = _isValidEmail(event.inputText);
      if(isValid) {
        emit(InputEmailValid(isValid: isValid, email: event.inputText));
      }
      else{
        emit(InputEmailInvalid(isValid: isValid, email: event.inputText));
      }
    });
  }
}
