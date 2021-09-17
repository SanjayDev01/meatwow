class CartModel {
  String userId;
  int productQuantity;
  String productPieces;
  String shop;
  String product;
  String productVariant;

  CartModel(
      {this.userId,
      this.productQuantity,
      this.productPieces,
      this.shop,
      this.product,
      this.productVariant});

  CartModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    productQuantity = json['productQuantity'];
    productPieces = json['productPieces'];
    shop = json['shop'];
    product = json['product'];
    productVariant = json['productVariant'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['productQuantity'] = this.productQuantity;
    data['productPieces'] = this.productPieces;
    data['shop'] = this.shop;
    data['product'] = this.product;
    data['productVariant'] = this.productVariant;
    return data;
  }
}

class GetCart {
  bool msg;
  List<Cart> cart;

  GetCart({this.msg, this.cart});

  GetCart.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['cart'] != null) {
      cart = new List<Cart>();
      json['cart'].forEach((v) {
        cart.add(new Cart.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.cart != null) {
      data['cart'] = this.cart.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cart {
  int productQuantity;
  String sId;
  Product4 product;
  ProductVariant4 productVariant;

  Cart({this.productQuantity, this.sId, this.product, this.productVariant});

  Cart.fromJson(Map<String, dynamic> json) {
    productQuantity = json['productQuantity'];
    sId = json['_id'];
    product =
        json['product'] != null ? new Product4.fromJson(json['product']) : null;
    productVariant = json['productVariant'] != null
        ? new ProductVariant4.fromJson(json['productVariant'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productQuantity'] = this.productQuantity;
    data['_id'] = this.sId;
    if (this.product != null) {
      data['product'] = this.product.toJson();
    }
    if (this.productVariant != null) {
      data['productVariant'] = this.productVariant.toJson();
    }
    return data;
  }
}

class Product4 {
  bool isPieces;
  String sId;
  String title;
  String image;
  String productType;

  Product4({this.isPieces, this.sId, this.title, this.image, this.productType});

  Product4.fromJson(Map<String, dynamic> json) {
    isPieces = json['isPieces'];
    sId = json['_id'];
    title = json['title'];
    image = json['image'];
    productType = json['productType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isPieces'] = this.isPieces;
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['image'] = this.image;
    data['productType'] = this.productType;
    return data;
  }
}

class ProductVariant4 {
  int productQuantityType;
  int salePrice;
  String sId;
  int price;

  ProductVariant4(
      {this.productQuantityType, this.salePrice, this.sId, this.price});

  ProductVariant4.fromJson(Map<String, dynamic> json) {
    productQuantityType = json['productQuantityType'];
    salePrice = json['salePrice'];
    sId = json['_id'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productQuantityType'] = this.productQuantityType;
    data['salePrice'] = this.salePrice;
    data['_id'] = this.sId;
    data['price'] = this.price;
    return data;
  }
}
