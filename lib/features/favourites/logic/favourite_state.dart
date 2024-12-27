import 'package:shop_app/core/networking/api_error_model.dart';
import 'package:shop_app/features/favourites/data/models/favorites_response.dart';

sealed class FavouriteState {}

class FavouriteInitialState extends FavouriteState {}

class FavoritesLoadingState extends FavouriteState {}

class FavoritesSuccessState extends FavouriteState {
  final FavoritesResponse favoritesResponse;
  FavoritesSuccessState(this.favoritesResponse);
}

class FavoritesErrorState extends FavouriteState {
  final ApiErrorModel apiErrorModel;
  FavoritesErrorState(this.apiErrorModel);
}
