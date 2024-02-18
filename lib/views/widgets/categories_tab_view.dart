import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/view_models/cubit/home_cubit.dart';
import 'package:ecommerce_app/views/pages/custom_categories_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesTabView extends StatefulWidget {
  const CategoriesTabView({super.key});

  @override
  State<CategoriesTabView> createState() => _CategoriesTabViewState();
}

class _CategoriesTabViewState extends State<CategoriesTabView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context).getHomeCategories();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: cubit,
      buildWhen: (previous, current) =>
          current is HomeCategoriesLoaded ||
          current is HomeCategoriesError ||
          current is HomeCategoriesLoading,
      builder: (context, state) {
        if (state is HomeCategoriesLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        } else if (state is HomeCategoriesError) {
          return Center(
            child: Text(state.messege),
          );
        } else if (state is HomeCategoriesLoaded) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: cubit.img,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
                ...List.generate(
                  state.categories.length,
                  (mainIndex) {
                    final categorySection = state.categories[mainIndex];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            categorySection[mainIndex].category,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          SizedBox(
                            height: 150,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: categorySection.length,
                              itemBuilder: (context, index) {
                                final categoryItem = categorySection[index];
                                return InkWell(
                                  onTap: () {},
                                  child: CustomCategories(
                                    imgUrl: categoryItem.imgUrl,
                                    title: categoryItem.title,
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
