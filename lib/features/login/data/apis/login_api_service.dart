import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shop_app/core/networking/api_base_url.dart';
import 'package:shop_app/features/login/data/models/login_request_body.dart';
import 'package:shop_app/features/login/data/models/login_response_body.dart';
import 'login_api_constants.dart';

part 'login_api_service.g.dart';

@RestApi(baseUrl: ApiBaseUrl.baseUrl)
abstract class LoginApiService {
  factory LoginApiService(Dio dio, {String baseUrl}) = _LoginApiService;

  @POST(LoginApiConstants.loginEndPoint)
  Future<LoginResponseBody> login(
    @Body() LoginRequestBody loginRequestBody,
  );
}
