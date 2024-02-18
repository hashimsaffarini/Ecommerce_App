import 'package:ecommerce_app/utils/route/app_routes.dart';
import 'package:ecommerce_app/view_models/cubit/home_cubit.dart';
import 'package:ecommerce_app/views/widgets/custom_carousel_indicatior.dart';
import 'package:ecommerce_app/views/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTabView extends StatefulWidget {
  const HomeTabView({super.key});

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context).getHomeData();
  }
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: cubit,
      buildWhen: (previous, current) =>
          current is HomeLoaded ||
          current is HomeError ||
          current is HomeLoading,
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is HomeError) {
          return Center(
            child: Text(state.messege),
          );
        } else if (state is HomeLoaded) {
          final products = state.products;
          final announcements = state.announcements;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24.0),
                  CustomCarouselIndicatior(announcements: announcements),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'New Arrivals',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('See More'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  GridView.builder(
                    itemCount: products.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 25,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => Navigator.of(context, rootNavigator: true)
                            .pushNamed(
                              AppRoutes.productDetails,
                              arguments: products[index],
                            )
                            .then((value) => setState(() {})),
                        child: ProductItem(
                          product: products[index],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
