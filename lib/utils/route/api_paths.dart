class ApiPaths {
  static String products() => 'products/';
  static String product(String id) => 'products/$id';
  static String announcements() => 'announcements/';
  static String categorySmartDevices(String id) =>
      'categories_Smart_Devices/$id';
  static String categorySmartDevice() => 'categories_Smart_Devices/';
  static String categoryClothes(String id) => 'categories_Clothes/$id';
  static String categoryClothe() => 'categories_Clothes/';
  static String user(String uid) => 'users/$uid';
  static String cartItem(String uid, String cartItemId) =>
      'users/$uid/cartItems/$cartItemId';
  static String favoriteItem(String uid, String favoriteItemId) =>
      'users/$uid/favoriteItems/$favoriteItemId';
  static String favoriteItems(String uid) => 'users/$uid/favoriteItems/';
  static String cartItems(String uid) => 'users/$uid/cartItems/';
  static String addresses(String uid) => 'users/$uid/addresses/';
  static String paymentMethods(String uid) => 'users/$uid/paymentMethods/';
}
