class AddToCartRequestBody {
  final int productId;

  AddToCartRequestBody({required this.productId});

  Map<String, dynamic> toJson() {
    return {
      "product_id": productId,
    };
  }
}
