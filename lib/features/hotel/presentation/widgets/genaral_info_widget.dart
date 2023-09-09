import 'package:flutter/material.dart';
import 'package:hotel_app/core/utils/strings.dart';
import 'package:hotel_app/core/styles/styles.dart';

class GeneralInfoWidget extends StatelessWidget {
  final int id;
  final String name;
  final String adress;
  final int minimalPrice;
  final String priceForIt;
  final int rating;
  final String ratingName;

  const GeneralInfoWidget({
    super.key,
    required this.id,
    required this.name,
    required this.adress,
    required this.minimalPrice,
    required this.priceForIt,
    required this.rating,
    required this.ratingName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _RatingWidget(
          rating: rating,
          ratingName: ratingName,
        ),
        _NameWidget(
          name: name,
        ),
        _AddressWidget(
          adress: adress,
        ),
        const SizedBox(height: 16,),
        _PriceWidget(
          priceForIt: priceForIt,
          minimalPrice: minimalPrice,
        ),
      ],
    );
  }
}

class _PriceWidget extends StatelessWidget {
  final int minimalPrice;
  final String priceForIt;
  const _PriceWidget({
    super.key,
    required this.minimalPrice,
    required this.priceForIt,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Text(
            '${AppSettings.hotelScreenHotelInfoMinmalPriceText} $minimalPrice ${AppSettings.rusCurrencyText}',
            style: TextStyles.priceTextStyle,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 3, right: 16),
            child: Text(priceForIt,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.priceForItTextStyle),
          ),
        )
      ],
    );
  }
}

class _AddressWidget extends StatelessWidget {
  final String adress;
  const _AddressWidget({
    super.key,
    required this.adress,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      adress,
      style: TextStyles.addressTextStyle,
    );
  }
}

class _NameWidget extends StatelessWidget {
  final String name;
  const _NameWidget({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(name, style: TextStyles.titleTextStyle),
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: const Color(0x33FFC600)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
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
