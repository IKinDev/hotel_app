import 'package:hotel_app/features/reservation_room/domain/entity/reservation_room.dart';

import '../data_sources/api_provider.dart';

class ReservationRoomRepository {
  final ApiProvider apiProvider;

  ReservationRoomRepository({required this.apiProvider});

  Future<ReservationRoom> getReservationRoomInfo() async {
    try {      
      final rooms = await apiProvider.getReservationRoom();
      return rooms;
    } catch (error) {
      throw Exception('Ошибка получения данных');
    }
  }
}