import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/routing/app_router.dart';
import 'package:shop_app/shop_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  runApp(ShopApp(
    appRouter: AppRouter(),
  ));
}
