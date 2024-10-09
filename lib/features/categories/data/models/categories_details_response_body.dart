class CategoriesDetailsResponseBody {
  bool? status;
  String? message;
  DataModel? data;

  CategoriesDetailsResponseBody({this.status, this.message, this.data});

  CategoriesDetailsResponseBody.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? DataModel.fromJson(json['data']) : null;
  }
}

class DataModel {
  List<ProductsModel>? products;

  DataModel({this.products});

  DataModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      products = <ProductsModel>[];
      json['data'].forEach((v) {
        products!.add(ProductsModel.fromJson(v));
      });
    }
  }
}

class ProductsModel {
  int? id;
  num? price;
  num? oldPrice;
  num? discount;
  String? image;
  String? name;
  String? description;
  List<String>? images;
  bool? inFavorites;
  bool? inCart;

  ProductsModel({
    this.id,
    this.price,
    this.oldPrice,
    this.discount,
    this.image,
    this.name,
    this.description,
    this.images,
    this.inFavorites,
    this.inCart,
  });

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    images = json['images'].cast<String>();
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }
}
