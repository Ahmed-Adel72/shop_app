import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/helpers/extensions.dart';
import 'package:shop_app/core/routing/routes.dart';
import 'package:shop_app/features/cart/data/models/cart_response_body.dart';
import 'package:shop_app/features/cart/logic/cart_cubit.dart';
import 'package:shop_app/features/cart/logic/cart_state.dart';
import 'package:shop_app/features/cart/ui/widgets/build_cart_item.dart';
import 'package:shop_app/features/cart/ui/widgets/build_total_and_checkout.dart';

class MyCartDetails extends StatefulWidget {
  final CartResponseBody cartResponseBody;
  const MyCartDetails({super.key, required this.cartResponseBody});

  @override
  State<MyCartDetails> createState() => _MyCartDetailsState();
}

class _MyCartDetailsState extends State<MyCartDetails> {
  late Map<int, int>? quantities;
  late double total;

  @override
  void initState() {
    super.initState();

    quantities = {
      for (var item in widget.cartResponseBody.data!.cartItems)
        item.id: item.quantity
    };
    calculateTotal();
  }

  void calculateTotal() {
    total = widget.cartResponseBody.data!.cartItems.fold(0, (sum, item) {
      return sum + (item.product.price * quantities![item.id]!);
    });
  }

  void updateQuantity(int id, bool increase) {
    setState(() {
      if (increase) {
        quantities![id] = (quantities![id] ?? 1) + 1;
      } else if ((quantities![id] ?? 1) > 1) {
        quantities![id] = (quantities![id] ?? 1) - 1;
      }
      calculateTotal();
    });
  }

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
        return Column(
          children: [
            Expanded(
              child: ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.all(8.w),
                itemBuilder: (context, index) {
                  var model = widget.cartResponseBody.data!.cartItems[index];
                  return BuildCartItem(
                    model: model,
                    updateQuantity: updateQuantity,
                    quantities: quantities,
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 5.h),
                itemCount: widget.cartResponseBody.data!.cartItems.length,
              ),
            ),
            BuildTotalAndCheckout(
              total: total,
            )
          ],
        );
      },
    );
  }
}
