import 'package:flutter/material.dart';
import 'package:hotel_app/core/presentation/wrapper_widget.dart';
import 'package:hotel_app/core/utils/strings.dart';
import 'package:hotel_app/core/styles/styles.dart';

class ReservationInfoWidget extends StatelessWidget {
  final String hotelName;
  final String departure;
  final String arrivalCountry;
  final String tourDateStart;
  final String tourDateStop;
  final int numberOfNights;
  final String room;
  final String nutrition;
  const ReservationInfoWidget({
    super.key,
    required this.departure,
    required this.arrivalCountry,
    required this.tourDateStart,
    required this.tourDateStop,
    required this.numberOfNights,
    required this.room,
    required this.nutrition, required this.hotelName,
  });

  String generateNight(int numberOfNights) {
    if (numberOfNights >= 11 && numberOfNights <= 14) {
      return '$numberOfNights ${AppSettings.manyNightsText}';
    }

    final lastDigit = numberOfNights % 10;
    if (lastDigit == 1) {
      return '$numberOfNights ${AppSettings.oneNightText}';
    } else if (lastDigit >= 2 && lastDigit <= 4) {
      return '$numberOfNights ${AppSettings.fewNightText}';
    } else {
      return '$numberOfNights ${AppSettings.manyNightsText}';
    }
  }


  @override
  Widget build(BuildContext context) {
    return WrapperWidget(
      child: Column(
        children: [
          SizedBox(height: 16),
          _ItemWidget(labelText: AppSettings.departureText, text: departure),
          const SizedBox(
            height: 16,
          ),
          _ItemWidget(
              labelText: AppSettings.arrivalCountryText, text: arrivalCountry),
          const SizedBox(
            height: 16,
          ),
          _ItemWidget(
              labelText: AppSettings.tourDatesText,
              text: '$tourDateStart – $tourDateStop'),
          const SizedBox(
            height: 16,
          ),
          _ItemWidget(
              labelText: AppSettings.numberOfNightsText,
              text: generateNight(numberOfNights)),
          const SizedBox(
            height: 16,
          ),
          _ItemWidget(labelText: AppSettings.hotelText, text: hotelName),
          const SizedBox(
            height: 16,
          ),
          _ItemWidget(labelText: AppSettings.roomText, text: room),
          const SizedBox(
            height: 16,
          ),
          _ItemWidget(labelText: AppSettings.nutritionText, text: nutrition),
        ],
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  final String labelText;
  final String text;

  const _ItemWidget({
    required this.labelText,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 140,
          child: Text(labelText, style: TextStyles.lightMainTextStyle),
        ),
        Flexible(
          child: Text(text,
              softWrap: true, maxLines: 3, style: TextStyles.mainTextStyle),
        ),
      ],
    );
  }
}
