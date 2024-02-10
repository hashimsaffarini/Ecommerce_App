import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/views/pages/custom_categories_page.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/categories_model.dart';

class CategoriesTabView extends StatelessWidget {
  const CategoriesTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl:
                'https://cdn.dribbble.com/userupload/7584941/file/original-7699dae5492ee8d64bd9bcd6f2db5a87.jpg',
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),
          ...List.generate(
            dummyCategories.length,
            (mainIndex) {
              final categorySection = dummyCategories[mainIndex];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      categorySection[mainIndex].category,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
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
  }
}
