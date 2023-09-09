import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_app/core/presentation/peculiarities_widget.dart';
import 'package:hotel_app/features/hotel/domain/entity/hotel_description.dart';
import 'package:hotel_app/core/utils/strings.dart';
import 'package:hotel_app/core/styles/styles.dart';
import 'package:hotel_app/resources/resources.dart';

class DetailInfoWidget extends StatelessWidget {
  final HotelDescription description;
  
  const DetailInfoWidget({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(
        height: 16,
      ),
      const Text(
        AppSettings.hotelScreenDetailInfoText,
        style: TextStyles.titleTextStyle
      ),
      const SizedBox(
        height: 16,
      ),
      PeculiaritiesWidget(peculiarities:description.peculiarities,),
      Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 16),
        child: Text(
          description.description,
          style: TextStyles.mainTextStyle,
        ),
      ),
      const _ListWidget()
    ]);
  }
}

class _ListWidget extends StatelessWidget {
  const _ListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          _ListItemWidget(
            icon: SvgPicture.asset(CustomIcons.emojiHappy),
            title: AppSettings.hotelScreenListFirstItemText,
            subtitle: AppSettings.hotelScreenListSubtitleText,
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.only(left: 36),
            child: Divider(
              height: 1,
            ),
          ),
          const SizedBox(height: 10),
          _ListItemWidget(
            icon:  SvgPicture.asset(CustomIcons.tickSquare),
            title: AppSettings.hotelScreenListSecondItemText,
            subtitle: AppSettings.hotelScreenListSubtitleText,
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.only(left: 36),
            child: Divider(
              height: 1,
            ),
          ),
          const SizedBox(height: 10),
          _ListItemWidget(
            icon:  SvgPicture.asset(CustomIcons.closeSquare),
            title: AppSettings.hotelScreenListThirdItemText,
            subtitle: AppSettings.hotelScreenListSubtitleText,
          ),
        ],
      ),
    );
  }
}

class _ListItemWidget extends StatelessWidget {
  const _ListItemWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.subtitle,
  });

  final SvgPicture icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        icon,
        const SizedBox(
          width: 12,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyles.detailInfoListTitleTextStyle),
              Text(subtitle, style: TextStyles.detailInfoListSubTitleTextStyle),
            ],
          ),
        ),
        const Icon(Icons.arrow_forward_ios),
      ],
    );
  }
}
