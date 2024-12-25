import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/helpers/extensions.dart';
import 'package:shop_app/core/routing/routes.dart';
import 'package:shop_app/core/theming/app_colors.dart';
import 'package:shop_app/core/widgets/app_text_button.dart';
import 'package:shop_app/features/cart/data/apis/api_keys_stripe.dart';
import 'package:shop_app/features/cart/data/models/payment_intent_reqest_model.dart';
import 'package:shop_app/features/cart/logic/cart_cubit.dart';
import 'package:shop_app/features/cart/logic/cart_state.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is PaymentSuccessState) {
          context.pushNamed(Routes.thanksScreen);
        }
        if (state is PaymentErrorState) {
          SnackBar snackBar = SnackBar(content: Text(state.error));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return Scaffold(
            body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              state is PaymentLoadingState
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    )
                  : SizedBox(
                      height: 54.h,
                      child: AppTextButton(
                        buttonText: "Checkout",
                        textStyle: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: AppColors.white),
                        onPressed: () {
                          PaymentIntentReqestModel paymentIntentReqestModel =
                              PaymentIntentReqestModel(
                                  amount: "100",
                                  currency: "USD",
                                  customerId: ApiKeysStripe.customerId);
                          context.read<CartCubit>().makePayment(
                              paymentIntentReqestModel:
                                  paymentIntentReqestModel);
                        },
                      ),
                    ),
            ],
          ),
        ));
      },
    );
  }
}
