import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/theming/app_colors.dart';
import 'package:shop_app/core/widgets/app_text_button.dart';
import 'package:shop_app/features/login/logic/login_cubit.dart';
import 'package:shop_app/features/login/ui/widgets/dont_have_account_text.dart';
import 'package:shop_app/features/login/ui/widgets/email_and_password_form.dart';
import 'package:shop_app/features/login/ui/widgets/login_bloc_listener.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                  "Login",
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
                const EmailAndPasswordForm(),
                SizedBox(
                  height: 54.h,
                  child: AppTextButton(
                    buttonText: "Login",
                    textStyle: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColors.white),
                    onPressed: () {
                      if (context
                          .read<LoginCubit>()
                          .formKey
                          .currentState!
                          .validate()) {
                        context.read<LoginCubit>().emitLogin();
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                const DontHaveAccountText(),
                const LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
