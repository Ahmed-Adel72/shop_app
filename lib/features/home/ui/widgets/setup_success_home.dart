import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/theming/app_colors.dart';
import 'package:shop_app/features/home/data/models/categories_response_body.dart';
import 'package:shop_app/features/home/data/models/home_response_model.dart';
import 'package:shop_app/features/home/ui/widgets/card_of_product.dart';
import 'package:shop_app/features/home/ui/widgets/list_of_categories.dart';

class SetupSuccessHome extends StatelessWidget {
  final HomeResponseModel homeResponseModel;
  final CategoriesResponseBody categoriesResponseBody;
  const SetupSuccessHome(
      {super.key,
      required this.homeResponseModel,
      required this.categoriesResponseBody});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListOfCategories(
              categories: categoriesResponseBody,
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: Container(
                color: AppColors.lightGrey,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.w,
                      mainAxisSpacing: 15.h,
                      childAspectRatio: 0.69),
                  itemBuilder: (context, index) {
                    return CardOfProduct(
                      homeResponseModel: homeResponseModel,
                      index: index,
                    );
                  },
                  itemCount: homeResponseModel.data!.products!.length,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
