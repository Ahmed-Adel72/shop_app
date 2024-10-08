import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/theming/app_colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SetupLoadingHome extends StatelessWidget {
  const SetupLoadingHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Scaffold(
          body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 150.h,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            children: [
                              Container(
                                height: 80.h,
                                width: 80.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.lightGrey,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "apple ",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            width: 3.w,
                          ),
                      itemCount: 4),
                ),
                Container(
                  color: AppColors.lightGrey,
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.w,
                        mainAxisSpacing: 15.h,
                        childAspectRatio: 0.68),
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        clipBehavior: Clip.antiAlias,
                        color: AppColors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10.h),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  height: 130.h,
                                  width: 150.w,
                                  decoration: BoxDecoration(
                                    color: AppColors.lightGrey,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                              child: Column(
                                children: [
                                  Text(
                                    "apple phone 15 pro max",
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        "40000",
                                      ),
                                      SizedBox(width: 7.w),
                                      const Text(
                                        "500000",
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        icon: const Icon(
                                          Icons.favorite_border,
                                        ),
                                        onPressed: () {},
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.add_shopping_cart,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: 6,
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
