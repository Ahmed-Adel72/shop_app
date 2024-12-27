class FavoritesResponse {
  final bool status;
  final String? message;
  final FavoritesData data;

  FavoritesResponse({
    required this.status,
    this.message,
    required this.data,
  });

  factory FavoritesResponse.fromJson(Map<String, dynamic> json) {
    return FavoritesResponse(
      status: json['status'],
      message: json['message'],
      data: FavoritesData.fromJson(json['data']),
    );
  }
}

class FavoritesData {
  final List<FavoriteItem> data;

  FavoritesData({
    required this.data,
  });

  factory FavoritesData.fromJson(Map<String, dynamic> json) {
    return FavoritesData(
      data: List<FavoriteItem>.from(
          json['data'].map((x) => FavoriteItem.fromJson(x))),
    );
  }
}

class FavoriteItem {
  final int id;
  final Product product;

  FavoriteItem({
    required this.id,
    required this.product,
  });

  factory FavoriteItem.fromJson(Map<String, dynamic> json) {
    return FavoriteItem(
      id: json['id'] as int,
      product: Product.fromJson(json['product']),
    );
  }
}

class Product {
  final int id;
  final double price;
  final double oldPrice;
  final int discount;
  final String image;
  final String name;
  final String description;

  Product({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      price: json['price'].toDouble(),
      oldPrice: json['old_price'].toDouble(),
      discount: json['discount'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
    );
  }
}
