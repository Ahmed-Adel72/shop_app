import 'package:shop_app/core/networking/api_error_handler.dart';
import 'package:shop_app/core/networking/api_error_model.dart';
import 'package:shop_app/core/networking/api_results.dart';
import 'package:shop_app/features/login/data/apis/login_api_service.dart';
import 'package:shop_app/features/login/data/models/login_request_body.dart';
import 'package:shop_app/features/login/data/models/login_response_body.dart';

class LoginRepo {
  final LoginApiService _loginApiService;

  LoginRepo(this._loginApiService);

  Future<ApiResults<LoginResponseBody>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      final respons = await _loginApiService.login(loginRequestBody);
      if (respons.status == false) {
        return ApiResults.failure(
          ApiErrorModel(message: respons.message),
        );
      }
      return ApiResults.success(respons);
    } catch (error) {
      return ApiResults.failure(ApiErrorHandler.handle(error));
    }
  }
}
