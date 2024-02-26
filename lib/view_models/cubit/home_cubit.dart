import 'package:ecommerce_app/models/announcement_model.dart';
import 'package:ecommerce_app/models/categories_model.dart';
import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:ecommerce_app/services/home_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final homeServices = HomeServicesImpl();
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

  void changeFavorite(String productId) {
    final product =
        dummyProducts.firstWhere((element) => element.id == productId);
    if (product.isFavorite) {
      product.isFavorite = false;
      dummyFavorites.remove(product);
    } else {
      product.isFavorite = true;
      dummyFavorites.add(product);
    }
    emit(FavoriteChanged(dummyFavorites));
  }

  void changeFavorited() {
    emit(FavoriteChanged(dummyFavorites));
  }
}
