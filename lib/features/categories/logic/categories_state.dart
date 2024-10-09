import 'package:shop_app/core/networking/api_error_model.dart';
import 'package:shop_app/features/categories/data/models/categories_details_response_body.dart';

sealed class CategoriesState {}

class CategorieInitialState extends CategoriesState {}

class CategorieLoadingState extends CategoriesState {}

class CategorieSuccessState extends CategoriesState {
  final CategoriesDetailsResponseBody categoriesDetailsResponseBody;
  CategorieSuccessState(this.categoriesDetailsResponseBody);
}

class CategorieErrorState extends CategoriesState {
  final ApiErrorModel apiErrorModel;
  CategorieErrorState(this.apiErrorModel);
}
