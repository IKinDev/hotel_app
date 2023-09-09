import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/features/reservation_room/data/data_sources/api_provider.dart';
import 'package:hotel_app/features/reservation_room/data/repository/repository.dart';
import 'package:hotel_app/features/reservation_room/data/repository/tourist_repository.dart';
import 'package:hotel_app/features/reservation_room/presentation/bloc/input_email/input_email_bloc.dart';
import 'package:hotel_app/features/reservation_room/presentation/bloc/input_phone/input_phone_bloc.dart';
import 'package:hotel_app/features/reservation_room/presentation/bloc/reservation_room/reservation_room_bloc.dart';
import 'package:hotel_app/features/reservation_room/presentation/bloc/reservation_room/reservation_room_evets.dart';
import 'package:hotel_app/features/reservation_room/presentation/bloc/touris_validation/tourist_validation_bloc.dart';
import 'package:hotel_app/features/reservation_room/presentation/bloc/tourist_counter/tourist_counter_bloc.dart';
import 'package:hotel_app/features/reservation_room/presentation/widgets/reservation_room_appbar.dart';
import 'package:hotel_app/features/reservation_room/presentation/widgets/body.dart';

class ReservationRoomScreenWidget extends StatelessWidget {
  ReservationRoomScreenWidget({super.key});
  final ApiProvider apiProvider = ApiProvider(Dio());

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) =>
              ReservationRoomRepository(apiProvider: apiProvider),
        ),
        RepositoryProvider(
          create: (context) => TouristRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ReservationRoomBloc(
                reservationRoomRepository:
                    context.read<ReservationRoomRepository>())
              ..add(GetReservationRoomEvent()),
          ),
          BlocProvider(
            create: (context) => TouristValidateBloc(repository: context.read<TouristRepository>()),
          ),
          BlocProvider(
            create: (context) => TouristCounterBloc(touristRepository:context.read<TouristRepository>()),
          ), 
          BlocProvider(
            create: (context) => InputPhoneBloc(mask:'+7 (***) ***-**-**'),
          ), 
          BlocProvider(
            create: (context) => InputEmailBloc(),
          ),           
        ],
        child: const Scaffold(
          body: ReservationRoomBodyWidget(),
          appBar: ReservationRoomAppbarWidget(
            height: 44,
          ),
        ),
      ),
    );
  }
}
