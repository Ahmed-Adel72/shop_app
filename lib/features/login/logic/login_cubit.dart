import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/constants/app_constants.dart';
import 'package:shop_app/core/helpers/cache_helper.dart';
import 'package:shop_app/core/networking/api_results.dart';
import 'package:shop_app/features/login/data/models/login_request_body.dart';
import 'package:shop_app/features/login/data/models/login_response_body.dart';
import 'package:shop_app/features/login/data/repos/login_repo.dart';
import 'package:shop_app/features/login/logic/login_states.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(Initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void emitLogin() async {
    emit(LoginLoadingState());

    final response = await _loginRepo.login(LoginRequestBody(
        email: emailController.text, password: passwordController.text));

    if (response is Success<LoginResponseBody>) {
      token = response.data.data!.token.toString();
      CacheHelper.setData(key: 'token', value: token);
      emit(LoginSuccessState(response.data));
    } else if (response is Failure) {
      response as Failure<LoginResponseBody>;
      emit(LoginErrorState(response.apiErrorModel));
    }
  }

  bool isPasswordObscure = true;
  IconData suffix = Icons.visibility_outlined;
  void changePasswordVisibility() {
    isPasswordObscure = !isPasswordObscure;
    isPasswordObscure
        ? suffix = Icons.visibility_outlined
        : suffix = Icons.visibility_off_outlined;
    print(isPasswordObscure);
    emit(ChangePasswordVisibilityState());
  }
}
