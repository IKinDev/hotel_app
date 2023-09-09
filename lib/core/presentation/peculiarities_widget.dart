import 'package:flutter/material.dart';
import 'package:hotel_app/core/styles/styles.dart';

class PeculiaritiesWidget extends StatelessWidget {
  final List<String> peculiarities;
  const PeculiaritiesWidget({super.key, required this.peculiarities});
  
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: List.generate(peculiarities.length, (index) {
        return Container(
          decoration: const BoxDecoration(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              peculiarities[index],
              maxLines: 2,
              style: TextStyles.peculiaritiesTextStyle,
            ),
          ),
        );
      }),
    );
  }
}
