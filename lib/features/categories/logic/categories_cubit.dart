import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/networking/api_results.dart';
import 'package:shop_app/features/categories/data/models/categories_details_response_body.dart';
import 'package:shop_app/features/categories/data/repos/categories_detail_repo.dart';
import 'package:shop_app/features/categories/logic/categories_state.dart';
import 'package:shop_app/features/home/data/models/add_favourite_request_body.dart';
import 'package:shop_app/features/home/data/models/add_favourite_response_body.dart';
import 'package:shop_app/features/home/data/models/add_to_cart_request_body.dart';
import 'package:shop_app/features/home/data/models/add_to_cart_respnse_body.dart';
import 'package:shop_app/features/home/data/repos/home_repo.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesDetailRepo _categorieDetailRepo;
  final HomeRepo _homeRepo;
  CategoriesCubit(this._categorieDetailRepo, this._homeRepo)
      : super(CategorieInitialState());
  static CategoriesCubit get(context) => BlocProvider.of(context);

  void getCategorieData({required int id}) async {
    emit(CategorieLoadingState());
    final response = await _categorieDetailRepo.getCategorieDate(id: id);
    if (response is Success<CategoriesDetailsResponseBody>) {
      emit(CategorieSuccessState(response.data));
    } else if (response is Failure<CategoriesDetailsResponseBody>) {
      emit(CategorieErrorState(response.apiErrorModel));
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
}
