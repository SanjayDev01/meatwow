class ProductResponse {
  final bool msg;
  final dynamic products;

  ProductResponse({this.msg, this.products});

  factory ProductResponse.fromJson(Map<String, dynamic> parsedJson) {
    return ProductResponse(
      msg: parsedJson['msg'],
      products: Product.fromJson(parsedJson['products']),
    );
  }
}

class Product {
  final String id;
  final String title;
  final String image;
  final String slug;
  final String productType;
  final bool isPieces;
  final int deliveryCharges;
  final List<ProductVariant> productVariant;
  Product({
    this.id,
    this.productVariant,
    this.deliveryCharges,
    this.image,
    this.slug,
    this.isPieces,
    this.productType,
    this.title,
  });

  factory Product.fromJson(Map<String, dynamic> data) {
    var proVariant = data['productVariant'] as List;
    List<ProductVariant> productVariants =
        proVariant.map((i) => ProductVariant.fromJson(i)).toList();

    return Product(
      id: data["_id"],
      productVariant: productVariants,
      deliveryCharges: data["deliveryCharges"],
      image: data["image"],
      isPieces: data["isPieces"],
      title: data["title"],
      slug: data["slug"],
      productType: data["productType"],
    );
  }
}

class ProductVariant {
  final int price;
  final int sellPrice;
  ProductVariant({this.price, this.sellPrice});
  factory ProductVariant.fromJson(Map<String, dynamic> data) {
    return ProductVariant(
      price: data["price"],
      sellPrice: data["sellPrice"],
    );
  }
}
