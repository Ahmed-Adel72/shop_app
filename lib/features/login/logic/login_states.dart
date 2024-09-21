import 'package:shop_app/core/networking/api_error_model.dart';
import 'package:shop_app/features/login/data/models/login_response_body.dart';

sealed class LoginState {}

class Initial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final LoginResponseBody loginResponseBody;
  LoginSuccessState(this.loginResponseBody);
}

class LoginErrorState extends LoginState {
  final ApiErrorModel apiErrorModel;
  LoginErrorState(this.apiErrorModel);
}

class ChangePasswordVisibilityState extends LoginState {}
