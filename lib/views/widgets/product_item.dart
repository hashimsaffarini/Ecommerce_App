import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/view_models/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductItem extends StatefulWidget {
  final ProductItemModel product;
  const ProductItem({super.key, required this.product});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 111,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: AppColors.grey,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CachedNetworkImage(
                    imageUrl: widget.product.imgUrl,
                    fit: BoxFit.contain,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 8.0,
                right: 8.0,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white54,
                  ),
                  child: BlocBuilder<HomeCubit, HomeState>(
                    bloc: cubit,
                    buildWhen: (previous, current) =>
                        current is deleteOrAdd || current is FavoritesPressed,
                    builder: (context, state) {
                      bool isProductInFavorites = state is deleteOrAdd &&
                          state.productsFav.any(
                            (favProduct) => favProduct.id == widget.product.id,
                          );
                      return IconButton(
                        onPressed: () =>
                            cubit.changeFavorite(widget.product.id),
                        icon: Icon(
                          isProductInFavorites
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: isProductInFavorites
                              ? AppColors.primary
                              : AppColors.black,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4.0),
          Text(
            widget.product.name,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          Text(
            widget.product.category,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Colors.grey,
                ),
          ),
          Text(
            '\$${widget.product.price}',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}
