import 'package:shop_app/core/networking/api_error_handler.dart';
import 'package:shop_app/core/networking/api_error_model.dart';
import 'package:shop_app/core/networking/api_results.dart';
import 'package:shop_app/features/categories/data/apis/categories_api_service.dart';
import 'package:shop_app/features/categories/data/models/categories_details_response_body.dart';

class CategoriesDetailRepo {
  final CategoriesApiService _categoriesApiService;

  CategoriesDetailRepo(this._categoriesApiService);

  Future<ApiResults<CategoriesDetailsResponseBody>> getCategorieDate(
      {required int id}) async {
    try {
      final response = await _categoriesApiService.getCategorieData(id);
      if (response.status == true) {
        return ApiResults.success(response);
      }
      return ApiResults.failure(ApiErrorModel(message: response.message));
    } catch (error) {
      return ApiResults.failure(ApiErrorHandler.handle(error));
    }
  }
}
