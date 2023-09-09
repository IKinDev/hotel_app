import 'package:flutter/material.dart';
import 'package:hotel_app/core/utils/strings.dart';
import 'package:hotel_app/core/styles/styles.dart';

class HotelAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  const HotelAppBarWidget({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      centerTitle: true,
      title: const Text(
        AppSettings.hotelScreenName,
        textAlign: TextAlign.center,
        style: TextStyles.appBarTitleTextStyle,
      ),
      
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
