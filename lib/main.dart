import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/di/dependency_injection.dart';
import 'package:shop_app/core/routing/app_router.dart';
import 'package:shop_app/shop_app.dart';

import 'core/helpers/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  setUpGetIt();
  Bloc.observer = MyBlocObserver();

  runApp(ShopApp(
    appRouter: AppRouter(),
  ));
}
