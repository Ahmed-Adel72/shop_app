import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/networking/api_results.dart';
import 'package:shop_app/features/cart/constants/cart_constants.dart';
import 'package:shop_app/features/favourites/constants/favourites_constants.dart';
import 'package:shop_app/features/home/data/models/add_favourite_request_body.dart';
import 'package:shop_app/features/home/data/models/add_favourite_response_body.dart';
import 'package:shop_app/features/home/data/models/add_to_cart_request_body.dart';
import 'package:shop_app/features/home/data/models/add_to_cart_respnse_body.dart';
import 'package:shop_app/features/home/data/models/categories_response_body.dart';
import 'package:shop_app/features/home/data/models/home_response_model.dart';
import 'package:shop_app/features/home/data/repos/home_repo.dart';
import 'package:shop_app/features/home/logic/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(HomeInitialState());
  static HomeCubit get(context) => BlocProvider.of(context);

  void getHomeData() async {
    emit(HomeDataLoadingState());
    final response = await _homeRepo.getHomeDate();
    if (response is Success<HomeResponseModel>) {
      emit(HomeDataSuccessState(response.data));
      response.data.data!.products!.forEach((element) {
        favorites.addAll({element.id: element.inFavorites});
        cart.addAll({element.id: element.inCart});
      });
    } else if (response is Failure<HomeResponseModel>) {
      emit(HomeDataErrorState(response.apiErrorModel));
    }
  }

  Future addAndRemoveFavorite({int? productId}) async {
    final response = await _homeRepo
        .addAndRemoveFavorite(AddFavouriteRequestBody(productId: productId!));
    if (response is Success<AddFavoriteResponseBody>) {
      print("added favorite success");
    } else if (response is Failure<AddFavoriteResponseBody>) {
      print(response.apiErrorModel.message);
    }
    return response;
  }

  Future addOrRemoveCart({required int productId}) async {
    final response = await _homeRepo
        .addAndRemoveCart(AddToCartRequestBody(productId: productId));
    if (response is Success<AddToCartResponseBody>) {
      print("added to cart success");
    } else if (response is Failure<AddToCartResponseBody>) {
      print(response.apiErrorModel.message);
    }
    return response;
  }

  void getCategories() async {
    emit(CategoriesDataLoadingState());
    final response = await _homeRepo.getCategories();
    if (response is Success<CategoriesResponseBody>) {
      emit(CategoriesDataSuccessState(response.data));
    } else if (response is Failure<CategoriesResponseBody>) {
      emit(CategoriesDataErrorState(response.apiErrorModel));
    }
  }

  Future<void> getHomeAndCategoriesData() async {
    emit(HomeDataLoadingState());
    final homeResponse = await _homeRepo.getHomeDate();
    final categoriesResponse = await _homeRepo.getCategories();

    if (homeResponse is Success<HomeResponseModel> &&
        categoriesResponse is Success<CategoriesResponseBody>) {
      homeResponse.data.data!.products!.forEach((element) {
        favorites.addAll({element.id: element.inFavorites});
        cart.addAll({element.id: element.inCart});
      });
      emit(HomeAndCategoriesSuccessState(
          homeResponse.data, categoriesResponse.data));
    } else {
      print("errror");
    }
  }
}
