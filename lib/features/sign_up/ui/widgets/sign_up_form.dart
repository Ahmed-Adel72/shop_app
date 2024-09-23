import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/widgets/app_text_form_field.dart';
import 'package:shop_app/features/sign_up/logic/sign_up_cubit.dart';
import 'package:shop_app/features/sign_up/logic/sign_up_states.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
              controller: context.read<SignUpCubit>().nameController,
              hintText: "name",
              textInputType: TextInputType.name,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "please enter a vaild name";
                }
              }),
          SizedBox(
            height: 20.sp,
          ),
          AppTextFormField(
              controller: context.read<SignUpCubit>().emailController,
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
          AppTextFormField(
              controller: context.read<SignUpCubit>().phoneController,
              hintText: "phone",
              textInputType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty || value.length != 11) {
                  return "please enter a vaild phone";
                }
              }),
          SizedBox(
            height: 20.sp,
          ),
          BlocConsumer<SignUpCubit, SignUpStates>(
              listener: (context, state) {},
              builder: (context, state) {
                return AppTextFormField(
                    controller: context.read<SignUpCubit>().passwordController,
                    hintText: "password",
                    isObscureText:
                        context.read<SignUpCubit>().isPasswordObscure,
                    suffixIcon: IconButton(
                        onPressed: () {
                          context
                              .read<SignUpCubit>()
                              .changePasswordVisibility();
                        },
                        icon: Icon(
                          context.read<SignUpCubit>().suffix,
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
