import 'package:flutter/material.dart';
import 'package:hotel_app/features/hotel/hotel_screen.dart';
import 'package:hotel_app/features/hotel_rooms/presentation/hotel_rooms_screen.dart';
import 'package:hotel_app/features/payment/payment_screen.dart';
import 'package:hotel_app/features/reservation_room/presentation/resrvation_room_screen.dart';

abstract class MainNavigationRoutesName {
  static const hotelScreen = '/';
  static const hotelRoomScreen = '/room';
  static const reservationRoom = '/room/reservation';
  static const payment = '/room/reservation/payment';
}

class MainNavigation {
  static const initialRoute = MainNavigationRoutesName.hotelScreen;

  static final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRoutesName.hotelScreen: (context) => HotelScreenWidget(),
    MainNavigationRoutesName.hotelRoomScreen: (context) =>
        HotelRoomsScreenWidget(),
    MainNavigationRoutesName.reservationRoom: (context) =>
        ReservationRoomScreenWidget(),
    MainNavigationRoutesName.payment: (context) => const PaymentScreenWidget(),
  };
}
