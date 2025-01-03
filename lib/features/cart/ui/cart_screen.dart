import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/helpers/extensions.dart';
import 'package:shop_app/core/routing/routes.dart';
import 'package:shop_app/core/theming/app_colors.dart';
import 'package:shop_app/features/cart/logic/cart_cubit.dart';
import 'package:shop_app/features/cart/logic/cart_state.dart';
import 'package:shop_app/features/cart/ui/widgets/my_cart_details.dart';
import 'package:shop_app/features/cart/ui/widgets/setup_cart_empty.dart';
import 'package:shop_app/features/cart/ui/widgets/setup_error_cart.dart';
import 'package:shop_app/features/cart/ui/widgets/setup_loading_cart.dart';
import 'package:shop_app/features/cart/ui/widgets/setup_loading_processing_payment.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        switch (state) {
          case PaymentLoadingState():
            showLoadingDialog(context);
            break;

          case PaymentSuccessState():
            // Dismiss loading dialog if showing
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
            context.pushNamed(Routes.thanksScreen);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Payment completed successfully'),
                backgroundColor: Colors.green,
                duration: Duration(seconds: 2),
              ),
            );
            break;

          case PaymentErrorState():
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 2),
              ),
            );
            break;

          case CartsErrorState():
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error ?? 'An error occurred'),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 2),
              ),
            );
            break;

          default:
            break;
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: RefreshIndicator(
              color: AppColors.primaryColor,
              onRefresh: () async {
                await context.read<CartCubit>().getCarts();
              },
              child: BlocBuilder<CartCubit, CartState>(
                builder: (context, state) => switch (state) {
                  CartsLoadingState() => const SetupLoadingCart(),
                  CartsSuccessState()
                      when state.cartResponse.data!.cartItems.isEmpty =>
                    const SetupCartEmpty(),
                  CartsSuccessState() => MyCartDetails(
                      cartResponseBody: state.cartResponse,
                    ),
                  CartsErrorState() => SetupErrorCart(
                      error: state.error ?? 'Unknown error occurred',
                    ),
                  _ => const SizedBox(),
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
