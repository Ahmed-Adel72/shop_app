import 'package:shop_app/core/networking/api_error_handler.dart';
import 'package:shop_app/core/networking/api_error_model.dart';
import 'package:shop_app/core/networking/api_results.dart';
import 'package:shop_app/features/sign_up/data/apis/sign_up_api_service.dart';
import 'package:shop_app/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:shop_app/features/sign_up/data/models/sign_up_response_body.dart';

class SignUpRepo {
  final SignUpApiService _signUpApiService;
  SignUpRepo(this._signUpApiService);

  Future<ApiResults<SignUpResponseBody>> signUp(
      SignUpRequestBody signUpRequestBody) async {
    try {
      final response = await _signUpApiService.signUp(signUpRequestBody);
      if (response.status == false) {
        return ApiResults.failure(ApiErrorModel(message: response.message));
      }
      return ApiResults.success(response);
    } catch (error) {
      return ApiResults.failure(ApiErrorHandler.handle(error));
    }
  }
}
