import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/core/navigation/main_navigation.dart';
import 'package:hotel_app/core/presentation/button_widget.dart';
import 'package:hotel_app/core/presentation/corousel_widget.dart';
import 'package:hotel_app/core/presentation/wrapper_widget.dart';
import 'package:hotel_app/features/hotel/presentation/bloc/hotel_bloc.dart';
import 'package:hotel_app/features/hotel/presentation/bloc/hotel_state.dart';
import 'package:hotel_app/features/hotel/presentation/widgets/detail_info_widget.dart';
import 'package:hotel_app/features/hotel/presentation/widgets/genaral_info_widget.dart';
import 'package:hotel_app/core/utils/strings.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

 

  @override
  Widget build(BuildContext context) {
  void navigateToHotelRoomScreen() {
  Navigator.pushNamed(context, MainNavigationRoutesName.hotelRoomScreen);
}
    return BlocConsumer<HotelBloc, HotelState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is HotelLoadedState) {
          return SingleChildScrollView(
            child: Container(
              color: const Color(0xFFF6F6F9),
              child: Column(
                children: [
                  WrapperWidget(
                    child: Column(
                      children: [
                        CarouselWidget(imageUrls: state.hotel.imageUrls),
                        const SizedBox(
                          height: 16,
                        ),
                        GeneralInfoWidget(
                          id: state.hotel.id,
                          name: state.hotel.name,
                          adress: state.hotel.adress,
                          minimalPrice: state.hotel.minimalPrice,
                          priceForIt: state.hotel.priceForIt,
                          rating: state.hotel.rating,
                          ratingName: state.hotel.ratingName,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  WrapperWidget(
                      child: DetailInfoWidget(
                    description: state.hotel.aboutTheHotel,
                  )),
                  const SizedBox(height: 12),
                  const Divider(
                    height: 1,
                  ),
                  Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color.fromRGBO(255, 255, 255, 1)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 12, bottom: 16, left: 16, right: 16),
                        child: ButtonWidget(
                            text: AppSettings.hotelRoomScreenButton,  onPressed: navigateToHotelRoomScreen,),
                      )),
                ],
              ),
            ),
          );
        } else if (state is HotelErrorState) {
          return Center(
            child: Text(state.error),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
