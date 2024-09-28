import 'package:shop_app/core/networking/api_error_handler.dart';
import 'package:shop_app/core/networking/api_error_model.dart';
import 'package:shop_app/core/networking/api_results.dart';
import 'package:shop_app/features/home/data/apis/home_api_service.dart';
import 'package:shop_app/features/home/data/models/add_favourite_request_body.dart';
import 'package:shop_app/features/home/data/models/add_favourite_response_body.dart';
import 'package:shop_app/features/home/data/models/home_response_model.dart';

class HomeRepo {
  final HomeApiService _apiService;
  final AddAndRemoveFavorite _addAndRemoveFavorite;

  HomeRepo(this._apiService, this._addAndRemoveFavorite);

  Future<ApiResults<HomeResponseModel>> getHomeDate() async {
    try {
      final response = await _apiService.getHomeData();
      if (response.status == true) {
        return ApiResults.success(response);
      }
      return ApiResults.failure(ApiErrorModel(message: response.message));
    } catch (error) {
      return ApiResults.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResults<AddFavoriteResponseBody>> addAndRemoveFavorite(
      AddFavouriteRequestBody addFavoriteRequestBody) async {
    try {
      final response = await _addAndRemoveFavorite
          .addAndRemoveFavorite(addFavoriteRequestBody);
      if (response.status == false) {
        return ApiResults.failure(ApiErrorModel(message: response.message));
      }
      return ApiResults.success(response);
    } catch (error) {
      return ApiResults.failure(ApiErrorHandler.handle(error));
    }
  }
}
