import 'package:dartz/dartz.dart';
import 'package:shop_app/features/cart/data/apis/cart_api_service.dart';
import 'package:shop_app/features/cart/data/models/cart_response_body.dart';
import 'package:shop_app/features/cart/data/models/delete_cart_response_model.dart';

class CartRepo {
  final CartApiService _cartApiService;
  final DeleteCart _deleteCart;

  CartRepo(this._cartApiService, this._deleteCart);

  Future<Either<Failure, CartResponseBody>> getCarts() async {
    try {
      final response = await _cartApiService.getCarts();
      if (response.status == true) {
        return Right(response);
      }
      return Left(ServerFailure(response.message ?? 'Error occurred'));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  Future<Either<Failure, DeleteCartResponseBody>> deleteCart({
    required int id,
  }) async {
    try {
      final response = await _deleteCart.deleteCart(id);
      if (response.status == true) {
        return Right(response);
      }
      return Left(ServerFailure(response.message));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }
}

abstract class Failure {
  final String errMessage;
  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  const ServerFailure(super.errMessage);
}
