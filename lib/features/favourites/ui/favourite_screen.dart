import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/theming/app_colors.dart';
import 'package:shop_app/features/favourites/logic/favourite_cubit.dart';
import 'package:shop_app/features/favourites/logic/favourite_state.dart';
import 'package:shop_app/features/favourites/ui/widgets/setup_empty_favorites.dart';
import 'package:shop_app/features/favourites/ui/widgets/my_favourites_cart_details.dart';
import 'package:shop_app/features/favourites/ui/widgets/setup_error_favorites.dart';
import 'package:shop_app/features/favourites/ui/widgets/setup_loading_favorites.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            context.read<FavouriteCubit>().getFavorites();
          },
          child: BlocBuilder<FavouriteCubit, FavouriteState>(
            builder: (context, state) {
              if (state is FavoritesLoadingState) {
                return const SetupLoadingFavorites();
              } else if (state is FavoritesSuccessState) {
                if (state.favoritesResponse.data.data.isEmpty) {
                  return const SetupEmptyFavorites();
                }
                return MyFavouritesCartDetails(
                  favoritesResponse: state.favoritesResponse,
                );
              } else if (state is FavoritesErrorState) {
                return SetupErrorFavorites(
                  error:
                      state.apiErrorModel.message ?? 'Unknown error occurred',
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
