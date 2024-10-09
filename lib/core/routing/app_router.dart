import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/di/dependency_injection.dart';
import 'package:shop_app/features/categories/logic/categories_cubit.dart';
import 'package:shop_app/features/categories/ui/categories_details.dart';
import 'package:shop_app/features/layout/ui/layout_screen.dart';
import 'package:shop_app/features/login/logic/login_cubit.dart';
import 'package:shop_app/features/login/ui/login_screen.dart';
import 'package:shop_app/features/sign_up/logic/sign_up_cubit.dart';
import 'package:shop_app/features/sign_up/ui/sign_up_screen.dart';

import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignUpCubit>(),
            child: const SignUpScreen(),
          ),
        );
      case Routes.layoutScreen:
        return MaterialPageRoute(
          builder: (_) => const LayoutScreen(),
        );
      case Routes.categorieDeatailsScreen:
        final id = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                getIt<CategoriesCubit>()..getCategorieData(id: id),
            child: CategoriesDetails(
              id: id,
            ),
          ),
        );

      default:
        return null;
    }
  }
}
