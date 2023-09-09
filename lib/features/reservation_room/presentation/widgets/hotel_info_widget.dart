import 'package:flutter/material.dart';
import 'package:hotel_app/core/presentation/wrapper_widget.dart';
import 'package:hotel_app/core/styles/styles.dart';

class HotelInfoWidget extends StatelessWidget {
  final String hotelName;
  final String hotelAddress;
  final int rating;
  final String ratingName;
  const HotelInfoWidget(
      {super.key,
      required this.hotelName,
      required this.hotelAddress,
      required this.rating,
      required this.ratingName});

  @override
  Widget build(BuildContext context) {
    return WrapperWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          _RatingWidget(rating: rating, ratingName: ratingName),
          _HotelTitleWidget(
            hotelName: hotelName,
          ),
          _HotelAdressWidget(
            hotelAddress: hotelAddress,
          ),
        ],
      ),
    );
  }
}

class _HotelAdressWidget extends StatelessWidget {
  final String hotelAddress;
  const _HotelAdressWidget({
    super.key,
    required this.hotelAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Text(hotelAddress, style: TextStyles.addressTextStyle);
  }
}

class _HotelTitleWidget extends StatelessWidget {
  final String hotelName;
  const _HotelTitleWidget({
    super.key,
    required this.hotelName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(hotelName, style: TextStyles.titleTextStyle),
    );
  }
}

class _RatingWidget extends StatelessWidget {
  final int rating;
  final String ratingName;

  const _RatingWidget({
    super.key,
    required this.rating,
    required this.ratingName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: const Color(0x33FFC600)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.star,
                color: Color(0xFFFFA800),
              ),
              Text('$rating $ratingName',
                  textAlign: TextAlign.center,
                  style: TextStyles.rateNameTextStyle)
            ]),
      ),
    );
  }
}
