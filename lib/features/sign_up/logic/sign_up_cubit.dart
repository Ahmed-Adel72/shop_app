import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/constants/app_constants.dart';
import 'package:shop_app/core/helpers/cache_helper.dart';
import 'package:shop_app/core/networking/api_results.dart';
import 'package:shop_app/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:shop_app/features/sign_up/data/models/sign_up_response_body.dart';
import 'package:shop_app/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:shop_app/features/sign_up/logic/sign_up_states.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  final SignUpRepo _signUpRepo;
  SignUpCubit(this._signUpRepo) : super(Initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitSignUp() async {
    emit(SignUpLoadingState());
    final response = await _signUpRepo.signUp(SignUpRequestBody(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        image: ""));
    if (response is Success<SignUpResponseBody>) {
      token = response.data.data!.token.toString();
      CacheHelper.setData(key: 'token', value: token);
      emit(SignUpSuccessState(response.data));
    } else if (response is Failure) {
      response as Failure<SignUpResponseBody>;
      emit(SignUpErrorState(response.apiErrorModel));
    }
  }

  bool isPasswordObscure = true;
  IconData suffix = Icons.visibility_outlined;
  void changePasswordVisibility() {
    isPasswordObscure = !isPasswordObscure;
    isPasswordObscure
        ? suffix = Icons.visibility_outlined
        : suffix = Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }
}
