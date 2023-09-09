import 'package:dio/dio.dart';
import 'package:hotel_app/features/hotel/domain/entity/hotel.dart';
import 'package:retrofit/http.dart';

part 'hotel_api_provider.g.dart';

@RestApi(baseUrl: 'https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3/')
abstract class HotelApiProvider{
  factory HotelApiProvider(Dio dio) = _HotelApiProvider;

  @GET('')
  Future<Hotel> getHotel();
}