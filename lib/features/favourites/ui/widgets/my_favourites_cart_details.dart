import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/theming/app_colors.dart';
import 'package:shop_app/features/favourites/data/models/favorites_response.dart';
import 'package:shop_app/features/favourites/logic/favourite_cubit.dart';
import 'package:shop_app/features/favourites/logic/favourite_state.dart';

class MyFavouritesCartDetails extends StatelessWidget {
  final FavoritesResponse favoritesResponse;

  const MyFavouritesCartDetails({
    super.key,
    required this.favoritesResponse,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.all(8.w),
      itemBuilder: (context, index) {
        var model = favoritesResponse.data.data[index];
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 2,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          // Product Image
                          Container(
                            width: 100.w,
                            height: 110.h,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius:
                                  BorderRadiusDirectional.circular(10),
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.network(
                              model.product.image,
                              fit: BoxFit.fill,
                              errorBuilder: (context, error, stackTrace) {
                                return const Center(
                                  child: Icon(Icons.error_outline,
                                      color: Colors.red),
                                );
                              },
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.primaryColor,
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(width: 12.w),
                          // Product Details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  model.product.name,
                                  style: Theme.of(context).textTheme.titleSmall,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 12.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "${model.product.price} EGP",
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
                    BlocBuilder<FavouriteCubit, FavouriteState>(
                      builder: (context, state) {
                        return Positioned(
                          top: -5.h,
                          right: -5.w,
                          child: IconButton(
                            onPressed: () {
                              context
                                  .read<FavouriteCubit>()
                                  .deleteFavorite(id: model.id);
                            },
                            icon: const Icon(
                              Icons.cancel_sharp,
                              color: Colors.red,
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 5.h),
      itemCount: favoritesResponse.data.data.length,
    );
  }
}
