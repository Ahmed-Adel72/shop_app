import 'package:dartz/dartz.dart';
import 'package:shop_app/features/cart/data/apis/stripe_service.dart';
import 'package:shop_app/features/cart/data/models/payment_intent_reqest_model.dart';
import 'package:shop_app/features/cart/data/repos/checkout_repo.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final StripeService _stripeService;

  CheckoutRepoImpl(this._stripeService);
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentReqestModel paymentIntentReqestModel}) async {
    try {
      await _stripeService.makePayment(
          paymentIntentReqestModel: paymentIntentReqestModel);
      return right(null);
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
