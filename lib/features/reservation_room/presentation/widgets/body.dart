import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/core/navigation/main_navigation.dart';
import 'package:hotel_app/core/presentation/alert_widget.dart';
import 'package:hotel_app/core/presentation/button_widget.dart';
import 'package:hotel_app/features/reservation_room/data/repository/tourist_repository.dart';
import 'package:hotel_app/features/reservation_room/presentation/bloc/input_email/input_email_bloc.dart';
import 'package:hotel_app/features/reservation_room/presentation/bloc/reservation_room/reservation_room_bloc.dart';
import 'package:hotel_app/features/reservation_room/presentation/bloc/touris_validation/tourist_validation_bloc.dart';
import 'package:hotel_app/features/reservation_room/presentation/bloc/touris_validation/tourist_validation_event.dart';
import 'package:hotel_app/core/utils/strings.dart';
import '../bloc/reservation_room/reservation_room_states.dart';
import '../bloc/touris_validation/tourist_validation_state.dart';
import 'tourist_widget.dart';
import 'buyer_info_widget.dart';
import 'hotel_info_widget.dart';
import 'price_info_widget.dart';
import 'reservation_info_widget.dart';

class ReservationRoomBodyWidget extends StatelessWidget {
  const ReservationRoomBodyWidget({super.key});

  void _showAlertDialog(BuildContext context, List<String> list) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertWidget(
          errorMessages: list,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    void navigateToHotelRoomScreen() {
      Navigator.pushNamed(context, MainNavigationRoutesName.payment);
    }

    bool isEmailValid;
    bool isTourisValid;
    List<String> listMessage = [];

    return BlocBuilder<ReservationRoomBloc, ReservationRoomState>(
      builder: (context, state) {
        if (state is ReservationRoomLoadedState) {
          final reservationRoom = state.reservationRoom;
          return BlocProvider(
            create: (context) => TouristValidateBloc(
                repository: context.read<TouristRepository>()),
            child: Container(
              color: const Color.fromRGBO(246, 246, 249, 1),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    HotelInfoWidget(
                      hotelAddress: reservationRoom.hotelAddress,
                      rating: reservationRoom.rating,
                      ratingName: reservationRoom.ratingName,
                      hotelName: reservationRoom.hotelName,
                    ),
                    const SizedBox(height: 8),
                    ReservationInfoWidget(
                      departure: reservationRoom.departure,
                      hotelName: reservationRoom.hotelName,
                      arrivalCountry: reservationRoom.arrivalCountry,
                      tourDateStart: reservationRoom.tourDateStart,
                      tourDateStop: reservationRoom.tourDateStop,
                      numberOfNights: reservationRoom.numberOfNights,
                      room: reservationRoom.room,
                      nutrition: reservationRoom.nutrition,
                    ),
                    const SizedBox(height: 8),
                    BuyerInfoWidget(),
                    const SizedBox(height: 8),
                    const SizedBox(height: 8),
                    const TouristWidget(),
                    const SizedBox(height: 8),
                    PriceInfoWidget(
                      tourPrice: reservationRoom.tourPrice,
                      fuelCharge: reservationRoom.fuelCharge,
                      serviceCharge: reservationRoom.serviceCharge,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BlocBuilder<InputEmailBloc, InputEmailState>(
                      builder: (context, emailState) {
                        return BlocConsumer<TouristValidateBloc,
                            TouristValidateState>(
                          listener: (context, state) {
                            if (state is TouristValidateIsValidState) {
                              isTourisValid = true;
                              isEmailValid = false;
                              isEmailValid = _checkEmailValidity(
                                  emailState, context, isEmailValid);
                              if (isTourisValid && isEmailValid) {
                                navigateToHotelRoomScreen();
                              } else {
                                _showAlertDialog(
                                    context, [AppSettings.alertEmailText]);
                              }
                            }
                            if (state is TouristValidateInvalidState) {
                              isTourisValid = false;                             
                              isEmailValid = false;
                              isEmailValid = _checkEmailValidity(
                                  emailState, context, isEmailValid);
                              if (isTourisValid && isEmailValid) {
                                navigateToHotelRoomScreen();
                              } else {
                                _showAlertDialog(
                                    context, [AppSettings.alertTouristText]);
                              }
                            }
                          },
                          builder: (context, state) {
                            return Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(255, 255, 255, 1)),
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12, left: 16, right: 16, bottom: 15),
                                  child: ButtonWidget(
                                      text:
                                          '${AppSettings.reservationScreenButtonText} ${reservationRoom.tourPrice + reservationRoom.fuelCharge + reservationRoom.serviceCharge} ${AppSettings.rusCurrencyText}',
                                      onPressed: () {
                                        BlocProvider.of<TouristValidateBloc>(
                                                context)
                                            .add(CheckValidityEvent());
                                      })),
                            );
                          },
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        } else if (state is ReservationRoomErrorState) {
          return Text(state.error);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  bool _checkEmailValidity(
      InputEmailState emailState, BuildContext context, bool isEmailValid) {
    if (emailState is InputEmailInitial) {
      BlocProvider.of<InputEmailBloc>(context)
          .add(const CheckValidateInputEmail(inputText: ''));
      isEmailValid = false;
    } else if (emailState is InputEmailInvalid) {
      isEmailValid = false;
    } else {
      isEmailValid = true;
    }
    return isEmailValid;
  }
}
