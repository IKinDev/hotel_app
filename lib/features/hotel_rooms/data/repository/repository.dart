import 'package:hotel_app/features/hotel_rooms/data/data_sources/api_provider.dart';
import 'package:hotel_app/features/hotel_rooms/domain/entity/room.dart';

class HotelRoomsRepository {
  final ApiProvider apiProvider;

  HotelRoomsRepository({required this.apiProvider});

  Future<RoomList> getHotelRoomsInfo() async {
    try {      
      final rooms = await apiProvider.getHotelRooms();
      return rooms;
    } catch (error) {
      throw Exception('Ошибка получения данных');
    }
  }
}