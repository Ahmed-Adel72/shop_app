import 'package:dartz/dartz.dart';
import 'package:shop_app/features/cart/data/models/payment_intent_reqest_model.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentReqestModel paymentIntentReqestModel});
}

abstract class Failure {
  final String errMessage;

  Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});
}
