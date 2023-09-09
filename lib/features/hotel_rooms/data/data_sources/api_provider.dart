import 'package:dio/dio.dart';
import 'package:hotel_app/features/hotel_rooms/domain/entity/room.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'api_provider.g.dart';

@RestApi(
    baseUrl: '')
abstract class ApiProvider {
  factory ApiProvider(Dio dio, {String baseUrl}) = _ApiProvider;

  @GET('https://run.mocky.io/v3/f9a38183-6f95-43aa-853a-9c83cbb05ecd/')
  Future<RoomList> getHotelRooms();
}
