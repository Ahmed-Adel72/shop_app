import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:shop_app/core/networking/api_base_url.dart';
import 'package:shop_app/features/favourites/data/apis/favorites_api_constants.dart';
import 'package:shop_app/features/favourites/data/models/delete_favorite_date.dart';
import 'package:shop_app/features/favourites/data/models/favorites_response.dart';

part 'favorites_api_service.g.dart';

@RestApi(baseUrl: ApiBaseUrl.baseUrl)
abstract class FavoritesApiService {
  factory FavoritesApiService(Dio dio) = _FavoritesApiService;

  @GET(FavoritesApiConstants.favoritesEndPoint)
  Future<FavoritesResponse> getFavorites();
}

@RestApi(baseUrl: ApiBaseUrl.baseUrl)
abstract class DeleteFavorite {
  factory DeleteFavorite(Dio dio) = _DeleteFavorite;

  @DELETE("${FavoritesApiConstants.favoritesEndPoint}/{id}")
  Future<DeleteFavoriteResponse> deleteFavorite(@Path("id") int id);
}
