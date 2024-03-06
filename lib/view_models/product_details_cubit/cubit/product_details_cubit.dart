import 'package:ecommerce_app/models/cart_orders_model.dart';
import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:ecommerce_app/services/auth_services.dart';
import 'package:ecommerce_app/services/product_details_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final productDetailsServices = ProductDetailsServicesImpl();
  final authServices = AuthServicesImpl();
  double sum = 0;
  int counter = 0;
  ProductSize? size;
  ProductDetailsCubit() : super(ProductDetailsInitial());

  void getProductDetails(String productId) async {
    emit(ProductDetailsLoading());
    try {
      final product = await productDetailsServices.getProduct(productId);

      //await Future.delayed(const Duration(seconds: 1));
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
      // await Future.delayed(const Duration(seconds: 1));
      final product = await productDetailsServices.getProduct(productId);
      final cartOrder = CartOrdersModel(
        id: DateTime.now().toIso8601String(),
        product: product,
        totalPrice: product.price * counter,
        quantity: counter,
        size: size!,
      );
      final currentUser = await authServices.currentUser();
      await productDetailsServices.addToCart(currentUser!.uid, cartOrder);
      emit(AddedToCart());
    } catch (e) {
      emit(AddToCartError(e.toString()));
    }
  }

  void calculateTotalPrice() async {
    try {
      final currentUser = await authServices.currentUser();
      final uid = currentUser!.uid;
      final dummyCartOrders = await productDetailsServices.getCartItems(uid);

      sum = 0; // Reset sum before calculating
      for (final product in dummyCartOrders) {
        sum += product.totalPrice;
      }
      emit(TotalPriceCalculated(sum));
    } catch (e) {
      emit(CartItemsError(e.toString()));
    }
  }

  Future<void> getItems() async {
    emit(ProductDetailsLoading());
    try {
      final currentUser = await authServices.currentUser();
      final uid = currentUser!.uid;
      final products = await productDetailsServices.getCartItems(uid);
      emit(CartItemsLoaded(products));
    } catch (e) {
      emit(CartItemsError(e.toString()));
    }
  }
}
