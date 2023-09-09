import 'package:dio/dio.dart';
import 'package:hotel_app/features/reservation_room/domain/entity/reservation_room.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'api_provider.g.dart';

@RestApi(
    baseUrl: 'https://run.mocky.io/v3/e8868481-743f-4eb2-a0d7-2bc4012275c8/')
abstract class ApiProvider {
  factory ApiProvider(Dio dio, {String baseUrl}) = _ApiProvider;

  @GET('')
  Future<ReservationRoom> getReservationRoom();
}
