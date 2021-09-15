class ProductDetails {
  bool msg;
  Product product;

  ProductDetails({this.msg, this.product});

  ProductDetails.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.product != null) {
      data['product'] = this.product.toJson();
    }
    return data;
  }
}

class Product {
  List<ProductVariant> productVariant;
  //List<Null> tags;
  //List<Null> categories;
  bool isPieces;
  int deliveryCharges;
  String sId;
  String title;
  String slug;
  String description;
  String image;
  String productType;

  Product(
      {this.productVariant,
      //this.tags,
      //this.categories,
      this.isPieces,
      this.deliveryCharges,
      this.sId,
      this.title,
      this.slug,
      this.description,
      this.image,
      this.productType});

  Product.fromJson(Map<String, dynamic> json) {
    if (json['productVariant'] != null) {
      productVariant = new List<ProductVariant>();
      json['productVariant'].forEach((v) {
        productVariant.add(new ProductVariant.fromJson(v));
      });
    }
    // if (json['tags'] != null) {
    //   tags = new List<Null>();
    //   json['tags'].forEach((v) {
    //     tags.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['categories'] != null) {
    //   categories = new List<Null>();
    //   json['categories'].forEach((v) {
    //     categories.add(new Null.fromJson(v));
    //   });
    // }
    isPieces = json['isPieces'];
    deliveryCharges = json['deliveryCharges'];
    sId = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    image = json['image'];
    productType = json['productType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productVariant != null) {
      data['productVariant'] =
          this.productVariant.map((v) => v.toJson()).toList();
    }
    // if (this.tags != null) {
    //   data['tags'] = this.tags.map((v) => v.toJson()).toList();
    // }
    // if (this.categories != null) {
    //   data['categories'] = this.categories.map((v) => v.toJson()).toList();
    // }
    data['isPieces'] = this.isPieces;
    data['deliveryCharges'] = this.deliveryCharges;
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['image'] = this.image;
    data['productType'] = this.productType;
    return data;
  }
}

class ProductVariant {
  int productQuantityType;
  int salePrice;
  String sId;
  int price;
  String product;
  int iV;

  ProductVariant(
      {this.productQuantityType,
      this.salePrice,
      this.sId,
      this.price,
      this.product,
      this.iV});

  ProductVariant.fromJson(Map<String, dynamic> json) {
    productQuantityType = json['productQuantityType'];
    salePrice = json['salePrice'];
    sId = json['_id'];
    price = json['price'];
    product = json['product'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productQuantityType'] = this.productQuantityType;
    data['salePrice'] = this.salePrice;
    data['_id'] = this.sId;
    data['price'] = this.price;
    data['product'] = this.product;
    data['__v'] = this.iV;
    return data;
  }
}
