import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/theming/app_colors.dart';
import 'package:shop_app/features/home/data/models/home_response_model.dart';
import 'package:shop_app/features/home/ui/widgets/card_of_product.dart';

class SetupSuccessHome extends StatelessWidget {
  final HomeResponseModel homeResponseModel;
  const SetupSuccessHome({super.key, required this.homeResponseModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: Container(
          color: AppColors.lightGrey,
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
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
    ));
  }
}
