import 'package:flutter/material.dart';
import 'package:shop_app/core/routing/app_router.dart';
import 'package:shop_app/core/routing/routes.dart';

class ShopApp extends StatelessWidget {
  final AppRouter appRouter;
  const ShopApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop app',
      theme: ThemeData(
          primaryColor: Colors.blue, scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.loginScreen,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
