import 'package:ecommerce_app/view_models/cubit/home_cubit.dart';
import 'package:ecommerce_app/views/widgets/categories_tab_view.dart';
import 'package:ecommerce_app/views/widgets/home_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = HomeCubit();
        cubit.getHomeData();
        return cubit;
      },
      child: const DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              tabs: <Widget>[
                Tab(
                  text: 'Home',
                ),
                Tab(
                  text: 'Categories',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  HomeTabView(),
                  CategoriesTabView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
