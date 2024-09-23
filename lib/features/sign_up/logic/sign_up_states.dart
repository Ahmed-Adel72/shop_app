import 'package:shop_app/core/networking/api_error_model.dart';
import 'package:shop_app/features/sign_up/data/models/sign_up_response_body.dart';

sealed class SignUpStates {}

class Initial extends SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpSuccessState extends SignUpStates {
  final SignUpResponseBody signUpResponseBody;
  SignUpSuccessState(this.signUpResponseBody);
}

class SignUpErrorState extends SignUpStates {
  final ApiErrorModel apiErrorModel;
  SignUpErrorState(this.apiErrorModel);
}

class ChangePasswordVisibilityState extends SignUpStates {}
