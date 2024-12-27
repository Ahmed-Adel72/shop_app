import 'package:shop_app/core/networking/api_error_handler.dart';
import 'package:shop_app/core/networking/api_error_model.dart';
import 'package:shop_app/core/networking/api_results.dart';
import 'package:shop_app/features/favourites/data/apis/favorites_api_service.dart';
import 'package:shop_app/features/favourites/data/models/delete_favorite_date.dart';
import 'package:shop_app/features/favourites/data/models/favorites_response.dart';

class FavoritesRepo {
  final FavoritesApiService _favoritesApiService;
  final DeleteFavorite _deleteFavorite;

  FavoritesRepo(this._favoritesApiService, this._deleteFavorite);

  Future<ApiResults<FavoritesResponse>> getFavorites() async {
    try {
      final response = await _favoritesApiService.getFavorites();
      if (response.status == true) {
        return ApiResults.success(response);
      }
      return ApiResults.failure(ApiErrorModel(message: response.message));
    } catch (error) {
      return ApiResults.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResults<DeleteFavoriteResponse>> deleteFavorite(
      {required int id}) async {
    try {
      final response = await _deleteFavorite.deleteFavorite(id);
      if (response.status == true) {
        return ApiResults.success(response);
      }
      return ApiResults.failure(ApiErrorModel(message: response.message));
    } catch (error) {
      return ApiResults.failure(ApiErrorHandler.handle(error));
    }
  }
}
