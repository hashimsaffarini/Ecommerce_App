import 'package:ecommerce_app/models/announcement_model.dart';
import 'package:ecommerce_app/models/categories_model.dart';
import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:ecommerce_app/services/auth_services.dart';
import 'package:ecommerce_app/services/home_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final homeServices = HomeServicesImpl();
  final authServices = AuthServicesImpl();

  String img =
      'https://cdn.dribbble.com/userupload/7584941/file/original-7699dae5492ee8d64bd9bcd6f2db5a87.jpg';
  void getHomeCategories() async {
    emit(HomeCategoriesLoading());
    try {
      final categories1 = await homeServices.getCategoriesClothes();
      final categories2 = await homeServices.getCategoriesDevices();
      final categories = [categories1, categories2];
      //await Future.delayed(const Duration(seconds: 2));
      emit(HomeCategoriesLoaded(categories));
    } catch (e) {
      emit(HomeCategoriesError(e.toString()));
    }
  }

  void getHomeData() async {
    emit(HomeLoading());
    try {
      final products = await homeServices.getProducts();
      final announcements = await homeServices.getAnnouncements();
      //await Future.delayed(const Duration(seconds: 1));
      emit(HomeLoaded(products, announcements));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  Future<void> changeFavorite(String productId) async {
    emit(FavoritesPressed());
    try {
      final product = await homeServices.getProduct(productId);
      final currentUser = await authServices.currentUser();

      final productsFav = await homeServices.getProductsFav(currentUser!.uid);

      final isProductInFavorites =
          productsFav.any((favProduct) => favProduct.id == productId);

      if (isProductInFavorites) {
        debugPrint('remove from favorite');
        await homeServices.removeFromFavorite(currentUser.uid, product);
      } else {
        debugPrint('add to favorite');
        await homeServices.addToFavorite(currentUser.uid, product);
      }
      final updatedProductsFav =
          await homeServices.getProductsFav(currentUser.uid);
      debugPrint(updatedProductsFav.length.toString());

      emit(deleteOrAdd(product, updatedProductsFav));
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }

  void changeFavorited() {
    emit(FavoriteChanged(dummyFavorites));
  }
}
