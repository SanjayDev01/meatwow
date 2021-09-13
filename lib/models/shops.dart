class ShopResponse {
  final bool msg;
  final dynamic shop;

  ShopResponse({this.msg, this.shop});

  factory ShopResponse.fromJson(Map<String, dynamic> parsedJson) {
    // var user = parsedJson['user'] as Map;
    //         Map<User> users = user.map((i) => User.fromJson(i));

    return ShopResponse(
        msg: parsedJson['msg'],
        shop: parsedJson['shop'] == null
            ? null
            : Shop.fromJson(
                parsedJson['shop'],
              ));
  }
}

class Shop {
  final String id;
  Shop({this.id});

  factory Shop.fromJson(Map<String, dynamic> data) {
    return Shop(
      id: data["_id"],
    );
  }
}
