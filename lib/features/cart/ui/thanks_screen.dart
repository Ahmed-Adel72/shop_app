import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/helpers/extensions.dart';
import 'package:shop_app/core/routing/routes.dart';
import 'package:shop_app/core/theming/app_colors.dart';
import 'package:shop_app/core/widgets/app_text_button.dart';

class ThanksScreen extends StatefulWidget {
  const ThanksScreen({super.key});

  @override
  State<ThanksScreen> createState() => _ThanksScreenState();
}

class _ThanksScreenState extends State<ThanksScreen>
    with SingleTickerProviderStateMixin {
  late ConfettiController _confettiController;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 3));
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.elasticOut,
      ),
    );

    _confettiController.play();
    _animationController.forward();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.pushNamedAndRemoveUntil(
          Routes.layoutScreen,
          predicate: (Route<dynamic> route) => false,
        );
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ScaleTransition(
                      scale: _scaleAnimation,
                      child: Container(
                        width: 120.w,
                        height: 120.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green.shade500,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.green.withOpacity(0.3),
                              blurRadius: 10,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.check,
                          size: 80.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h),
                    Text(
                      'Payment Successful!',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Thank you for your purchase',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColors.grey,
                          ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Your order has been confirmed',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColors.grey,
                          ),
                    ),
                    SizedBox(height: 32.h),
                    SizedBox(
                      width: double.infinity,
                      height: 54.h,
                      child: AppTextButton(
                        buttonText: "Continue Shopping",
                        textStyle: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: AppColors.white),
                        onPressed: () {
                          context.pushNamedAndRemoveUntil(
                            Routes.layoutScreen,
                            predicate: (Route<dynamic> route) => false,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: _confettiController,
                blastDirection: pi / 2,
                maxBlastForce: 5,
                minBlastForce: 1,
                emissionFrequency: 0.05,
                numberOfParticles: 50,
                gravity: 0.05,
                shouldLoop: false,
                colors: const [
                  Colors.green,
                  Colors.blue,
                  Colors.pink,
                  Colors.orange,
                  Colors.purple,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
