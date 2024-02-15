import 'package:ecommerce_app/models/cart_orders_model.dart';
import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  int counter = 0;
  ProductSize? size;
  ProductDetailsCubit() : super(ProductDetailsInitial());

  void getProductDetails(String productId) async {
    emit(ProductDetailsLoading());
    try {
      final product =
          dummyProducts.firstWhere((element) => element.id == productId);
      await Future.delayed(const Duration(seconds: 1));
      emit(ProductDetailsLoaded(product));
    } catch (e) {
      emit(ProductDetailsError(e.toString()));
    }
  }

  void incrementCounter() {
    counter++;
    emit(QuantityChanged(counter));
  }

  void decrementCounter() {
    if (counter > 1) {
      counter--;
    }
    emit(QuantityChanged(counter));
  }

  void changeSize(ProductSize newSize) {
    size = newSize;
    emit(SizeChanged(size!));
  }

  Future<void> addToCart(String productId) async {
    emit(AddingToCart());
    try {
      await Future.delayed(const Duration(seconds: 1));
      final product =
          dummyProducts.firstWhere((element) => element.id == productId);
      final cartOrder = CartOrdersModel(
        id: DateTime.now().toIso8601String(),
        product: product,
        totalPrice: product.price * counter,
        quantity: counter,
        size: size!,
      );
      dummyCartOrders.add(cartOrder);
      emit(AddedToCart());
    } catch (e) {
      emit(AddToCartError(e.toString()));
    }
  }
}
