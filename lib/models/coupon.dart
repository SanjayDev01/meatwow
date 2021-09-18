class DiscountCoupon {
  bool msg;
  Coupon coupon;

  DiscountCoupon({this.msg, this.coupon});

  DiscountCoupon.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    coupon =
        json['coupon'] != null ? new Coupon.fromJson(json['coupon']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.coupon != null) {
      data['coupon'] = this.coupon.toJson();
    }
    return data;
  }
}

class Coupon {
  String sId;
  String name;
  int discount;
  String createdAt;
  String updatedAt;
  int iV;

  Coupon(
      {this.sId,
      this.name,
      this.discount,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Coupon.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    discount = json['discount'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['discount'] = this.discount;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
