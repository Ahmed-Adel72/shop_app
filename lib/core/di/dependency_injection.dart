import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shop_app/core/networking/dio_factory.dart';
import 'package:shop_app/features/cart/data/apis/api_service_stripe.dart';
import 'package:shop_app/features/cart/data/apis/cart_api_service.dart';
import 'package:shop_app/features/cart/data/apis/stripe_service.dart';
import 'package:shop_app/features/cart/data/repos/cart_repo.dart';
import 'package:shop_app/features/cart/data/repos/checkout_repo.dart';
import 'package:shop_app/features/cart/data/repos/checkout_repo_impl.dart';
import 'package:shop_app/features/cart/logic/cart_cubit.dart';
import 'package:shop_app/features/categories/data/apis/categories_api_service.dart';
import 'package:shop_app/features/categories/data/repos/categories_detail_repo.dart';
import 'package:shop_app/features/categories/logic/categories_cubit.dart';
import 'package:shop_app/features/favourites/data/apis/favorites_api_service.dart';
import 'package:shop_app/features/favourites/data/repos/favorites_repo.dart';
import 'package:shop_app/features/favourites/logic/favourite_cubit.dart';
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

  // category details
  getIt.registerLazySingleton<CategoriesApiService>(
      () => CategoriesApiService(dio));
  getIt.registerLazySingleton<CategoriesDetailRepo>(
      () => CategoriesDetailRepo(getIt()));
  getIt.registerFactory<CategoriesCubit>(
      () => CategoriesCubit(getIt(), getIt()));

  getIt.registerLazySingleton<ApiServiceStripe>(() => ApiServiceStripe(Dio()));
  getIt.registerLazySingleton<StripeService>(() => StripeService(getIt()));
  getIt
      .registerLazySingleton<CheckoutRepoImpl>(() => CheckoutRepoImpl(getIt()));
  getIt.registerLazySingleton<CheckoutRepo>(() => CheckoutRepoImpl(getIt()));
  // carts
  getIt.registerLazySingleton<CartApiService>(() => CartApiService(dio));
  getIt.registerLazySingleton<DeleteCart>(() => DeleteCart(dio));
  getIt.registerLazySingleton<CartRepo>(() => CartRepo(getIt(), getIt()));
  getIt.registerFactory<CartCubit>(() => CartCubit(getIt(), getIt()));

  // favorites
  getIt.registerLazySingleton<FavoritesApiService>(
      () => FavoritesApiService(dio));
  getIt.registerLazySingleton<DeleteFavorite>(() => DeleteFavorite(dio));
  getIt.registerLazySingleton<FavoritesRepo>(
      () => FavoritesRepo(getIt(), getIt()));
  getIt.registerFactory<FavouriteCubit>(() => FavouriteCubit(getIt()));
}
