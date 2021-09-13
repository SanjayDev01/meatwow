class SingleProduct {
  bool msg;
  Products1 products;

  SingleProduct({this.msg, this.products});

  SingleProduct.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    products = json['products'] != null
        ? new Products1.fromJson(json['products'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.products != null) {
      data['products'] = this.products.toJson();
    }
    return data;
  }
}

class Products1 {
  List<Products2> products;
  String sId;
  String name;

  Products1({this.products, this.sId, this.name});

  Products1.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = new List<Products2>();
      json['products'].forEach((v) {
        products.add(new Products2.fromJson(v));
      });
    }
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}

class Products2 {
  List<Availabilities> availabilities;
  List<ProductVariant1> productVariant;
  // List<Null> tags;
  // List<Null> categories;
  bool isPieces;
  int deliveryCharges;
  String sId;
  String title;
  String slug;
  String image;
  String productType;
  String updatedAt;

  Products2(
      {this.availabilities,
      this.productVariant,
      // this.tags,
      // this.categories,
      this.isPieces,
      this.deliveryCharges,
      this.sId,
      this.title,
      this.slug,
      this.image,
      this.productType,
      this.updatedAt});

  Products2.fromJson(Map<String, dynamic> json) {
    if (json['availabilities'] != null) {
      availabilities = new List<Availabilities>();
      json['availabilities'].forEach((v) {
        availabilities.add(new Availabilities.fromJson(v));
      });
    }
    if (json['productVariant'] != null) {
      productVariant = new List<ProductVariant1>();
      json['productVariant'].forEach((v) {
        productVariant.add(new ProductVariant1.fromJson(v));
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
    image = json['image'];
    productType = json['productType'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.availabilities != null) {
      data['availabilities'] =
          this.availabilities.map((v) => v.toJson()).toList();
    }
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
    data['image'] = this.image;
    data['productType'] = this.productType;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Availabilities {
  bool availability;
  String sId;

  Availabilities({this.availability, this.sId});

  Availabilities.fromJson(Map<String, dynamic> json) {
    availability = json['availability'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['availability'] = this.availability;
    data['_id'] = this.sId;
    return data;
  }
}

class ProductVariant1 {
  int productQuantityType;
  int salePrice;
  String sId;
  int price;
  String product;
  String createdAt;
  String updatedAt;
  int iV;

  ProductVariant1(
      {this.productQuantityType,
      this.salePrice,
      this.sId,
      this.price,
      this.product,
      this.createdAt,
      this.updatedAt,
      this.iV});

  ProductVariant1.fromJson(Map<String, dynamic> json) {
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
