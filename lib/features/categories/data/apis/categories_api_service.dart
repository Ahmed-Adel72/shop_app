import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/error_logger.dart';
import 'package:shop_app/core/networking/api_base_url.dart';
import 'package:shop_app/features/categories/data/apis/categories_api_constants.dart';
import 'package:shop_app/features/categories/data/models/categories_details_response_body.dart';

part 'categories_api_service.g.dart';

@RestApi(baseUrl: ApiBaseUrl.baseUrl)
abstract class CategoriesApiService {
  factory CategoriesApiService(Dio dio) = _CategoriesApiService;

  @GET("${CategoriesApiConstants.categorieIdEndPoint}/{id}")
  Future<CategoriesDetailsResponseBody> getCategorieData(@Path("id") int id);
}
