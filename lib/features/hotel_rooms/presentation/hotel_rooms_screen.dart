import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/features/hotel_rooms/data/data_sources/api_provider.dart';
import 'package:hotel_app/features/hotel_rooms/data/repository/repository.dart';
import 'package:hotel_app/features/hotel_rooms/presentation/bloc/bloc.dart';
import 'package:hotel_app/features/hotel_rooms/presentation/widgets/hotel_rooms_appbar.dart';
import 'package:hotel_app/features/hotel_rooms/presentation/widgets/hotel_rooms_body.dart';

import 'bloc/event.dart';

class HotelRoomsScreenWidget extends StatelessWidget {
  HotelRoomsScreenWidget({super.key});

  final ApiProvider hotelRoomsApiProvider = ApiProvider(Dio());

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) =>
          HotelRoomsRepository(apiProvider: hotelRoomsApiProvider),
      child: BlocProvider(
        create: (context) => HotelRoomsBloc(
            hotelRoomsRepository: context.read<HotelRoomsRepository>())
          ..add(GetHotelRoomsEvent()),
        child: const Scaffold(
          body: HotelRoomsBodyWidget(),
          appBar: HotelRoomsAppBarWidget(
            height: 44,
          ),
        ),
      ),
    );
  }
}
