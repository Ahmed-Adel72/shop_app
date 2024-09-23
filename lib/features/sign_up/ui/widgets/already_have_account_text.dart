import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/helpers/extensions.dart';
import 'package:shop_app/core/routing/routes.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
            text: 'Already have account?',
            style: Theme.of(context).textTheme.titleMedium),
        TextSpan(
          text: ' Login',
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(fontSize: 16.sp),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              context.pushReplacementNamed(Routes.loginScreen);
            },
        ),
      ])),
    );
  }
}
