class AddFavouriteRequestBody {
  final int productId;

  AddFavouriteRequestBody({required this.productId});

  Map<String, dynamic> toJson() {
    return {
      "product_id": productId,
    };
  }
}
