import 'package:dio/dio.dart';
import 'package:locallense/apibase/model/api_response_model.dart';
import 'package:locallense/model/request/login/google_login_req.dart';
import 'package:locallense/model/request/pref/pref_req_dm.dart';
import 'package:locallense/model/request/update_user/update_user_info_req.dart';
import 'package:locallense/model/request/user_question/post_user_question_req.dart';
import 'package:locallense/model/response/login/google_login_res.dart';
import 'package:locallense/model/response/place_type/place_type_res.dart';
import 'package:locallense/model/response/preferences/preferences_res.dart';
import 'package:locallense/model/response/questions/questions_res.dart';
import 'package:locallense/model/response/user/user_data_res.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService({required Dio dio, required String baseUrl}) {
    return _ApiService(dio, baseUrl: baseUrl);
  }

  @POST('/auth/google-login')
  Future<APIResponse<GoogleLoginRes>> getAuthToken(
    @Body() GoogleLoginReq checkUserExistReqDm,
  );

  @GET('/auth/user')
  Future<APIResponse<UserDataRes>> getUserData();

  @PUT('/auth/user')
  Future<APIResponse<String>> updateUserData(
    @Body() UpdateUserInfoReq updateUserInfoReq,
  );

  @DELETE('/auth/user')
  Future<APIResponse<String>> deleteUserData();

  @GET('/place-types')
  Future<APIResponse<List<PlaceTypeRes>>> placeTypes();

  @GET('/preferences')
  Future<APIResponse<List<PreferencesRes>>> getPreferences();

  @GET('/questions')
  Future<APIResponse<List<QuestionsRes>>> getQuestions();

  @POST('/preferences/user')
  Future<APIResponse<String>> postUserPreferences(
    @Body() PrefReqDm userPrefs,
  );

  @GET('/preferences/selected')
  Future<APIResponse<List<PreferencesRes>>> getSelectedPreferences();

  @POST('/questions/user')
  Future<APIResponse<String>> postUserQuestionAnswer(
    @Body() PostUserQuestionReq userQuestionAnswer,
  );
}
