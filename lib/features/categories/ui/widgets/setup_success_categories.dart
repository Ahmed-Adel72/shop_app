import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/theming/app_colors.dart';
import 'package:shop_app/features/categories/data/models/categories_details_response_body.dart';
import 'package:shop_app/features/categories/ui/widgets/card_of_product.dart';

class SetupSuccessCategorie extends StatelessWidget {
  final CategoriesDetailsResponseBody categoriesDetailsResponseBody;
  const SetupSuccessCategorie(
      {super.key, required this.categoriesDetailsResponseBody});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Category Details",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 5.h),
        child: Container(
          color: AppColors.lightGrey,
          child: GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 15.h,
                childAspectRatio: 0.69),
            itemBuilder: (context, index) {
              return CardOfProductCategorie(
                categoriesDetailsResponseBody: categoriesDetailsResponseBody,
                index: index,
              );
            },
            itemCount: categoriesDetailsResponseBody.data!.products!.length,
          ),
        ),
      ),
    );
  }
}
