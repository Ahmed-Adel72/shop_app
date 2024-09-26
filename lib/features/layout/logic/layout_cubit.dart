import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/features/cart/logic/cart_cubit.dart';
import 'package:shop_app/features/cart/ui/cart_screen.dart';
import 'package:shop_app/features/favourites/logic/favourite_cubit.dart';
import 'package:shop_app/features/favourites/ui/favourite_screen.dart';
import 'package:shop_app/features/home/logic/home_cubit.dart';
import 'package:shop_app/features/home/ui/home_screen.dart';
import 'package:shop_app/features/layout/logic/layout_state.dart';
import 'package:shop_app/features/settings/logic/settings_cubit.dart';
import 'package:shop_app/features/settings/ui/settings_screen.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitialState());

  int currentIndex = 0;
  final List<Widget> bottomNavScreens = [
    BlocProvider(
      create: (context) => HomeCubit(),
      child: const HomeScreen(),
    ),
    BlocProvider(
      create: (context) => FavouriteCubit(),
      child: const FavouriteScreen(),
    ),
    BlocProvider(
      create: (context) => CartCubit(),
      child: const CartScreen(),
    ),
    BlocProvider(
      create: (context) => SettingsCubit(),
      child: const SettingsScreen(),
    ),
  ];

  void onTapped(int index) {
    currentIndex = index;
    print(currentIndex);
    emit(OnTappedNavBarState());
  }
}
