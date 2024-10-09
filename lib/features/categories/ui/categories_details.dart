import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/features/categories/logic/categories_cubit.dart';
import 'package:shop_app/features/categories/logic/categories_state.dart';
import 'package:shop_app/features/categories/ui/widgets/setup_loading_categories.dart';
import 'package:shop_app/features/categories/ui/widgets/setup_success_categories.dart';

class CategoriesDetails extends StatelessWidget {
  final int? id;
  const CategoriesDetails({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
      switch (state) {
        case CategorieLoadingState _:
          return const SetupLoadingCategories();
        case CategorieSuccessState _:
          return SetupSuccessCategorie(
              categoriesDetailsResponseBody:
                  state.categoriesDetailsResponseBody);
        case CategorieErrorState _:
          return const SizedBox();
        default:
          return const SizedBox();
      }
    });
  }
}
