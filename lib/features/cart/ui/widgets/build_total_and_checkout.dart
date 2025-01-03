import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/theming/app_colors.dart';
import 'package:shop_app/core/widgets/app_text_button.dart';
import 'package:shop_app/features/cart/data/apis/api_keys_stripe.dart';
import 'package:shop_app/features/cart/data/models/payment_intent_reqest_model.dart';
import 'package:shop_app/features/cart/logic/cart_cubit.dart';

class BuildTotalAndCheckout extends StatelessWidget {
  final double total;
  const BuildTotalAndCheckout({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "total",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: AppColors.grey, fontWeight: FontWeight.w500),
              ),
              Text(
                "${total.toStringAsFixed(0)} EGP",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: AppColors.primaryColor, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
          child: SizedBox(
            height: 54.h,
            width: double.infinity,
            child: AppTextButton(
              buttonText: "Checkout",
              textStyle: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: AppColors.white),
              onPressed: () {
                _handleCheckout(context);
              },
            ),
          ),
        ),
      ],
    );
  }

  void _handleCheckout(BuildContext context) {
    PaymentIntentReqestModel paymentIntentReqestModel =
        PaymentIntentReqestModel(
            amount: "${total.toStringAsFixed(0)}00",
            currency: "EGP",
            customerId: ApiKeysStripe.customerId);
    context
        .read<CartCubit>()
        .makePayment(paymentIntentReqestModel: paymentIntentReqestModel);
  }
}
