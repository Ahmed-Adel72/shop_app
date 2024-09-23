import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/helpers/extensions.dart';
import 'package:shop_app/core/routing/routes.dart';
import 'package:shop_app/core/theming/app_colors.dart';
import 'package:shop_app/features/sign_up/logic/sign_up_cubit.dart';
import 'package:shop_app/features/sign_up/logic/sign_up_states.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpStates>(
      listenWhen: (previous, current) =>
          current is SignUpLoadingState ||
          current is SignUpSuccessState ||
          current is SignUpErrorState,
      listener: (context, state) {
        switch (state) {
          case SignUpLoadingState _:
            return setupLoadingState(context);
          case SignUpSuccessState _:
            return setupSuccessState(context);
          case SignUpErrorState _:
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
    context.pushNamed(Routes.layoutScreen);
  }

  void setupDefaultState(BuildContext context) {
    const Center(child: Text('Default State'));
  }
}
