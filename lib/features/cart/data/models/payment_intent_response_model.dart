class PaymentIntentResponseModel {
  final String id;
  final String object;
  final int amount;
  final int amountCapturable;
  final int amountReceived;
  final bool automaticPaymentMethodsEnabled;
  final String captureMethod;
  final String clientSecret;
  final String confirmationMethod;
  final int created;
  final String currency;
  final bool livemode;
  final List<String> paymentMethodTypes;
  final String status;

  PaymentIntentResponseModel({
    required this.id,
    required this.object,
    required this.amount,
    required this.amountCapturable,
    required this.amountReceived,
    required this.automaticPaymentMethodsEnabled,
    required this.captureMethod,
    required this.clientSecret,
    required this.confirmationMethod,
    required this.created,
    required this.currency,
    required this.livemode,
    required this.paymentMethodTypes,
    required this.status,
  });

  factory PaymentIntentResponseModel.fromJson(Map<String, dynamic> json) {
    return PaymentIntentResponseModel(
      id: json['id'] as String,
      object: json['object'] as String,
      amount: json['amount'] as int,
      amountCapturable: json['amount_capturable'] as int,
      amountReceived: json['amount_received'] as int,
      automaticPaymentMethodsEnabled:
          json['automatic_payment_methods']['enabled'] as bool,
      captureMethod: json['capture_method'] as String,
      clientSecret: json['client_secret'] as String,
      confirmationMethod: json['confirmation_method'] as String,
      created: json['created'] as int,
      currency: json['currency'] as String,
      livemode: json['livemode'] as bool,
      paymentMethodTypes: List<String>.from(json['payment_method_types']),
      status: json['status'] as String,
    );
  }
}

class CardOptions {
  final String requestThreeDSecure;

  CardOptions({required this.requestThreeDSecure});

  factory CardOptions.fromJson(Map<String, dynamic> json) {
    return CardOptions(
      requestThreeDSecure: json['request_three_d_secure'] as String,
    );
  }
}

class LinkOptions {
  final String? persistentToken;

  LinkOptions({this.persistentToken});

  factory LinkOptions.fromJson(Map<String, dynamic> json) {
    return LinkOptions(
      persistentToken: json['persistent_token'] as String?,
    );
  }
}
