class CartResponseBody {
  final bool status;
  final String? message;
  final CartData? data;

  CartResponseBody({
    required this.status,
    this.message,
    this.data,
  });

  factory CartResponseBody.fromJson(Map<String, dynamic> json) {
    return CartResponseBody(
      status: json['status'] ?? false,
      message: json['message'],
      data: json['data'] != null ? CartData.fromJson(json['data']) : null,
    );
  }
}

class CartData {
  final List<CartItem> cartItems;
  final num subTotal;
  final num total;

  CartData({
    required this.cartItems,
    required this.subTotal,
    required this.total,
  });

  factory CartData.fromJson(Map<String, dynamic> json) {
    return CartData(
      cartItems: (json['cart_items'] as List)
          .map((item) => CartItem.fromJson(item))
          .toList(),
      subTotal: json['sub_total'] ?? 0,
      total: json['total'] ?? 0,
    );
  }
}

class CartItem {
  final int id;
  final int quantity;
  final CartProduct product;

  CartItem({
    required this.id,
    required this.quantity,
    required this.product,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'] ?? 0,
      quantity: json['quantity'] ?? 0,
      product: CartProduct.fromJson(json['product']),
    );
  }
}

class CartProduct {
  final int id;
  final num price;
  final num oldPrice;
  final int discount;
  final String image;
  final String name;
  final String description;
  final List<String> images;
  final bool inFavorites;
  final bool inCart;

  CartProduct({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });

  factory CartProduct.fromJson(Map<String, dynamic> json) {
    return CartProduct(
      id: json['id'] ?? 0,
      price: json['price'] ?? 0,
      oldPrice: json['old_price'] ?? 0,
      discount: json['discount'] ?? 0,
      image: json['image'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      images: List<String>.from(json['images'] ?? []),
      inFavorites: json['in_favorites'] ?? false,
      inCart: json['in_cart'] ?? false,
    );
  }
}
