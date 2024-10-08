import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shop_app/core/networking/dio_factory.dart';
import 'package:shop_app/features/home/data/apis/home_api_service.dart';
import 'package:shop_app/features/home/data/repos/home_repo.dart';
import 'package:shop_app/features/home/logic/home_cubit.dart';
import 'package:shop_app/features/login/data/apis/login_api_service.dart';
import 'package:shop_app/features/login/data/repos/login_repo.dart';
import 'package:shop_app/features/login/logic/login_cubit.dart';
import 'package:shop_app/features/sign_up/data/apis/sign_up_api_service.dart';
import 'package:shop_app/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:shop_app/features/sign_up/logic/sign_up_cubit.dart';

final getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  // Dio
  Dio dio = DioFactory.getDio();

  // login
  getIt.registerLazySingleton<LoginApiService>(() => LoginApiService(dio));
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // sign up
  getIt.registerLazySingleton<SignUpApiService>(() => SignUpApiService(dio));
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));

  // home
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<AddAndRemoveFavorite>(
      () => AddAndRemoveFavorite(dio));
  getIt.registerLazySingleton<AddAndRemoveCart>(() => AddAndRemoveCart(dio));
  getIt.registerLazySingleton<GetCategories>(() => GetCategories(dio));
  getIt.registerLazySingleton<HomeRepo>(
      () => HomeRepo(getIt(), getIt(), getIt(), getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
}
