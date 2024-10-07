class AddToCartResponseBody {
  final bool? status;
  final String? message;

  AddToCartResponseBody({this.status, this.message});

  factory AddToCartResponseBody.fromJson(Map<String, dynamic> json) {
    return AddToCartResponseBody(
      status: json["status"] as bool?,
      message: json["message"] as String?,
    );
  }
}
