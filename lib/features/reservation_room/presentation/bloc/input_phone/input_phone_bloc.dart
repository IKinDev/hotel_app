import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


part 'input_phone_event.dart';
part 'input_phone_state.dart';

class InputPhoneBloc extends Bloc<InputPhoneEvent, InputPhoneState> {
  String mask;

  bool isMaskValid(String mask) {
    return !mask.contains('*');
  }

String fillMaskWithNumber(String mask, String number) {
  final maskedChars = mask.split('');
  final numberChars = number.split('');

  for (var i = 0; i < maskedChars.length; i++) {
    final maskChar = maskedChars[i];

    if (maskChar == '*' && numberChars.isNotEmpty) {
      maskedChars[i] = numberChars.removeAt(0);
    }
  }

  final result = maskedChars.join('');

  return result;
}

String replaceLastDigitWithAsterisk(String input) {
  if (input.isEmpty) {
    return input;
  }  

  int firstDigitIndex = input.indexOf(RegExp(r'\d'));
  
  if (firstDigitIndex != -1) {
    // Ищем последнюю цифру в строке (не считая "+")
    int lastDigitIndex = input.lastIndexOf(RegExp(r'\d'));
    
    // Если найдена последняя цифра
    if (lastDigitIndex != -1 && firstDigitIndex != lastDigitIndex) {
      // Создаем новую строку с заменой последней цифры на "*"
      return input.replaceRange(lastDigitIndex, lastDigitIndex + 1, '*');
    }
  }
  
  return input; 
}


  InputPhoneBloc({required this.mask}) : super(InputPhoneInitial(isValid: false, text: mask)) {
    on<InputPhoneNumberEvent>((event, emit) {        
      final outputText = fillMaskWithNumber(event.previousText,event.input);
      mask = outputText;
      emit(InputPhoneChangeMaskState(mask: mask));
      emit(InputPhoneInitial(text: outputText, isValid: isMaskValid(outputText)));   
    });
    on<RemovePhoneNumberEvent>((event, emit) {        
      final outputText = replaceLastDigitWithAsterisk(event.input);
      mask = outputText;
      emit(InputPhoneChangeMaskState(mask: mask));
      emit(InputPhoneInitial(text: outputText, isValid: isMaskValid(outputText)));   
    });

  }
}