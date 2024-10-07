import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:shop_app/core/networking/api_base_url.dart';
import 'package:shop_app/features/home/data/apis/home_api_constants.dart';
import 'package:shop_app/features/home/data/models/add_favourite_request_body.dart';
import 'package:shop_app/features/home/data/models/add_favourite_response_body.dart';
import 'package:shop_app/features/home/data/models/add_to_cart_request_body.dart';
import 'package:shop_app/features/home/data/models/add_to_cart_respnse_body.dart';
import 'package:shop_app/features/home/data/models/home_response_model.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiBaseUrl.baseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  @GET(HomeApiConstants.homeEndPoint)
  Future<HomeResponseModel> getHomeData();
}

@RestApi(baseUrl: ApiBaseUrl.baseUrl)
abstract class AddAndRemoveFavorite {
  factory AddAndRemoveFavorite(Dio dio) = _AddAndRemoveFavorite;

  @POST(HomeApiConstants.addFavouritePoint)
  Future<AddFavoriteResponseBody> addAndRemoveFavorite(
    @Body() AddFavouriteRequestBody addFavoriteRequestBody,
  );
}

@RestApi(baseUrl: ApiBaseUrl.baseUrl)
abstract class AddAndRemoveCart {
  factory AddAndRemoveCart(Dio dio) = _AddAndRemoveCart;

  @POST(HomeApiConstants.addCartPoint)
  Future<AddToCartResponseBody> addAndRemoveCart(
    @Body() AddToCartRequestBody addToCartRequestBody,
  );
}
