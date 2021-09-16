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
