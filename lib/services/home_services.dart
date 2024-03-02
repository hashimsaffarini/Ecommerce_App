import 'package:ecommerce_app/models/announcement_model.dart';
import 'package:ecommerce_app/models/categories_model.dart';
import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:ecommerce_app/services/firestore_services.dart';
import 'package:ecommerce_app/utils/route/api_paths.dart';

abstract class HomeServices {
  Future<List<ProductItemModel>> getProducts();
  Future<List<AnnouncementModel>> getAnnouncements();
  Future<List<CategoriesModel>> getCategoriesClothes();
  Future<List<CategoriesModel>> getCategoriesDevices();
  Future<ProductItemModel> getProduct(String productId);
  Future<void> removeFromFavorite(String productId, ProductItemModel product);
  Future<List<ProductItemModel>> getProductsFav(String productId);
  Future<void> addToFavorite(String productId, ProductItemModel product);
}

class HomeServicesImpl implements HomeServices {
  final firestoreService = FirestoreService.instance;

  @override
  Future<List<ProductItemModel>> getProducts() async =>
      await firestoreService.getCollection<ProductItemModel>(
        path: ApiPaths.products(),
        builder: (data, documentId) =>
            ProductItemModel.fromMap(data, documentId),
      );

  @override
  Future<List<AnnouncementModel>> getAnnouncements() async =>
      await firestoreService.getCollection<AnnouncementModel>(
        path: ApiPaths.announcements(),
        builder: (data, documentId) =>
            AnnouncementModel.fromMap(data, documentId),
      );

  @override
  Future<List<CategoriesModel>> getCategoriesClothes() async =>
      await firestoreService.getCollection<CategoriesModel>(
        path: ApiPaths.categoryClothe(),
        builder: (data, documentId) =>
            CategoriesModel.fromMap(data, documentId),
      );

  @override
  Future<List<CategoriesModel>> getCategoriesDevices() async =>
      await firestoreService.getCollection<CategoriesModel>(
        path: ApiPaths.categorySmartDevice(),
        builder: (data, documentId) =>
            CategoriesModel.fromMap(data, documentId),
      );

  @override
  Future<ProductItemModel> getProduct(String id) async =>
      await firestoreService.getDocument<ProductItemModel>(
        path: ApiPaths.product(id),
        builder: (data, documentId) =>
            ProductItemModel.fromMap(data, documentId),
      );
  @override
  Future<void> addToFavorite(
          String productId, ProductItemModel product) async =>
      await firestoreService.setData(
        path: ApiPaths.favoriteItem(productId, product.id),
        data: product.toMap(),
      );

  @override
  Future<List<ProductItemModel>> getProductsFav(String productId) async =>
      await firestoreService.getCollection<ProductItemModel>(
        path: ApiPaths.favoriteItems(productId),
        builder: (data, documentId) =>
            ProductItemModel.fromMap(data, documentId),
      );

  @override
  Future<void> removeFromFavorite(
          String productId, ProductItemModel product) async =>
      await firestoreService.deleteData(
        path: ApiPaths.favoriteItem(productId, product.id),
      );
}
