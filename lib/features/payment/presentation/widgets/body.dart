import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hotel_app/core/navigation/main_navigation.dart';
import 'package:hotel_app/core/presentation/button_widget.dart';
import 'package:hotel_app/resources/resources.dart';
import 'package:hotel_app/core/utils/strings.dart';
import 'package:hotel_app/core/styles/styles.dart';

class PaymentBodyWidget extends StatelessWidget {
  const PaymentBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateToHotelRoomScreen() {
      Navigator.pushNamedAndRemoveUntil(
          context,
          MainNavigationRoutesName.hotelScreen,
          (Route<dynamic> route) => false);
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const _MainInfoWidget(),
          const Divider(height: 2,color: Color(0xFFF6F6F9),),
          ButtonWidget(
            text: AppSettings.paymentScreenButtonText,
            onPressed: navigateToHotelRoomScreen,
          ),
        ],
      ),
    );
  }
}

class _MainInfoWidget extends StatelessWidget {
  const _MainInfoWidget({
    super.key,
  });

  int getRandomNumber(int min, int max) {
    final random = Random();
    return min + random.nextInt(max - min + 1);
  }

  @override
  Widget build(BuildContext context) {
    final orderNumber = getRandomNumber(1000, 3000);

    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 94,
              height: 94,
              padding: const EdgeInsets.all(25),
              decoration: ShapeDecoration(
                color: const Color(0xFFF6F6F9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1000),
                ),
              ),
              child: const Image(
                image: AssetImage(CustomIcons.partyPopper),
              ),
            ),
            const SizedBox(height: 57),
            const Text(
              AppSettings.paymentAnswerText,
              textAlign: TextAlign.center,
              style: TextStyles.titleTextStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(                
              '${AppSettings.paymentAnswerDetailFirstText}$orderNumber ${AppSettings.paymentAnswerDetailSecondText}',
              textAlign: TextAlign.center,
              style: TextStyles.lightMainTextStyle,
            ),
            const Text(                
              AppSettings.paymentAnswerDetailThirdText,
              textAlign: TextAlign.center,
              style: TextStyles.lightMainTextStyle,
            ),
            const Text(                
              AppSettings.paymentAnswerDetailFourthText,
              textAlign: TextAlign.center,
              style: TextStyles.lightMainTextStyle,
            ),
            const Text(                
              AppSettings.paymentAnswerDetailFivethText,
              textAlign: TextAlign.center,
              style: TextStyles.lightMainTextStyle,
            ),
            const Text(                
              AppSettings.paymentAnswerDetailSixthText,
              textAlign: TextAlign.center,
              style: TextStyles.lightMainTextStyle,
            ),
            
          ],
        ),
      ),
    );
  }
}
