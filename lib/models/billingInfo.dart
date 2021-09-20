class BillingInfo1 {
  bool msg;
  BiilingInfo biilingInfo;

  BillingInfo1({this.msg, this.biilingInfo});

  BillingInfo1.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    biilingInfo = json['biilingInfo'] != null
        ? new BiilingInfo.fromJson(json['biilingInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.biilingInfo != null) {
      data['biilingInfo'] = this.biilingInfo.toJson();
    }
    return data;
  }
}

class BiilingInfo {
  String sId;
  String name;
  String email;
  String phoneNumber;
  String address;
  String state;
  String city;
  String user;
  String userId;
  String createdAt;
  String updatedAt;
  int iV;
  bool isAnonymous;

  BiilingInfo(
      {this.sId,
      this.name,
      this.email,
      this.userId,
      this.phoneNumber,
      this.address,
      this.state,
      this.city,
      this.user,
      this.createdAt,
      this.isAnonymous,
      this.updatedAt,
      this.iV});

  BiilingInfo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    address = json['address'];
    state = json['state'];
    city = json['city'];
    user = json['user'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['address'] = this.address;
    data['state'] = this.state;
    data['isAnonymous'] = this.isAnonymous;
    data['city'] = this.city;
    data['userId'] = this.userId;
    // data['user'] = this.user;
    //  data['createdAt'] = this.createdAt;
    // data['updatedAt'] = this.updatedAt;
    // data['__v'] = this.iV;
    return data;
  }
}
