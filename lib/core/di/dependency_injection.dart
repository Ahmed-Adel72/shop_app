import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shop_app/core/networking/dio_factory.dart';
import 'package:shop_app/features/login/data/apis/login_api_service.dart';
import 'package:shop_app/features/login/data/repos/login_repo.dart';
import 'package:shop_app/features/login/logic/login_cubit.dart';

final getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  Dio dio = DioFactory.getDio();

  getIt.registerLazySingleton<LoginApiService>(() => LoginApiService(dio));

  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
}
