import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/theming/app_colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SetupLoadingFavorites extends StatelessWidget {
  const SetupLoadingFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.separated(
          itemBuilder: (context, index) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            // Product Image
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius:
                                    BorderRadiusDirectional.circular(10),
                              ),
                              // Add your image here
                              // child: Image.network('your_image_url'),
                            ),
                            SizedBox(width: 12.w),
                            // Product Details
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Apple iPhone 12 Pro Max 256GB 6 GB RAM, Pacific Blue",
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 12.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        // Quantity Controls
                                        // Row(
                                        //   children: [
                                        //     IconButton(
                                        //       onPressed: () {
                                        //         // Decrease quantity
                                        //       },
                                        //       icon: const Icon(Icons.remove_circle_outline),
                                        //     ),
                                        //     const Text(
                                        //       '1', // Your quantity variable here
                                        //       style: TextStyle(fontSize: 16),
                                        //     ),
                                        //     IconButton(
                                        //       onPressed: () {
                                        //         // Increase quantity
                                        //       },
                                        //       icon: const Icon(Icons.add_circle_outline),
                                        //     ),
                                        //   ],
                                        // ),
                                        // Price
                                        Text(
                                          "2500 EGP",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                  color: AppColors.primaryColor,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          separatorBuilder: (context, index) => SizedBox(height: 5.h),
          itemCount: 10),
    );
  }
}
