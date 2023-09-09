import 'package:flutter/material.dart';
import 'package:hotel_app/core/styles/styles.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.text,  this.price, required this.onPressed});

  final String text;

  final String? price;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
   return ElevatedButton(
     style: ElevatedButton.styleFrom(
       minimumSize: const Size.fromHeight(48),
       backgroundColor: const Color(0xFF0D72FF),
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(15),
       ),
     ),
     onPressed: onPressed,
     child: Padding(
       padding: const EdgeInsets.only(top: 15, bottom: 14),
       child: Text(
         price == null ? text : '$text $price',
         textAlign: TextAlign.center,
         style: TextStyles.buttonTextStyle
       ),
     ),
   );
  }
}