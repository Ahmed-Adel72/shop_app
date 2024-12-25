import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/features/cart/data/models/payment_intent_reqest_model.dart';
import 'package:shop_app/features/cart/data/repos/checkout_repo.dart';
import 'package:shop_app/features/cart/logic/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this._checkoutRepo) : super(CartInitialState());
  final CheckoutRepo _checkoutRepo;

  Future makePayment(
      {required PaymentIntentReqestModel paymentIntentReqestModel}) async {
    emit(PaymentLoadingState());
    var response = await _checkoutRepo.makePayment(
        paymentIntentReqestModel: paymentIntentReqestModel);

    response.fold((left) => emit(PaymentErrorState(error: left.errMessage)),
        (right) => emit(PaymentSuccessState()));
  }
}
