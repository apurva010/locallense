import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService({required Dio dio, required String baseUrl}) {
    return _ApiService(dio, baseUrl: baseUrl);
  }

  // /// check phone number availability status in DB
  // @POST('user-profile/interaction/user-exists')
  // Future<APIResponse<CheckUserExistResDm>> checkUserExist(
  //   @Body() CheckUserExistReqDm checkUserExistReqDm,
  // );
}
