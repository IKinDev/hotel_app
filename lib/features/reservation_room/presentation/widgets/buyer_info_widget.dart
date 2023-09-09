import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/features/reservation_room/presentation/bloc/input_email/input_email_bloc.dart';
import 'package:hotel_app/features/reservation_room/presentation/bloc/input_phone/input_phone_bloc.dart';
import 'package:hotel_app/core/utils/strings.dart';
import 'package:hotel_app/core/styles/styles.dart';

import '../../../../core/presentation/alert_widget.dart';

class BuyerInfoWidget extends StatefulWidget {
  BuyerInfoWidget({
    super.key,
  });

  @override
  State<BuyerInfoWidget> createState() => _BuyerInfoWidgetState();
}

class _BuyerInfoWidgetState extends State<BuyerInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromRGBO(255, 255, 255, 1)),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppSettings.byuerInfoText, style: TextStyles.titleTextStyle),
            SizedBox(height: 20),
            _PhoneTextFieldWidget(),
            SizedBox(
              height: 8,
            ),
            _EmailTextFiledWidget(),
            SizedBox(
              height: 8,
            ),
            Text(
              AppSettings.byuerAttantionText,
              style: TextStyles.attantionTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}

class _EmailTextFiledWidget extends StatefulWidget {
  const _EmailTextFiledWidget({
    super.key,
  });

  @override
  State<_EmailTextFiledWidget> createState() => _EmailTextFiledWidgetState();
}

class _EmailTextFiledWidgetState extends State<_EmailTextFiledWidget> {
  final TextEditingController _controllerEmail = TextEditingController();
  Color color = const Color.fromRGBO(246, 246, 249, 1);

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertWidget(
          errorMessages: [AppSettings.alertEmailText],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InputEmailBloc, InputEmailState>(
      listener: (context, state) {
        if (state is InputEmailValid) {
          color = const Color.fromRGBO(246, 246, 249, 1);
        } else if (state is InputEmailInvalid) {
          _showAlertDialog(context);
          color = const Color.fromRGBO(235, 87, 87, 0.15);
        }
      },
      builder: (context, state) {
        return BlocBuilder<InputEmailBloc, InputEmailState>(
          builder: (context, state) {
            final bloc = BlocProvider.of<InputEmailBloc>(context);
            return Container(
              clipBehavior: Clip.hardEdge,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: _controllerEmail,
                style: TextStyles.textFieldMainTextStyle,
                // onSubmitted: (value) {
                //   bloc.add(CheckValidateInputEmail(inputText: value));
                // },
                onEditingComplete: () {
                  bloc.add(CheckValidateInputEmail(inputText:_controllerEmail.text));
                },          
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 16),
                    label: const Text(AppSettings.textFiledEmailText,
                        style: TextStyles.texFieldLabelTextStyle),
                    filled: true,
                    fillColor: color,
                    border: InputBorder.none),
              ),
            );
          },
        );
      },
    );
  }
}

class _PhoneTextFieldWidget extends StatefulWidget {
  const _PhoneTextFieldWidget({super.key});

  @override
  State<_PhoneTextFieldWidget> createState() => _PhoneTextFieldWidgetState();
}

class _PhoneTextFieldWidgetState extends State<_PhoneTextFieldWidget> {
  final TextEditingController _controllerPhone = TextEditingController();
  String _previousValue = '';

  @override
  void initState() {
    super.initState();
    final bloc = BlocProvider.of<InputPhoneBloc>(context);
    _previousValue = bloc.mask;
    _controllerPhone.text = _previousValue;
    textPhoneListen();
  }

  @override
  void dispose() {
    _controllerPhone.dispose();
    super.dispose();
  }

  void textPhoneListen() {
    final bloc = BlocProvider.of<InputPhoneBloc>(context);
    return _controllerPhone.addListener(() {
      final currentText = _controllerPhone.text;
      if (currentText != _previousValue &&
          currentText.isNotEmpty &&
          currentText.length >= _previousValue.length) {
        final lastChar = currentText.substring(currentText.length - 1);
        bloc.add(InputPhoneNumberEvent(lastChar, _previousValue));
      }
      if (currentText != _previousValue &&
          currentText.isNotEmpty &&
          currentText.length < _previousValue.length) {
        bloc.add(RemovePhoneNumberEvent(_previousValue));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InputPhoneBloc, InputPhoneState>(
      listener: (context, state) {
        if (state is InputPhoneInitial) {
          _controllerPhone.text = state.text;
        }
        if (state is InputPhoneChangeMaskState) {
          _previousValue = state.mask;
        }
      },
      builder: (BuildContext context, InputPhoneState state) {
        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: TextField(
            enableInteractiveSelection: false,
            controller: _controllerPhone,
            style: TextStyles.textFieldMainTextStyle,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                hintText: _previousValue,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                label: const Text(AppSettings.textFieldPhoneNumberText,
                    style: TextStyles.texFieldLabelTextStyle),
                filled: true,
                fillColor: const Color.fromRGBO(246, 246, 249, 1),
                border: InputBorder.none),
          ),
        );
      },
    );
  }
}
