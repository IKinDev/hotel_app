import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_app/core/navigation/main_navigation.dart';
import 'package:hotel_app/resources/resources.dart';
import 'package:hotel_app/core/utils/strings.dart';
import 'package:hotel_app/core/styles/styles.dart';

class ReservationRoomAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final double height;
  const ReservationRoomAppbarWidget({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      leading: IconButton(
        icon: SvgPicture.asset(CustomIcons.vector3),
        onPressed: () =>
            Navigator.pop(context, MainNavigationRoutesName.hotelRoomScreen),
      ),
      title: const Text(AppSettings.hotelRoomScreenButton,
          textAlign: TextAlign.center, style: TextStyles.appBarTitleTextStyle),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
