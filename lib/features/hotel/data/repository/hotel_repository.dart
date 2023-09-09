import 'package:hotel_app/features/hotel/domain/entity/hotel.dart';
import 'package:hotel_app/features/hotel/data/data_sources/hotel_api_provider.dart';

class HotelRepository {
  final HotelApiProvider hotelApiProvider;

  HotelRepository({required this.hotelApiProvider});

  Future<Hotel> getHotelInfo() async {
    try {      
      final hotel = await hotelApiProvider.getHotel();
      return hotel;
    } catch (error) {
      throw Exception('Ошибка получения данных');
    }
  }
}