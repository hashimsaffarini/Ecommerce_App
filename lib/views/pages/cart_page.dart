import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/utils/route/app_routes.dart';
import 'package:ecommerce_app/view_models/product_details_cubit/cubit/product_details_cubit.dart';
import 'package:ecommerce_app/views/widgets/product_item_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cubit = BlocProvider.of<ProductDetailsCubit>(context);
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      bloc: cubit,
      buildWhen: (previous, current) =>
          current is CartItemsLoaded ||
          current is TotalPriceCalculated ||
          current is ProductDetailsLoading ||
          current is ProductDetailsError,
      builder: (context, state) {
        if (state is ProductDetailsLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is CartItemsLoaded || state is TotalPriceCalculated) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 13, top: 13),
                        child: Text(
                          'My Cart',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state is CartItemsLoaded
                            ? state.cartItems.length
                            : 0,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 2.6,
                        ),
                        itemBuilder: (_, int index) {
                          final product = state is CartItemsLoaded
                              ? state.cartItems[index]
                              : null;
                          debugPrint('hiiiiiiiiiii $index: $product');
                          return InkWell(
                            onTap: () {},
                            child: ProductItemCart(
                              product: product!,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 65),
              Container(
                height: size.height * 0.235,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: AppColors.grey2,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(35),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 13,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Subtotal: ',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                        ),
                        Text(
                          '\$${state is TotalPriceCalculated ? state.totalPrice : 0.0} ', // This should be dynamically calculated
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Discount: ',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                        ),
                        Text(
                          '%0.00', // This should be dynamically calculated
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total: ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                        Text(
                          '\$${(state is TotalPriceCalculated ? state.totalPrice : 0.0)}', // This should be dynamically calculated
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.white,
                        minimumSize: const Size(300, 39),
                      ),
                      onPressed: () =>
                          Navigator.of(context, rootNavigator: true).pushNamed(
                        AppRoutes.checkoutRoute,
                      ),
                      child: const Text(
                        'Buy Now',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        } else {
          return const Center(
            child: Text('No items in cart'),
          );
        }
      },
    );
  }
}
