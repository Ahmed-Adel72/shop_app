import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/features/cart/data/models/payment_intent_reqest_model.dart';
import 'package:shop_app/features/cart/data/repos/cart_repo.dart';
import 'package:shop_app/features/cart/logic/cart_state.dart';

import '../data/repos/checkout_repo.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this._checkoutRepo, this._cartRepo) : super(CartInitialState());
  final CheckoutRepo _checkoutRepo;
  final CartRepo _cartRepo;

  Future<void> makePayment({
    required PaymentIntentReqestModel paymentIntentReqestModel,
  }) async {
    try {
      emit(PaymentLoadingState());
      final response = await _checkoutRepo.makePayment(
        paymentIntentReqestModel: paymentIntentReqestModel,
      );

      response.fold(
        (failure) async {
          emit(PaymentErrorState(error: failure.errMessage));
          await getCarts();
        },
        (success) async {
          emit(PaymentSuccessState());
          await getCarts();
        },
      );
    } catch (e) {
      emit(PaymentErrorState(error: e.toString()));
      await getCarts();
    }
  }

  Future<void> getCarts() async {
    emit(CartsLoadingState());
    final response = await _cartRepo.getCarts();

    response.fold(
      (failure) => emit(CartsErrorState(error: failure.errMessage)),
      (cartResponse) => emit(CartsSuccessState(cartResponse)),
    );
  }

  void deleteCart({required int id}) async {
    emit(CartsLoadingState());
    final response = await _cartRepo.deleteCart(id: id);

    response.fold(
      (failure) => emit(CartsErrorState(error: failure.errMessage)),
      (deleteResponse) async {
        // Refresh cart after successful deletion
        await getCarts();
      },
    );
  }
}
