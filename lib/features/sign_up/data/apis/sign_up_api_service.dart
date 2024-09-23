import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shop_app/core/networking/api_base_url.dart';
import 'package:shop_app/features/sign_up/data/apis/sign_up_api_constans.dart';
import 'package:shop_app/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:shop_app/features/sign_up/data/models/sign_up_response_body.dart';

part 'sign_up_api_service.g.dart';

@RestApi(baseUrl: ApiBaseUrl.baseUrl)
abstract class SignUpApiService {
  factory SignUpApiService(Dio dio, {String baseUrl}) = _SignUpApiService;

  @POST(SignUpApiConstants.signUpEndPoint)
  Future<SignUpResponseBody> signUp(
    @Body() SignUpRequestBody signUpRequestBody,
  );
}
