import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/core/navigation/main_navigation.dart';
import 'package:hotel_app/core/presentation/button_widget.dart';
import 'package:hotel_app/core/presentation/corousel_widget.dart';
import 'package:hotel_app/core/presentation/peculiarities_widget.dart';
import 'package:hotel_app/core/presentation/wrapper_widget.dart';
import 'package:hotel_app/features/hotel_rooms/domain/entity/room.dart';
import 'package:hotel_app/features/hotel_rooms/presentation/bloc/bloc.dart';
import 'package:hotel_app/features/hotel_rooms/presentation/bloc/state.dart';
import 'package:hotel_app/core/utils/strings.dart';
import 'package:hotel_app/core/styles/styles.dart';

class HotelRoomsBodyWidget extends StatelessWidget {
  const HotelRoomsBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateToHotelRoomScreen() {
      Navigator.pushNamed(context, MainNavigationRoutesName.reservationRoom);
    }

    return BlocConsumer<HotelRoomsBloc, HotelRoomsState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is HotelRoomsLoadedState) {
          return Container(
            color: const Color(0xFFF6F6F9),
            child: ListView.builder(
                itemCount: state.hotel.rooms.length,
                itemBuilder: (BuildContext context, index) {
                  final Room room = state.hotel.rooms[index];

                  return Column(
                    children: [
                      const SizedBox(height: 8),
                      WrapperWidget(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             const SizedBox(
                              height: 16,
                            ),
                            CarouselWidget(imageUrls: room.imageUrls),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(room.name, style: TextStyles.titleTextStyle),
                            const SizedBox(
                              height: 8,
                            ),
                            PeculiaritiesWidget(
                              peculiarities: room.peculiarities,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const _MoreInfoButtonWidget(),
                            const SizedBox(
                              height: 16,
                            ),
                            _PriceWidget(
                              price: room.price,
                              price_per: room.pricePer,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            ButtonWidget(
                              text: AppSettings.hotelRoomScreenButton, onPressed: navigateToHotelRoomScreen,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
          );
        } else if (state is HotelRoomsErrorState) {
          return Center(
            child: Text(state.error),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class _PriceWidget extends StatelessWidget {
  final int price;
  final String price_per;

  const _PriceWidget({
    super.key,
    required this.price,
    required this.price_per,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Text('$price ${AppSettings.rusCurrencyText}',
                style: TextStyles.priceTextStyle)),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 3, right: 16),
            child: Text(price_per,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.priceForItTextStyle),
          ),
        )
      ],
    );
  }
}

class _MoreInfoButtonWidget extends StatelessWidget {
  const _MoreInfoButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            padding:
                const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            elevation: 0,
            backgroundColor: const Color.fromRGBO(13, 114, 255, 0.1)),
        onPressed: () {},
        icon: const Padding(
          padding: EdgeInsets.only(right: 8),
          child: Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF0D72FF),
            size: 12,
          ),
        ),
        label: const Text(AppSettings.detailRoomButtonText,
            textAlign: TextAlign.center,
            style: TextStyles.detailInfoRoomTextStyle),
      ),
    );
  }
}
