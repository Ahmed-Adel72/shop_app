import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      emit(LoginSuccessState(response.data));
    } else if (response is Failure) {
      response as Failure<LoginResponseBody>;
      emit(LoginErrorState(response.apiErrorModel));
    }
  }
}
