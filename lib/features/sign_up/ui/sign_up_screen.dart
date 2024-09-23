import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/theming/app_colors.dart';
import 'package:shop_app/core/widgets/app_text_button.dart';
import 'package:shop_app/features/sign_up/logic/sign_up_cubit.dart';
import 'package:shop_app/features/sign_up/ui/widgets/already_have_account_text.dart';
import 'package:shop_app/features/sign_up/ui/widgets/sign_up_bloc_listener.dart';
import 'package:shop_app/features/sign_up/ui/widgets/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  "Sign Up",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Let's start shopping!",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: 50.h,
                ),
                const SignUpForm(),
                SizedBox(
                  height: 54.h,
                  child: AppTextButton(
                    buttonText: "Sign Up",
                    textStyle: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColors.white),
                    onPressed: () {
                      if (context
                          .read<SignUpCubit>()
                          .formKey
                          .currentState!
                          .validate()) {
                        context.read<SignUpCubit>().emitSignUp();
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                const AlreadyHaveAccountText(),
                const SignUpBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
