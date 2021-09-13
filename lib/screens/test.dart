  // Future<Position> _determinePosition() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;

  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     print('Location services are disabled.');
  //   }

  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       print('Location permissions are denied');
  //     }
  //   }

  //   if (permission == LocationPermission.deniedForever) {
  //     print(
  //         "Location permissions are permanently denied, we cannot request permissions.");
  //   }

  //   return await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  // }

  // getUserLocation() async {
  //   Position position = await _determinePosition();
  //   setState(() {
  //     latitude = position.latitude;
  //     longitude = position.longitude;
  //     if (longitude != null) {
  //       gotLocation = true;
  //     }
  //   });

  //   print("$latitude & $longitude");
  // }

  // String apiUrl = Ur().uri;

  // getProducts() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String refToken = prefs.getString("c_refToken");
  //   String token = prefs.getString("c_access_token");
  //   Uri uri = Uri.http('$apiUrl',
  //       '/shops/find/shop-location?coordinates=72.83039099525789,19.129971122362363');
  //   print(uri);
  //   print("$refToken;$token");

  //   var resShop = await htt.get(uri, headers: {
  //     "Content-Type": "application/json",
  //     "x-api-key": "1nh3ww98d00SS@e3bgsm!ndg",
  //     "Cookie": "$refToken;$token",
  //   });

  //   if (resShop.body != null) {
  //     // print(resShop.body);
  //     var z = ShopResponse.fromJson(json.decode(resShop.body));
  //     var y = z.shop as Shop;
  //     var shopId = y.id;
  //     print(y.id);
  //     Uri ur = Uri.http('$apiUrl',
  //         '/products?limit=10&offset=0&forAdmin=true&shopId=$shopId');
  //     //'/products/chicken-breast');
  //     var resPro = await htt.get(ur, headers: {
  //       "Content-Type": "application/json",
  //       "x-api-key": "1nh3ww98d00SS@e3bgsm!ndg",
  //       "Cookie": "$refToken;$token",
  //     });

  //     if (resPro.body != null) {
  //       var z = ProductResponse.fromJson(json.decode(resPro.body));
  //       var y = z.products as Product;
  //       var x = y.productVariant as ProductVariant;
  //       print(x.sellPrice);
  //       if (x.sellPrice != null) {
  //         setState(() {
  //           productsFetched = true;
  //         });
  //       }
  //     }
  //   } else if (resShop.body == null) {
  //     print("UnSuccess");
  //   }
  // }

  // getAllProducts() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String refToken = prefs.getString("c_refToken");
  //   String token = prefs.getString("c_access_token");

  //   Uri ur = Uri.http('$apiUrl', '/products?limit=10&offset=0&forAdmin=false');
  //   var resProAll = await htt.get(ur, headers: {
  //     "Content-Type": "application/json",
  //     "x-api-key": "1nh3ww98d00SS@e3bgsm!ndg",
  //     "Cookie": "$refToken;$token",
  //   });

  //   if (resProAll.body != null) {
  //     print(resProAll.body);
  //     var z = ProductResponse.fromJson(json.decode(resProAll.body));
  //     var y = z.products as Product;
  //     var x = y.productVariant as ProductVariant;
  //     print(x.sellPrice);
  //     print(y.title);
  //     //int a = x.sellPrice;
  //     if (x.sellPrice != null) {
  //       setState(() {
  //         productsFetched = true;
  //       });
  //     }
  //   }
  //}