class DeleteFavoriteResponse {
  final bool status;
  final String message;
  final DeleteFavoriteData? data;

  DeleteFavoriteResponse({
    required this.status,
    required this.message,
    this.data,
  });

  factory DeleteFavoriteResponse.fromJson(Map<String, dynamic> json) {
    return DeleteFavoriteResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null
          ? DeleteFavoriteData.fromJson(json['data'])
          : null,
    );
  }
}

class DeleteFavoriteData {
  final int id;
  final DeleteProductData product;

  DeleteFavoriteData({
    required this.id,
    required this.product,
  });

  factory DeleteFavoriteData.fromJson(Map<String, dynamic> json) {
    return DeleteFavoriteData(
      id: json['id'] ?? 0,
      product: DeleteProductData.fromJson(json['product']),
    );
  }
}

class DeleteProductData {
  final int id;
  final num price;
  final num oldPrice;
  final int discount;
  final String image;

  DeleteProductData({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
  });

  factory DeleteProductData.fromJson(Map<String, dynamic> json) {
    return DeleteProductData(
      id: json['id'] ?? 0,
      price: json['price'] ?? 0,
      oldPrice: json['old_price'] ?? 0,
      discount: json['discount'] ?? 0,
      image: json['image'] ?? '',
    );
  }
}