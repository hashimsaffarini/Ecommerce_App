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
}
