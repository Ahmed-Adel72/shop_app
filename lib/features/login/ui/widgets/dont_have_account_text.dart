import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/helpers/extensions.dart';
import 'package:shop_app/core/routing/routes.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
            text: 'Don\'t have an account?',
            style: Theme.of(context).textTheme.titleMedium),
        TextSpan(
          text: ' Sign Up',
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(fontSize: 16.sp),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              context.pushReplacementNamed(Routes.signUpScreen);
            },
        ),
      ])),
    );
  }
}
