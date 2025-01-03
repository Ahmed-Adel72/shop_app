import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/theming/app_colors.dart';
import 'package:shop_app/features/cart/data/models/cart_response_body.dart';

class BuildProductDetails extends StatelessWidget {
  final CartItem model;
  final Function updateQuantity;
  final Map<int, int>? quantities;
  const BuildProductDetails(
      {super.key,
      required this.model,
      required this.updateQuantity,
      required this.quantities});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          model.product.name,
          style: Theme.of(context).textTheme.titleSmall,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 8.h),
        // Quantity Controls
        _buildQuantitiesControls(context),
      ],
    );
  }

  Widget _buildQuantitiesControls(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => updateQuantity(model.id, false),
          icon: const Icon(Icons.remove_circle_outline),
          color: AppColors.primaryColor,
        ),
        Text(
          '${quantities![model.id]}',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        IconButton(
          onPressed: () => updateQuantity(model.id, true),
          icon: const Icon(Icons.add_circle_outline),
          color: AppColors.primaryColor,
        ),
        Text(
          "${model.product.price * (quantities![model.id] ?? 1)} EGP",
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
