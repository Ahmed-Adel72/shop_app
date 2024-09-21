import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/helpers/extensions.dart';
import 'package:shop_app/core/routing/routes.dart';
import 'package:shop_app/core/theming/app_colors.dart';
import 'package:shop_app/features/login/logic/login_cubit.dart';
import 'package:shop_app/features/login/logic/login_states.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginLoadingState ||
          current is LoginSuccessState ||
          current is LoginErrorState,
      listener: (context, state) {
        switch (state) {
          case LoginLoadingState _:
            return setupLoadingState(context);
          case LoginSuccessState _:
            return setupSuccessState(context);
          case LoginErrorState _:
            return setupErrorState(context, state.apiErrorModel.message!);
          default:
            return setupDefaultState(context);
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }

  void setupLoadingState(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          color: AppColors.primaryColor,
        ),
      ),
    );
  }

  void setupSuccessState(BuildContext context) {
    context.pop();
    context.pushNamed(Routes.signUpScreen);
  }

  void setupDefaultState(BuildContext context) {
    const Center(child: Text('Default State'));
  }
}
