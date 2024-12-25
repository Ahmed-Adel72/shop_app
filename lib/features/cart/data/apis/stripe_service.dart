import 'package:dio/dio.dart';
import 'package:shop_app/features/cart/data/apis/api_constants.dart';
import 'package:shop_app/features/cart/data/apis/api_keys_stripe.dart';
import 'package:shop_app/features/cart/data/apis/api_service_stripe.dart';
import 'package:shop_app/features/cart/data/models/ephemeral_key_model.dart';
import 'package:shop_app/features/cart/data/models/payment_intent_reqest_model.dart';
import 'package:shop_app/features/cart/data/models/payment_intent_response_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final ApiServiceStripe _apiServiceStripe;

  StripeService(this._apiServiceStripe);

  Future<PaymentIntentResponseModel> createPaymentIntent(
      PaymentIntentReqestModel paymentIntentReqestModel) async {
    var response = await _apiServiceStripe.post(
        body: paymentIntentReqestModel.toJson(),
        contentType: Headers.formUrlEncodedContentType,
        url: ApiConstants.stripeUrl,
        token: ApiKeysStripe.secertKey);
    var paymentIntentResponseModel =
        PaymentIntentResponseModel.fromJson(response.data);
    return paymentIntentResponseModel;
  }

  Future<void> initPaymentSheet(
      {required String paymentIntentClientSecret,
      String? ephemeralKeySecert}) async {
    // 2. initialize the payment sheet
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        // Main params
        paymentIntentClientSecret: paymentIntentClientSecret,
        customerId: ApiKeysStripe.customerId,
        customerEphemeralKeySecret: ephemeralKeySecert!,
        merchantDisplayName: 'adel',
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentReqestModel paymentIntentReqestModel}) async {
    var paymentIntentResponseModel =
        await createPaymentIntent(paymentIntentReqestModel);
    var ephemeralKeyModel = await createEphemeralKey(
        customerId: paymentIntentReqestModel.customerId);
    await initPaymentSheet(
        paymentIntentClientSecret: paymentIntentResponseModel.clientSecret,
        ephemeralKeySecert: ephemeralKeyModel.secret);
    await displayPaymentSheet();
  }

  // create ephemeral key
  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    var response = await _apiServiceStripe.post(
        body: {'customer': customerId},
        contentType: Headers.formUrlEncodedContentType,
        url: ApiConstants.ephemeralKeyUrl,
        token: ApiKeysStripe.secertKey,
        headers: {
          'Authorization': 'Bearer ${ApiKeysStripe.secertKey}',
          'Stripe-Version': '2024-10-28.acacia'
        });
    var ephemeralKeyModel = EphemeralKeyModel.fromJson(response.data);
    return ephemeralKeyModel;
  }
}
