import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/utils/route/app_routes.dart';
import 'package:ecommerce_app/view_models/product_details_cubit/cubit/product_details_cubit.dart';
import 'package:ecommerce_app/views/pages/cart_page.dart';
import 'package:ecommerce_app/views/pages/favorites_page.dart';
import 'package:ecommerce_app/views/pages/home_page.dart';
import 'package:ecommerce_app/views/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class CustomBottomNavbar extends StatefulWidget {
  const CustomBottomNavbar({super.key});

  @override
  State<CustomBottomNavbar> createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar> {
  late PersistentTabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      const HomePage(),
      const FavoritesPage(),
      BlocProvider(
        create: (context) => ProductDetailsCubit(),
        child: const CartPage(),
      ),
      const ProfilePage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        inactiveIcon: const Icon(Icons.home_outlined),
        icon: const Icon(Icons.home),
        title: "Home",
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: AppColors.grey,
      ),
      PersistentBottomNavBarItem(
        inactiveIcon: const Icon(Icons.favorite_border_outlined),
        icon: const Icon(Icons.favorite),
        title: "Favorites",
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: AppColors.grey,
      ),
      PersistentBottomNavBarItem(
        inactiveIcon: const Icon(Icons.shopping_cart_outlined),
        icon: const Icon(Icons.shopping_cart),
        title: "Cart",
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: AppColors.grey,
      ),
      PersistentBottomNavBarItem(
        inactiveIcon: const Icon(Icons.person_outline),
        icon: const Icon(Icons.person),
        title: "Profile",
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: AppColors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.all(4.0),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/me.jpg'),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, Hashim',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                'Let\'s go shopping!',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: AppColors.grey,
                    ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true)
                    .pushNamed(
                      AppRoutes.searchPage,
                    )
                    .then((value) => setState(() {}));
              },
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none),
            ),
          ]),
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        stateManagement: false,
        confineInSafeArea: true,
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style1, // Choose the nav bar style with this property.
      ),
    );
  }
}
