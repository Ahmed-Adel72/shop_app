import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/constants/app_constants.dart';
import 'package:shop_app/core/di/dependency_injection.dart';
import 'package:shop_app/core/routing/app_router.dart';
import 'package:shop_app/core/routing/routes.dart';
import 'package:shop_app/shop_app.dart';
import 'core/helpers/bloc_observer.dart';
import 'core/helpers/cache_helper.dart';

late String initialRoute;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await CacheHelper.init();

  setUpGetIt();
  Bloc.observer = MyBlocObserver();

  token = CacheHelper.getData(key: 'token') ?? '';
  if (token.isNotEmpty && token != null) {
    initialRoute = Routes.layoutScreen;
  } else {
    initialRoute = Routes.loginScreen;
  }

  runApp(ShopApp(
    appRouter: AppRouter(),
  ));
}
