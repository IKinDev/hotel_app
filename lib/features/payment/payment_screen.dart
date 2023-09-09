import 'package:flutter/material.dart';
import 'package:hotel_app/features/payment/presentation/widgets/body.dart';
import 'package:hotel_app/features/payment/presentation/widgets/payment_appbar.dart';


class PaymentScreenWidget extends StatelessWidget {
  const PaymentScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SafeArea(child: PaymentBodyWidget()),
      appBar: PaymentAppBarWidget(height: 44,),
    );
  }
}
