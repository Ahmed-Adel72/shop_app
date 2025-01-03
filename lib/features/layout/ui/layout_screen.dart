import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/di/dependency_injection.dart';
import 'package:shop_app/features/cart/logic/cart_cubit.dart';
import 'package:shop_app/features/cart/ui/cart_screen.dart';
import 'package:shop_app/features/favourites/logic/favourite_cubit.dart';
import 'package:shop_app/features/favourites/ui/favourite_screen.dart';
import 'package:shop_app/features/home/logic/home_cubit.dart';
import 'package:shop_app/features/home/ui/home_screen.dart';
import 'package:shop_app/features/settings/logic/settings_cubit.dart';
import 'package:shop_app/features/settings/ui/settings_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _selectedIndex = 0;
  late HomeCubit _homeCubit;
  late FavouriteCubit _favouriteCubit;
  late CartCubit _cartCubit;
  late SettingsCubit _settingsCubit;

  @override
  void initState() {
    super.initState();
    _initCubits();
  }

  void _initCubits() {
    _homeCubit = getIt<HomeCubit>()..getHomeAndCategoriesData();
    _favouriteCubit = getIt<FavouriteCubit>()..getFavorites();
    _cartCubit = getIt<CartCubit>()..getCarts();
    _settingsCubit = SettingsCubit();
  }

  void _refreshData(int index) {
    switch (index) {
      case 0:
        _homeCubit.getHomeAndCategoriesData();
        break;
      case 1:
        _favouriteCubit.getFavorites();
        break;
      case 2:
        _cartCubit.getCarts();
        break;
      case 3:
        // Refresh settings if needed
        break;
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _refreshData(index);
    });
  }

  @override
  void dispose() {
    _homeCubit.close();
    _favouriteCubit.close();
    _cartCubit.close();
    _settingsCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>.value(value: _homeCubit),
        BlocProvider<FavouriteCubit>.value(value: _favouriteCubit),
        BlocProvider<CartCubit>.value(value: _cartCubit),
        BlocProvider<SettingsCubit>.value(value: _settingsCubit),
      ],
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: const [
            HomeScreen(),
            FavouriteScreen(),
            CartScreen(),
            SettingsScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favourite"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "Cart"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
