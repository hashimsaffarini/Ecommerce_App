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
}

class HomeServicesImpl extends HomeServices {
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
}
