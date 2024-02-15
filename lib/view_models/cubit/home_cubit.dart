import 'package:ecommerce_app/models/announcement_model.dart';
import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  void getHomeData() async {
    emit(HomeLoading());
    try {
      final products = dummyProducts;
      final announcements = dummyAnnouncements;
      await Future.delayed(const Duration(seconds: 2));
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
