import 'package:shop_app/features/cart/data/models/cart_response_body.dart';

abstract class CartState {}

class CartInitialState extends CartState {}

class PaymentLoadingState extends CartState {}

class PaymentSuccessState extends CartState {}

class PaymentErrorState extends CartState {
  final String error;

  PaymentErrorState({required this.error});
}

class CartsLoadingState extends CartState {}

class CartsSuccessState extends CartState {
  final CartResponseBody cartResponse;
  CartsSuccessState(this.cartResponse);
}

class CartsErrorState extends CartState {
  final String error;
  CartsErrorState({required this.error});
}
