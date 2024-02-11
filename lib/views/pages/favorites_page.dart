import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:ecommerce_app/utils/route/app_routes.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    debugPrint(dummyFavorites.length.toString());
    return ListView.builder(
      itemCount: dummyFavorites.length,
      itemBuilder: (context, index) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              onTap: () => Navigator.of(context, rootNavigator: true)
                  .pushNamed(
                    AppRoutes.productDetails,
                    arguments: dummyProducts[index],
                  )
                  .then((value) => setState(() {})),
              leading: Image.network(
                dummyFavorites[index].imgUrl,
                height: 100,
                width: 70,
                fit: BoxFit.fill,
              ),
              title: Text(
                dummyFavorites[index].name,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: Text(
                '${dummyFavorites[index].category} - \$${dummyFavorites[index].price}',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
              ),
              trailing: IconButton(
                onPressed: () {
                  setState(
                    () {
                      dummyFavorites.remove(dummyFavorites[index]);
                    },
                  );
                },
                icon: const Icon(Icons.favorite),
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
