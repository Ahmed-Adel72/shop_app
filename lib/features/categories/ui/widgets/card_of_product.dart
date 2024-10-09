import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/networking/api_results.dart';
import 'package:shop_app/core/theming/app_colors.dart';
import 'package:shop_app/features/cart/constants/cart_constants.dart';
import 'package:shop_app/features/categories/data/models/categories_details_response_body.dart';
import 'package:shop_app/features/categories/logic/categories_cubit.dart';
import 'package:shop_app/features/favourites/constants/favourites_constants.dart';
import 'package:shop_app/features/home/data/models/add_favourite_response_body.dart';
import 'package:shop_app/features/home/data/models/add_to_cart_respnse_body.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CardOfProductCategorie extends StatefulWidget {
  final CategoriesDetailsResponseBody? categoriesDetailsResponseBody;
  final int? index;
  const CardOfProductCategorie(
      {super.key, this.categoriesDetailsResponseBody, this.index});

  @override
  State<CardOfProductCategorie> createState() => _CardOfProductState();
}

class _CardOfProductState extends State<CardOfProductCategorie> {
  void toggleFavorite(int productId) async {
    setState(() {
      favorites[productId] = !favorites[productId]!; // Toggle favorite state
    });
    final response = await context.read<CategoriesCubit>().addAndRemoveFavorite(
          productId: productId,
        );
    if (response is Success<AddFavoriteResponseBody>) {
    } else if (response is Failure<AddFavoriteResponseBody>) {
      setState(() {
        favorites[productId] = !favorites[productId]!;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              "Failed to update favorite: ${response.apiErrorModel.message}"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void toggleCart(int productId) async {
    setState(() {
      cart[productId] = !cart[productId]!; // Toggle favorite state
    });
    final response = await context.read<CategoriesCubit>().addOrRemoveCart(
          productId: productId,
        );
    if (response is Success<AddToCartResponseBody>) {
    } else if (response is Failure<AddToCartResponseBody>) {
      setState(() {
        cart[productId] = !cart[productId]!;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text("Failed to update cart: ${response.apiErrorModel.message}"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var model =
        widget.categoriesDetailsResponseBody!.data!.products![widget.index!];
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
          Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: CachedNetworkImage(
                  imageUrl: "${model.image}",
                  progressIndicatorBuilder: (context, url, downloadProgress) {
                    return Skeletonizer(
                      enabled: true,
                      child: Container(
                        width: 150.w,
                        height: 150.h,
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
              model.discount != 0
                  ? Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        color: AppColors.primaryColor,
                        height: 25.h,
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3.0.w),
                            child: Text(
                              "  Discount ",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: AppColors.white),
                            )),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
            child: Column(
              children: [
                Text(
                  "${model.name}",
                  style: Theme.of(context).textTheme.titleSmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  children: [
                    Text(
                      "${model.price}",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 7.w),
                    model.discount != 0
                        ? Text(
                            "${model.oldPrice}",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    color: AppColors.grey,
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: AppColors.grey,
                                    decorationThickness: 1.5),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: favorites[model.id]!
                          ? const Icon(
                              Icons.favorite,
                              color: AppColors.primaryColor,
                            )
                          : const Icon(
                              Icons.favorite_border,
                            ),
                      onPressed: () {
                        toggleFavorite(model.id!);
                      },
                    ),
                    IconButton(
                      icon: cart[model.id]!
                          ? const Icon(
                              Icons.shopping_cart,
                              color: AppColors.primaryColor,
                            )
                          : const Icon(
                              Icons.add_shopping_cart,
                            ),
                      onPressed: () {
                        toggleCart(model.id!);
                      },
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
