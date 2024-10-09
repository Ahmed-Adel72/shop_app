import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/helpers/extensions.dart';
import 'package:shop_app/core/routing/routes.dart';
import 'package:shop_app/core/theming/app_colors.dart';
import 'package:shop_app/features/home/data/models/categories_response_body.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ListOfCategories extends StatelessWidget {
  final CategoriesResponseBody categories;
  const ListOfCategories({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(12),
              child: GestureDetector(
                onTap: () {
                  context.pushNamed(Routes.categorieDeatailsScreen,
                      arguments: categories.data!.dataBody![index].id!);
                },
                child: Column(
                  children: [
                    SizedBox(
                      height: 80.h,
                      width: 80.w,
                      child: CachedNetworkImage(
                        imageUrl: "${categories.data!.dataBody![index].image}",
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) {
                          return Skeletonizer(
                            enabled: true,
                            child: Container(
                              width: 75.w,
                              height: 75.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(12.0.r),
                                color: AppColors.lightGrey,
                              ),
                            ),
                          );
                        },
                        imageBuilder: (context, imageProvider) => Container(
                          height: 150.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(12.0.r),
                            image: DecorationImage(
                              image: imageProvider,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "${categories.data!.dataBody![index].name}",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
                width: 3.w,
              ),
          itemCount: categories.data!.dataBody!.length),
    );
  }
}
