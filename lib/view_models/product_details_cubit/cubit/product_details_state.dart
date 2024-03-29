part of 'product_details_cubit.dart';

sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}

final class ProductDetailsLoading extends ProductDetailsState {}

final class ProductDetailsLoaded extends ProductDetailsState {
  final ProductItemModel product;
  ProductDetailsLoaded(this.product);
}

final class ProductDetailsError extends ProductDetailsState {
  final String messege;

  ProductDetailsError(this.messege);
}

final class AddingToCart extends ProductDetailsState {}

final class AddedToCart extends ProductDetailsState {}

final class AddToCartError extends ProductDetailsState {
  final String message;

  AddToCartError(this.message);
}

final class QuantityChanged extends ProductDetailsState {
  final int quantity;

  QuantityChanged(this.quantity);
}

final class SizeChanged extends ProductDetailsState {
  final ProductSize size;

  SizeChanged(this.size);
}

final class TotalPriceCalculated extends ProductDetailsState {
  final double totalPrice;

  TotalPriceCalculated(this.totalPrice);
}

final class CartItemsLoaded extends ProductDetailsState {
  final List<CartOrdersModel> cartItems;

  CartItemsLoaded(this.cartItems);
}

final class CartItemsError extends ProductDetailsState {
  final String message;

  CartItemsError(this.message);
}
