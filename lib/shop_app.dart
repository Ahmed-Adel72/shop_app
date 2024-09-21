import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/routing/app_router.dart';
import 'package:shop_app/core/routing/routes.dart';
import 'package:shop_app/core/theming/theme_light.dart';
import 'package:shop_app/main.dart';

class ShopApp extends StatelessWidget {
  final AppRouter appRouter;
  const ShopApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Shop app',
        theme: themeDataLight(),
        debugShowCheckedModeBanner: false,
        initialRoute: initialRoute,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
