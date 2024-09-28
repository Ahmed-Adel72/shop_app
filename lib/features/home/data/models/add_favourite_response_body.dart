class AddFavoriteResponseBody {
  final bool? status;
  final String? message;
  final FavoriteData? data;

  AddFavoriteResponseBody({this.status, this.message, this.data});

  factory AddFavoriteResponseBody.fromJson(Map<String, dynamic> json) {
    return AddFavoriteResponseBody(
      status: json["status"] as bool?,
      message: json["message"] as String?,
      data: json["data"] != null ? FavoriteData.fromJson(json["data"]) : null,
    );
  }
}

class FavoriteData {
  final int? id; // Keeping this as per the JSON structure
  final ProductData? product;

  FavoriteData({this.id, this.product});

  factory FavoriteData.fromJson(Map<String, dynamic> json) {
    return FavoriteData(
      id: json["id"] as int?, // Ensure you can access "id" here
      product: json["product"] != null
          ? ProductData.fromJson(json["product"])
          : null,
    );
  }
}

class ProductData {
  final int? id;
  final num? price;
  final num? oldPrice;
  final num? discount;
  final String? image;

  ProductData({this.id, this.price, this.oldPrice, this.discount, this.image});

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      id: json["id"] as int?,
      price: json["price"] as num?,
      oldPrice: json["old_price"] as num?,
      discount: json["discount"] as num?,
      image: json["image"] as String?,
    );
  }
}
