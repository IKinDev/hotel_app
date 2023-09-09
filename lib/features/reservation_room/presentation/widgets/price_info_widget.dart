import 'package:flutter/material.dart';
import 'package:hotel_app/core/presentation/wrapper_widget.dart';
import 'package:hotel_app/core/utils/strings.dart';
import 'package:hotel_app/core/styles/styles.dart';

class PriceInfoWidget extends StatelessWidget {
  final int tourPrice;
  final int fuelCharge;
  final int serviceCharge;
  const PriceInfoWidget({
    super.key, required this.tourPrice, required this.fuelCharge, required this.serviceCharge,
  });

  @override
  Widget build(BuildContext context) {
    return WrapperWidget(
      child: Column(
        children: [
          SizedBox(height: 16),
          _ItemWidget(labelText: AppSettings.tourPriceText, text: '$tourPrice ${AppSettings.rusCurrencyText}'),
          const SizedBox(
            height: 16,
          ),
          _ItemWidget(labelText: AppSettings.fuelChargeText, text: '$fuelCharge ${AppSettings.rusCurrencyText}'),
          const SizedBox(
            height: 16,
          ),
          _ItemWidget(labelText: AppSettings.srviceChargeText, text: '$serviceCharge ${AppSettings.rusCurrencyText}'),
          const SizedBox(
            height: 16,
          ),
          _ItemWidget(
              labelText: AppSettings.summaryPriceText, text: '${tourPrice+fuelCharge+serviceCharge} ${AppSettings.rusCurrencyText}', textStyle: TextStyles.summaryPriceStyle,),
        ],
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  final String labelText;
  final String text;
  final TextStyle? textStyle;

  const _ItemWidget({
    required this.labelText,
    required this.text,
    Key? key, this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(labelText, style: TextStyles.lightMainTextStyle),
        
        Text(text, style: textStyle ?? TextStyles.mainTextStyle ),
       
        
      ],
    );
  }
}
