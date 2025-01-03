import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:shop_app/core/networking/api_base_url.dart';
import 'package:shop_app/features/cart/data/apis/cart_api_constants.dart';
import 'package:shop_app/features/cart/data/models/cart_response_body.dart';
import 'package:shop_app/features/cart/data/models/delete_cart_response_model.dart';

part 'cart_api_service.g.dart';

@RestApi(baseUrl: ApiBaseUrl.baseUrl)
abstract class CartApiService {
  factory CartApiService(Dio dio) = _CartApiService;

  @GET(CartApiConstants.cartEndPoint)
  Future<CartResponseBody> getCarts();
}

@RestApi(baseUrl: ApiBaseUrl.baseUrl)
abstract class DeleteCart {
  factory DeleteCart(Dio dio) = _DeleteCart;

  @DELETE("${CartApiConstants.cartEndPoint}/{id}")
  Future<DeleteCartResponseBody> deleteCart(@Path("id") int id);
}
