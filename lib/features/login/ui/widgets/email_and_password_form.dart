import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/widgets/app_text_form_field.dart';
import 'package:shop_app/features/login/logic/login_cubit.dart';
import 'package:shop_app/features/login/logic/login_states.dart';

class EmailAndPasswordForm extends StatelessWidget {
  const EmailAndPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
              controller: context.read<LoginCubit>().emailController,
              hintText: "email",
              textInputType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "please enter a vaild email";
                }
              }),
          SizedBox(
            height: 20.sp,
          ),
          BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {},
              builder: (context, state) {
                return AppTextFormField(
                    controller: context.read<LoginCubit>().passwordController,
                    hintText: "password",
                    isObscureText: context.read<LoginCubit>().isPasswordObscure,
                    suffixIcon: IconButton(
                        onPressed: () {
                          context.read<LoginCubit>().changePasswordVisibility();
                        },
                        icon: Icon(
                          context.read<LoginCubit>().suffix,
                          size: 22,
                        )),
                    textInputType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter a vaild password";
                      }
                    });
              }),
          SizedBox(
            height: 30.h,
          ),
        ],
      ),
    );
  }
}
