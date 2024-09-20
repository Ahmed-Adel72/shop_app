import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/widgets/app_text_form_field.dart';

class EmailAndPasswordForm extends StatelessWidget {
  const EmailAndPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
            hintText: "email",
            textInputType: TextInputType.emailAddress,
            validator: (value) {}),
        SizedBox(
          height: 20.sp,
        ),
        AppTextFormField(
            hintText: "password",
            isObscureText: true,
            textInputType: TextInputType.visiblePassword,
            validator: (value) {}),
        SizedBox(
          height: 30.h,
        ),
      ],
    );
  }
}
