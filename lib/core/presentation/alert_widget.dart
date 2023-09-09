import 'package:flutter/material.dart';
import 'package:hotel_app/core/utils/strings.dart';
import 'package:hotel_app/core/styles/styles.dart';

class AlertWidget extends StatelessWidget {
  final List<String> errorMessages;
  const AlertWidget({
    super.key,
    required this.errorMessages,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: double.infinity),
      child: AlertDialog(
        title: const Text(
          AppSettings.alertTitleText,
          style: TextStyles.titleTextStyle,
        ),
        scrollable: true,
        content: Column(          
          mainAxisSize: MainAxisSize.min,
          children: List.generate(errorMessages.length, (index) {
            return Text(errorMessages[index]);
          }),
        ),
        actions: <Widget>[
          Center(
            child: TextButton(
              onPressed: () {
                // Выполнить действие по нажатию на кнопку
                Navigator.of(context).pop(); // Закрыть диалог
              },
              child: const Text(
                AppSettings.alertApproveText,
                style: TextStyles.mainTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
