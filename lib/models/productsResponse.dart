// class ProductResponse {
//   final bool msg;
//   final dynamic products;

//   ProductResponse({this.msg, this.products});

//   factory ProductResponse.fromJson(Map<String, dynamic> parsedJson) {
//     return ProductResponse(
//       msg: parsedJson['msg'],
//       products: Product.fromJson(parsedJson['products']),
//     );
//   }
// }

// class Product {
//   final String id;
//   final String title;
//   final String image;
//   final String slug;
//   final String productType;
//   final bool isPieces;
//   final int deliveryCharges;
//   final List<ProductVariant> productVariant;
//   Product({
//     this.id,
//     this.productVariant,
//     this.deliveryCharges,
//     this.image,
//     this.slug,
//     this.isPieces,
//     this.productType,
//     this.title,
//   });

//   factory Product.fromJson(Map<String, dynamic> data) {
//     var proVariant = data['productVariant'] as List;
//     List<ProductVariant> productVariants =
//         proVariant.map((i) => ProductVariant.fromJson(i)).toList();

//     return Product(
//       id: data["_id"],
//       productVariant: productVariants,
//       deliveryCharges: data["deliveryCharges"],
//       image: data["image"],
//       isPieces: data["isPieces"],
//       title: data["title"],
//       slug: data["slug"],
//       productType: data["productType"],
//     );
//   }
// }

// class ProductVariant {
//   final int price;
//   final int sellPrice;
//   ProductVariant({this.price, this.sellPrice});
//   factory ProductVariant.fromJson(Map<String, dynamic> data) {
//     return ProductVariant(
//       price: data["price"],
//       sellPrice: data["salePrice"],
//     );
//   }
// }
class Product {
  bool msg;
  List<Products> products;

  Product({this.msg, this.products});

  Product.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['products'] != null) {
      products = new List<Products>();
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  List<ProductVariant> productVariant;
  bool isPieces;
  int deliveryCharges;
  String sId;
  String title;
  String slug;
  String image;
  String productType;
  String updatedAt;

  Products(
      {this.productVariant,
      this.isPieces,
      this.deliveryCharges,
      this.sId,
      this.title,
      this.slug,
      this.image,
      this.productType,
      this.updatedAt});

  Products.fromJson(Map<String, dynamic> json) {
    if (json['productVariant'] != null) {
      productVariant = new List<ProductVariant>();
      json['productVariant'].forEach((v) {
        productVariant.add(new ProductVariant.fromJson(v));
      });
    }
    isPieces = json['isPieces'];
    deliveryCharges = json['deliveryCharges'];
    sId = json['_id'];
    title = json['title'];
    slug = json['slug'];
    image = json['image'];
    productType = json['productType'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productVariant != null) {
      data['productVariant'] =
          this.productVariant.map((v) => v.toJson()).toList();
    }
    data['isPieces'] = this.isPieces;
    data['deliveryCharges'] = this.deliveryCharges;
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['image'] = this.image;
    data['productType'] = this.productType;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class ProductVariant {
  int productQuantityType;
  int salePrice;
  String sId;
  int price;
  String product;
  String createdAt;
  String updatedAt;
  int iV;

  ProductVariant(
      {this.productQuantityType,
      this.salePrice,
      this.sId,
      this.price,
      this.product,
      this.createdAt,
      this.updatedAt,
      this.iV});

  ProductVariant.fromJson(Map<String, dynamic> json) {
    productQuantityType = json['productQuantityType'];
    salePrice = json['salePrice'];
    sId = json['_id'];
    price = json['price'];
    product = json['product'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productQuantityType'] = this.productQuantityType;
    data['salePrice'] = this.salePrice;
    data['_id'] = this.sId;
    data['price'] = this.price;
    data['product'] = this.product;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
