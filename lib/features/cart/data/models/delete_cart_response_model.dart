class DeleteCartResponseBody {
  final bool status;
  final String message;
  final DeleteCartData? data;

  DeleteCartResponseBody({
    required this.status,
    required this.message,
    this.data,
  });

  factory DeleteCartResponseBody.fromJson(Map<String, dynamic> json) {
    return DeleteCartResponseBody(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null ? DeleteCartData.fromJson(json['data']) : null,
    );
  }
}

class DeleteCartData {
  final CartDetails cart;
  final num subTotal;
  final num total;

  DeleteCartData({
    required this.cart,
    required this.subTotal,
    required this.total,
  });

  factory DeleteCartData.fromJson(Map<String, dynamic> json) {
    return DeleteCartData(
      cart: CartDetails.fromJson(json['cart']),
      subTotal: json['sub_total'] ?? 0,
      total: json['total'] ?? 0,
    );
  }
}

class CartDetails {
  final int id;
  final int quantity;
  final DeleteProductDetails product;

  CartDetails({
    required this.id,
    required this.quantity,
    required this.product,
  });

  factory CartDetails.fromJson(Map<String, dynamic> json) {
    return CartDetails(
      id: json['id'] ?? 0,
      quantity: json['quantity'] ?? 0,
      product: DeleteProductDetails.fromJson(json['product']),
    );
  }
}

class DeleteProductDetails {
  final int id;
  final num price;
  final num oldPrice;
  final int discount;
  final String image;

  DeleteProductDetails({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
  });

  factory DeleteProductDetails.fromJson(Map<String, dynamic> json) {
    return DeleteProductDetails(
      id: json['id'] ?? 0,
      price: json['price'] ?? 0,
      oldPrice: json['old_price'] ?? 0,
      discount: json['discount'] ?? 0,
      image: json['image'] ?? '',
    );
  }
}
