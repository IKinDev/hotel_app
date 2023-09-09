import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/features/hotel/presentation/bloc/hotel_bloc.dart';
import 'package:hotel_app/features/hotel/presentation/widgets/body.dart';
import 'package:hotel_app/features/hotel/presentation/widgets/hotel_appbar.dart';
import 'package:hotel_app/features/hotel/data/data_sources/hotel_api_provider.dart';
import 'package:hotel_app/features/hotel/data/repository/hotel_repository.dart';

import 'presentation/bloc/hotel_event.dart';
//import 'package:hotel_app/features/hotel/presentation/widgets/hotel_appbar.dart';

class HotelScreenWidget extends StatelessWidget {
  HotelScreenWidget({super.key});

  final HotelApiProvider hotelApiProvider = HotelApiProvider(Dio());

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
        create: (context) =>
            HotelRepository(hotelApiProvider: hotelApiProvider),
        child: BlocProvider(
          create: (context) =>
              HotelBloc(hotelRepository: context.read<HotelRepository>())
                ..add(GetHotelEvent()),
          child: const Scaffold(
            body: SafeArea(top: true, child: BodyWidget()),
            appBar: HotelAppBarWidget(height: 50),
          ),
        ));
  }
}
