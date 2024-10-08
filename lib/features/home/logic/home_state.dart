import 'package:shop_app/core/networking/api_error_model.dart';
import 'package:shop_app/features/home/data/models/add_favourite_response_body.dart';
import 'package:shop_app/features/home/data/models/categories_response_body.dart';
import 'package:shop_app/features/home/data/models/home_response_model.dart';

sealed class HomeState {}

class HomeInitialState extends HomeState {}

class HomeDataLoadingState extends HomeState {}

class HomeDataSuccessState extends HomeState {
  final HomeResponseModel homeResponseModel;
  HomeDataSuccessState(this.homeResponseModel);
}

class HomeDataErrorState extends HomeState {
  final ApiErrorModel apiErrorModel;
  HomeDataErrorState(this.apiErrorModel);
}

class AddFavoriteSuccessState extends HomeState {
  final AddFavoriteResponseBody addFavoriteResponseBody;
  AddFavoriteSuccessState(this.addFavoriteResponseBody);
}

class AddFavoriteErrorState extends HomeState {
  final ApiErrorModel apiErrorModel;
  AddFavoriteErrorState(this.apiErrorModel);
}

class CategoriesDataLoadingState extends HomeState {}

class CategoriesDataSuccessState extends HomeState {
  final CategoriesResponseBody categoriesResponseBody;
  CategoriesDataSuccessState(this.categoriesResponseBody);
}

class CategoriesDataErrorState extends HomeState {
  final ApiErrorModel apiErrorModel;
  CategoriesDataErrorState(this.apiErrorModel);
}

class HomeAndCategoriesSuccessState extends HomeState {
  final HomeResponseModel homeResponseModel;
  final CategoriesResponseBody categoriesResponseBody;

  HomeAndCategoriesSuccessState(
      this.homeResponseModel, this.categoriesResponseBody);
}
