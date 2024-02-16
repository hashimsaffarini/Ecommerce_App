import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/models/cart_orders_model.dart';
import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ProductItemCart extends StatelessWidget {
  final CartOrdersModel product;
  const ProductItemCart({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 2,
          color: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
          child: Container(
            height: 140,
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: product.product.imgUrl,
                  height: 90,
                ),
                const SizedBox(width: 18),
                Column(
                  children: [
                    Text(
                      product.product.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      product.product.category,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black45,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: ProductSize.values.map(
                        (size) {
                          return Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: product.size == size
                                    ? AppColors.primary
                                    : AppColors.white,
                                radius: 13,
                                child: Text(
                                  size.toString().split('.').last,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: product.size == size
                                        ? AppColors.white
                                        : AppColors.black,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                            ],
                          );
                        },
                      ).toList(),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '\$${product.product.price}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
