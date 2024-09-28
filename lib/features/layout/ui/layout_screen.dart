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

  Widget _getScreen(int index) {
    switch (index) {
      case 0:
        return BlocProvider(
          create: (context) => getIt<HomeCubit>()..getHomeData(),
          child: const HomeScreen(),
        );
      case 1:
        return BlocProvider(
          create: (context) => FavouriteCubit(),
          child: const FavouriteScreen(),
        );
      case 2:
        return BlocProvider(
          create: (context) => CartCubit(),
          child: const CartScreen(),
        );
      case 3:
        return BlocProvider(
          create: (context) => SettingsCubit(),
          child: const SettingsScreen(),
        );
      default:
        return const HomeScreen(); // Fallback to HomeScreen
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getScreen(_selectedIndex),
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
    );
  }
}
