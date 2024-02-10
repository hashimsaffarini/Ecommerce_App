import 'package:ecommerce_app/models/categories_model.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/views/pages/custom_categories_page.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                  filled: true,
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.filter_list_outlined),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                    'Recent Searches',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Clear All'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () {},
              child: const ListTile(
                leading: Icon(Icons.history),
                title: Text('Shoes'),
              ),
            ),
            InkWell(
              onTap: () {},
              child: const ListTile(
                leading: Icon(Icons.history),
                title: Text('T-Shirts'),
              ),
            ),
            InkWell(
              onTap: () {},
              child: const ListTile(
                leading: Icon(Icons.history),
                title: Text('Jeans'),
              ),
            ),
            InkWell(
              onTap: () {},
              child: const ListTile(
                leading: Icon(Icons.history),
                title: Text('Watches'),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                    'Popular Searches 🔥',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold, color: AppColors.primary),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            GridView.builder(
              itemCount: dummyCategories[0].length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: CustomCategories(
                    imgUrl: dummyCategories[0][index].imgUrl,
                    title: dummyCategories[0][index].title,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
