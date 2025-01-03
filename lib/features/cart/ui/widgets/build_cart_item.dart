import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/features/cart/data/models/cart_response_body.dart';
import 'package:shop_app/features/cart/logic/cart_cubit.dart';
import 'package:shop_app/features/cart/ui/widgets/build_cart_product_image.dart';
import 'package:shop_app/features/cart/ui/widgets/build_product_details.dart';

class BuildCartItem extends StatelessWidget {
  final CartItem model;
  final Function updateQuantity;
  final Map<int, int>? quantities;
  const BuildCartItem(
      {super.key,
      required this.model,
      required this.updateQuantity,
      required this.quantities});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                // Product Image
                BuildCartProductImage(
                  imageUrl: model.product.image,
                ),
                SizedBox(width: 12.w),
                // Product Details
                Expanded(
                    child: BuildProductDetails(
                  model: model,
                  updateQuantity: updateQuantity,
                  quantities: quantities,
                )),
              ],
            ),
          ),
          Positioned(
            top: -5.h,
            right: -5.w,
            child: IconButton(
              onPressed: () {
                context.read<CartCubit>().deleteCart(id: model.id);
              },
              icon: const Icon(
                Icons.cancel_sharp,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
